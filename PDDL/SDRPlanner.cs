﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace PDDL
{
    class SDRPlanner
    {
        public static bool SDR_OBS { set; get; }

        public enum Planners { FF, FFsa, FFha, MIPS, MetricFF, LPG, FD }
        public enum Translations { SDR, MPSRTagPartitions, MPSRTags }

        private static Dictionary<Thread, Process> FFProcesses = new Dictionary<Thread, Process>();

        public static Planners Planner = Planners.FF;
        //public static Translations Translation = Translations.MPSRTags;
        public static Translations Translation = Translations.SDR;

        public ExecutionData Data{get; private set;}

        public static bool OptimizeMemoryConsumption = false;
        public static bool ComputeCompletePlanTree = true;
        public static TimeSpan PlannerTimeout = new TimeSpan(0, 2, 0);
        public static bool WriteAllKVariations = false;
        public static bool ConsiderStateNegations = false;
        public static bool SplitConditionalEffects = false;
        public static bool RemoveAllKnowledge = true;
        public static bool ForceTagObservations = false;
        public static bool EnforceCNF = false;
        public static bool UseFilesForPlanners = false;
        public static bool UseDomainSpecificHeuristics = false;

        public static bool AddAllKnownToGiven { get; set; }
        public static bool AddTagRefutationToGoal { get; set; }

        public static List<string> SimulationStartState { get; set; }
        public static string GivenPlanFile = null;

        public static int TagsCount { get; set; }

        //TODO - to remove
        public int amount_of_offline_pruned_states;

        public SDRPlanner(string sPath, Domain d, Problem p)
        {
            Data = new ExecutionData(sPath, d, p);
        }
        List<string> Plan(string sPath, PartiallySpecifiedState pssCurrent, int cPlans, out State sChosen)
        {
            sChosen = null;
            List<State> lChosen = new List<State>();
            List<List<string>> lPlans = new List<List<string>>();
            
            for (int iPlan = 0; iPlan < cPlans; iPlan++)
            {
                State sCurrentChosen = null;
                List<string> lPlan = Plan(sPath, pssCurrent, out sCurrentChosen);
                lPlans.Add(lPlan);
                lChosen.Add(sCurrentChosen);
                if (iPlan == 0)
                    sChosen = sCurrentChosen;
            }
             
            return ChooseMaximumLengthPrefix(lPlans);
        }

        private List<string> ChooseMaximumLengthPrefix(List<List<string>> lPlans)
        {
            List<List<string>> lCandidates = new List<List<string>>();
            foreach (List<string> lPlan in lPlans)
            {
                List<string> lClean = new List<string>();
                foreach (string sAction in lPlan)
                {
                    if (!sAction.StartsWith("merge") && !sAction.StartsWith("refute"))
                        lClean.Add(sAction);
                }
                lCandidates.Add(lClean);
            }
            int iCurrentAction = 0;
            while (lCandidates.Count > 1)
            {
                Dictionary<string, List<List<string>>> dActions = new Dictionary<string, List<List<string>>>();
                string sBestAction = "";
                foreach (List<string> lPlan in lCandidates)
                {

                    string sAction = "";
                    if(iCurrentAction < lPlan.Count)
                        sAction = lPlan[iCurrentAction];
                    if (!dActions.ContainsKey(sAction))
                        dActions[sAction] = new List<List<string>>();
                    dActions[sAction].Add(lPlan);
                    if (sBestAction == "" || dActions[sBestAction].Count < dActions[sAction].Count)
                        sBestAction = sAction;
                }
                if (sBestAction == "")
                    break;
                lCandidates = dActions[sBestAction];
                iCurrentAction++;
            }
            return lCandidates.First();
        }

        private List<string> RunPlannerNoFiles(MemoryStream msModels, int iIndex)
        {


            if (Planner != Planners.FF)
                throw new NotImplementedException();

            Process p = new Process();
            FFProcesses[Thread.CurrentThread] = p;
            //p.StartInfo.WorkingDirectory = sPath;
            p.StartInfo.FileName = Program.BASE_PATH + @"\Planners\ff.exe";

            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardInput = true;
            m_sFFOutput = "";
            p.OutputDataReceived += new DataReceivedEventHandler(OutputHandler);

            /*
            StreamWriter sw = new StreamWriter(@"d:\temp\tmp_models.txt");
            msModels.Position = 0;
            StreamReader sr = new StreamReader(msModels);
            sw.Write(sr.ReadToEnd());
            sw.Close();
            */

            p.Start();
            p.BeginOutputReadLine();
            
            /*
            msModels.Position = 0; 
            StreamWriter swTest = new StreamWriter("D:/test.pddl");
            StreamReader srTest = new StreamReader(msModels);
            swTest.Write(srTest.ReadToEnd());
            swTest.Close();
            */

            msModels.Position = 0;
            BinaryReader srModels = new BinaryReader(msModels);

            while (srModels.PeekChar() >= 0)
                p.StandardInput.BaseStream.WriteByte(srModels.ReadByte());

            p.StandardInput.Close();

            if (!p.WaitForExit((int)PlannerTimeout.TotalMilliseconds))//2 minutes max
            {
                p.Kill();
                return null;
            }
            p.WaitForExit();
            List<string> lPlan = null;
            if(m_sFFOutput.Contains("goal can be simplified to TRUE"))
            {
                return new List<string>();
            }
            if (m_sFFOutput.Contains("found legal plan as follows"))
            {
                lPlan = new List<string>();
                string sPlan = m_sFFOutput.Substring(m_sFFOutput.IndexOf("found legal plan as follows"));
                string[] asPlan = sPlan.Split('\n');
                for (int i = 2; i < asPlan.Length; i++)
                {
                    if (!asPlan[i].Contains(":"))
                        break;
                    lPlan.Add(asPlan[i].Substring(asPlan[i].IndexOf(':') + 2).Trim().ToLower());
                }
                if (lPlan.Last().Trim().ToLower() == "reach-goal")
                    lPlan.Remove(lPlan.Last());
            }
            FFProcesses[Thread.CurrentThread] = null;
            if (lPlan == null)
                Console.WriteLine("*");
            return lPlan;
        }

        public List<string> RunPlanner(string sPath, MemoryStream msModel, int iIndex)
        {
            if (SDRPlanner.UseFilesForPlanners)
            {
                if (!RunPlannerWithFiles(sPath, iIndex))
                    return null;
                return ReadPlan(sPath);
            }
            else
            {
                return RunPlannerNoFiles(msModel, iIndex);

            }
        }

        private bool RunPlannerWithFiles(string sPath, int iIndex)
        {

            File.Delete(sPath + "plan.txt");
            File.Delete(sPath + "plan" + iIndex + ".txt");
            File.Delete(sPath + "mipsSolution.soln");
            File.Delete(sPath + "output.sas");
            File.Delete(sPath + "output");
            File.Delete(sPath + "sas_plan");

            if (Planner == Planners.FD)
                return RunFD(sPath, iIndex);

            Process p = new Process();
            FFProcesses[Thread.CurrentThread] = p;
            p.StartInfo.WorkingDirectory = sPath;
            if (Planner == Planners.FF)
                p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ff.exe";
            if (Planner == Planners.MIPS)
            {
                p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\mips-xxl.exe";
                p.StartInfo.Arguments = "-O ";
            }
            if (Planner == Planners.FFsa)
                p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ffsa.exe";
            if (Planner == Planners.FFha)
                p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ffha.exe";
            if (Planner == Planners.MetricFF)
            {
                p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\metric-ff.exe";
                p.StartInfo.Arguments = "-O ";
            }
            if (Planner == Planners.LPG)
            {
                p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\lpg-td-1.0.exe";
                p.StartInfo.Arguments = "-n 1 ";
            }

            if (iIndex != -1)
                p.StartInfo.Arguments += "-o Kd" + iIndex + ".pddl -f Kp" + iIndex + ".pddl";
            else
                p.StartInfo.Arguments += "-o Kd.pddl -f Kp.pddl";

            p.StartInfo.UseShellExecute = false;
            if (Program.RedirectShellOutput)
            {
                p.StartInfo.RedirectStandardOutput = true;
                p.OutputDataReceived += new DataReceivedEventHandler(OutputHandler);
            }
            p.Start();
            if (Program.RedirectShellOutput)
            {
                //string sOutput = p.StandardOutput.ReadToEnd();
                p.BeginOutputReadLine();
            }
            //p.WaitForExit();
            if (!p.WaitForExit((int)PlannerTimeout.TotalMilliseconds))//2 minutes max
            {
                p.Kill();
                return false;
            }
            FFProcesses[Thread.CurrentThread] = null;
            return true;
        }

        public bool RunProcess(Process p, string sInputFile)
        {
            p.StartInfo.UseShellExecute = false;
            FFProcesses[Thread.CurrentThread] = p;
            if (Program.RedirectShellOutput)
            {
                p.StartInfo.RedirectStandardOutput = true;
                p.OutputDataReceived += new DataReceivedEventHandler(OutputHandler);
            }
            if (sInputFile != null)
            {
                p.StartInfo.RedirectStandardInput = true;
            }

            p.Start();
            if (Program.RedirectShellOutput)
            {
                //string sOutput = p.StandardOutput.ReadToEnd();
                p.BeginOutputReadLine();
            }
            if (sInputFile != null)
            {
                StreamReader sr = new StreamReader(p.StartInfo.WorkingDirectory + "/" + sInputFile);
                StreamWriter sw = p.StandardInput;
                while (!sr.EndOfStream)
                    sw.WriteLine(sr.ReadLine());
                sr.Close();
                sw.Close();
            }

            //p.WaitForExit();
            if (!p.WaitForExit((int)PlannerTimeout.TotalMilliseconds))//2 minutes max
            {
                p.Kill();
                return false;
            }
            FFProcesses[Thread.CurrentThread] = null;
            return true;
        }

        public bool RunFD(string sPath, int iIndex)
        {
            Process p = new Process();
            p.StartInfo.WorkingDirectory = sPath;
            //p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ff.exe";
            p.StartInfo.FileName = @"D:\cygwin64\bin\bash.exe";
            p.StartInfo.Arguments = @"D:\cygwin64\home\radimir\FastDownward\src\plan";
            if (iIndex != -1)
                p.StartInfo.Arguments += @" Kd" + iIndex + ".pddl Kp" + iIndex + ".pddl";
            else
                p.StartInfo.Arguments += @" Kd.pddl Kp.pddl";

            
            p.StartInfo.Arguments += " --heuristic \"hlm,hff=lm_ff_syn(lm_rhw(reasonable_orders=true,lm_cost_type=ONE,cost_type=ONE))\" " +
                                    " --search \"lazy_greedy([hff,hlm],preferred=[hff,hlm],cost_type=ONE)\"";
            //p.StartInfo.Arguments += " --heuristic \"hFF=ff(cost_type=1)\" " +
            //                       " --search \"lazy_greedy(hff, preferred=hff)\" ";
            if (!RunProcess(p,null))
                return false;

            return true;
        }


        private bool RunFDII(string sPath, int iIndex)
        {
            Process p = new Process();
            p.StartInfo.WorkingDirectory = sPath;
            //p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ff.exe";
            p.StartInfo.FileName = @"D:\cygwin64\bin\python.exe";

            if (iIndex != -1)
                p.StartInfo.Arguments = @" D:\cygwin64\home\radimir\FastDownward\src\translate\translate.py Kd" + iIndex + ".pddl Kp" + iIndex + ".pddl";
            else
                p.StartInfo.Arguments = @" D:\cygwin64\home\radimir\FastDownward\src\translate\translate.py Kd.pddl Kp.pddl";

            if (!RunProcess(p, null))
                return false;
            p = new Process();
            p.StartInfo.WorkingDirectory = sPath;
            //p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ff.exe";
            p.StartInfo.FileName = @"D:\cygwin64\home\radimir\FastDownward\src\preprocess\preprocess.exe";
            if (!RunProcess(p, "output.sas"))
                return false;

            p = new Process();
            p.StartInfo.WorkingDirectory = sPath;
            //p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ff.exe";
            /*
             --heuristic "hlm,hff=lm_ff_syn(lm_rhw(reasonable_orders=true,lm_cost_type=ONE,cost_type=ONE))"
             --search "lazy_greedy([hff,hlm],preferred=[hff,hlm],cost_type=ONE)"
             */
            p.StartInfo.FileName = @"D:\cygwin64\home\radimir\FastDownward\src\search\downward-1.exe";
            p.StartInfo.Arguments = " --heuristic \"hlm,hff=lm_ff_syn(lm_rhw(reasonable_orders=true,lm_cost_type=ONE,cost_type=ONE))\" " +
                                    " --search \"lazy_greedy([hff,hlm],preferred=[hff,hlm],cost_type=ONE)\"";
            //p.StartInfo.Arguments = " --heuristic \"hFF=ff(cost_type=1)\" " +
            //                       " --search \"lazy_greedy(hff, preferred=hff)\" ";
            if (!RunProcess(p, "output"))
                return false;

            return true;
        }
        private List<string> ReadPlanSimple(string sPlanFile)
        {
            List<string> lPlan = new List<string>();
            if (File.Exists(sPlanFile))
            {
                StreamReader sr = new StreamReader(sPlanFile);
                while (!sr.EndOfStream)
                {
                    string sAction = sr.ReadLine().Trim().ToLower();
                    if (sAction != "")
                        lPlan.Add(sAction);
                }
                sr.Close();
            }
            return lPlan;
        }
        private List<string> ReadPlan(string sPath)
        {
            List<string> lPlan = new List<string>();
            string sPlanFile = "plan.txt";
            if (File.Exists(sPath + sPlanFile))
            {
                StreamReader sr = new StreamReader(sPath + sPlanFile);
                while (!sr.EndOfStream)
                {
                    string sAction = sr.ReadLine().Trim().ToLower();
                    if(sAction != "")
                        lPlan.Add(sAction);
                }
                sr.Close();
            }
            else if (File.Exists(sPath + "mipsSolution.soln"))
            {
                StreamReader sr = new StreamReader(sPath + "mipsSolution.soln");
                while (!sr.EndOfStream)
                {
                    string sLine = sr.ReadLine().Trim().ToLower();
                    if (sLine.Count() > 0 && !sLine.StartsWith(";"))
                    {
                        int iStart = sLine.IndexOf("(");
                        int iEnd = sLine.IndexOf(")");
                        sLine = sLine.Substring(iStart + 1, iEnd - iStart - 1).Trim();
                        lPlan.Add(sLine);
                    }
                }
                sr.Close();
            }
            else if (File.Exists(sPath + "sas_plan"))
            {
                StreamReader sr = new StreamReader(sPath + "sas_plan");
                while (!sr.EndOfStream)
                {
                    string sLine = sr.ReadLine().Trim().ToLower();
                    sLine = sLine.Replace("(", "");
                    sLine = sLine.Replace(")", "");
                    if (sLine.Count() > 0 && !sLine.StartsWith(";") )
                    {
                        int iStart = sLine.IndexOf("(");
                        sLine = sLine.Substring(iStart + 1).Trim();
                        lPlan.Add(sLine);
                    }
                }
                sr.Close();
            }
            else
            {
                /*
                if (SDRPlanner.AddTagRefutationToGoal)
                {
                    SDRPlanner.AddTagRefutationToGoal = false;
                    lPlan = Plan(sPath, pssCurrent, out sChosen);
                }
                else
                 * */

                //throw new Exception("ended");

                return null;
            }

            List<string> lFilteredPlan = new List<string>();
            foreach (string sAction in lPlan)
            {
                if (sAction.Contains("-remove") ||
                    sAction.Contains("-translate"))
                    continue;
                if (sAction.Contains("-add"))
                    lFilteredPlan.Add(sAction.Replace("-add", ""));
                else
                    lFilteredPlan.Add(sAction);

            }

            return lFilteredPlan;
        }

        static bool bFirst = true;

        private bool CheckRelaxedPlan(PartiallySpecifiedState pssCurrent, State sChosen)
        {
            //checking for a deadend
            HashSet<Predicate> lAchievable = new HashSet<Predicate>(sChosen.Predicates);
            bool bNewFound = true;
            while (bNewFound)
            {
                bNewFound = false;
                List<Action> lActions = pssCurrent.Problem.Domain.GroundAllActions(lAchievable, false);
                foreach (Action a in lActions)
                {
                    if (a.Preconditions.IsTrue(lAchievable))
                    {
                        Formula fEffects = a.GetApplicableEffects(lAchievable, false);
                        HashSet<Predicate> lNew = fEffects.GetAllPredicates();
                        foreach (GroundedPredicate gp in lNew)
                        {
                            if (!lAchievable.Contains(gp))
                            {
                                lAchievable.Add(gp);
                                bNewFound = true;
                            }
                        }
                    }
                }
                if (pssCurrent.Problem.Goal.IsTrue(lAchievable))
                    return true;
            }
            return false;
        }

        private List<string> CheckDeadendII(PartiallySpecifiedState pssCurrent, string sPath, State sChosen)
        {
            //checking for a deadend
            MemoryStream msSimpleProblem = pssCurrent.Problem.WriteSimpleProblem(sPath + "sp.pddl", sChosen);
            MemoryStream msSimpleDomain = pssCurrent.Problem.Domain.WriteSimpleDomain(sPath + "sd.pddl");
            MemoryStream msSimple = new MemoryStream();


            BinaryWriter swModels = new BinaryWriter(msSimple);

            msSimpleDomain.Position = 0;
            BinaryReader sr = new BinaryReader(msSimpleDomain);
            while (sr.PeekChar() >= 0)
                swModels.Write(sr.ReadByte());
            swModels.Write('\0');
            swModels.Flush();

            msSimpleProblem.Position = 0;
            sr = new BinaryReader(msSimpleProblem);
            while (sr.PeekChar() >= 0)
                swModels.Write(sr.ReadByte());
            swModels.Write('\0');
            swModels.Flush();

            List<string> lPlan = RunPlanner(sPath, msSimple, -1);
            return lPlan;
        }

        private List<string> Plan(string sPath, PartiallySpecifiedState pssCurrent, PartiallySpecifiedState pssClosed, out State sChosen)
        {
            DirectoryInfo di = new DirectoryInfo(sPath);
            foreach (FileInfo fi in di.GetFiles())
                if ((fi.Name.StartsWith("Kd") || fi.Name.StartsWith("Kp")) && fi.Name.EndsWith(".pddl"))
                    fi.Delete();
            int cTags = 0;

            CompoundFormula cfGoal = new CompoundFormula("or");
            cfGoal.AddOperand(pssCurrent.Problem.Goal);
            if (pssClosed != null)
            {
                CompoundFormula cfAnd = new CompoundFormula("and");
                foreach (GroundedPredicate gp in pssClosed.Observed)
                {
                    if (!pssCurrent.Problem.InitiallyUnknown(gp) && !pssCurrent.Problem.Domain.AlwaysConstant(gp))
                    {
                        if (!pssCurrent.Observed.Contains(gp))
                            cfAnd.AddOperand(gp);
                    }
                }
                if (cfAnd.Operands.Count > 0)
                    cfGoal.AddOperand(cfAnd);
            }
            MemoryStream msModels = null;
            sChosen = pssCurrent.WriteTaggedDomainAndProblem(sPath + "Kd.pddl", sPath + "Kp.pddl", cfGoal, out cTags, out msModels);

            /*if (!CheckRelaxedPlan(pssCurrent, sChosen))
                return null;*/

            MemoryStream msPlan = null;
            List<string> lPlan = null;
            lPlan = RunPlanner(sPath, msModels, -1);
            if (lPlan == null)
            {
                Console.WriteLine("Classical planner failed");
                if (false)
                {
                    //Current problem - not clear how we can identify the problematic line - 
                    //it seems that (affected ?x) applies to all devices on their way to the device, and thus we can distinguish between them
                    //idea - try to connect the suspected problematic line to the other side

                    Parser parser = new Parser();
                    Domain dK = parser.ParseDomain(sPath + "Kd.pddl");
                    Problem pK = parser.ParseProblem(sPath + "Kp.pddl", dK);

                    BFSSolver solver = new BFSSolver();
                    //LandmarkSolver solver = new LandmarkSolver();
                    //solver.IdentifyLandmarks(pK, dK);
                    List<Action> lActions = solver.ManualSolve(pK, dK);
                    if (lActions == null)
                        return null;
                    //ForwardSearchPlanner solver = new ForwardSearchPlanner(dK, pK, new HSPHeuristic(dK, pK.Goal, false));
                    //List<Action> lActions = solver.Plan(pK.GetInitialBelief().ChooseState(false));
                    List<string> lActionNames = new List<string>();
                    foreach (Action a in lActions)
                    {
                        if (a == null)
                            return null;
                        lActionNames.Add(a.Name.Replace("_", " "));
                    }
                    bFirst = false;
                    return lActionNames;
                }              
                return null;
            }

            //lPlan = RemoveRedundantActions(lPlan, pssCurrent, msModels);
            return lPlan;
        }

        private List<string> RemoveRedundantActions(List<string> lPlan, PartiallySpecifiedState pssInit, MemoryStream msModels)
        {
            Parser p = new Parser();
            Domain domain = null;
            Problem problem = null;
            p.ParseDomainAndProblem(msModels, out domain, out problem);
            State sInit = problem.GetInitialBelief().ChooseState(true);
            State sCurrent = sInit, sNext = null;
            List<bool> lUseful = new List<bool>();
            List<HashSet<Predicate>> lEffects = new List<HashSet<Predicate>>();
            List<Action> lActions = new List<Action>();
            for (int i = 0; i < lPlan.Count; i++)
            {
                string sAction = lPlan[i];
                
                lUseful.Add(false);
                sNext = sCurrent.Apply(sAction);
                if (sNext == null)
                    break;
                lEffects.Add(new HashSet<Predicate>());
                lActions.Add(sNext.GeneratingAction);
                foreach (GroundedPredicate gp in sNext.Predicates)
                {
                    if (!sCurrent.Predicates.Contains(gp))
                        lEffects[i].Add(gp);
                }
                HashSet<Predicate> lPreconditions = sNext.GeneratingAction.Preconditions.GetAllPredicates();
                for (int j = 0; j < i; j++)
                {
                    if (lEffects[j].Intersect(lPreconditions).Count() > 0)
                        lUseful[j] = true;
                }
                sCurrent = sNext;

            }
            HashSet<Predicate> lGoal = problem.Goal.GetAllPredicates();
            for (int i = 0; i < lPlan.Count; i++)
            {
                if (lEffects[i].Intersect(lGoal).Count() > 0)
                    lUseful[i] = true;
            }
            List<string> lFiltered = new List<string>();
            for (int i = 0; i < lPlan.Count; i++)
            {
                if (lUseful[i])
                    lFiltered.Add(lPlan[i]);
            }
            return lFiltered;
        }

        private List<string> Plan(string sPath, PartiallySpecifiedState pssCurrent, out State sChosen)
        {
            /*
            sChosen = null;
            pssCurrent.WriteTaggedDomainAndProblem(@"D:\Research\projects\PDDL\CLG_benchmarks\AllKDomains\" + pssCurrent.Problem.Name + ".Kd." +iModel  +".pddl",
                @"D:\Research\projects\PDDL\CLG_benchmarks\AllKDomains\" + pssCurrent.Problem.Name + ".Kp." + iModel + ".pddl");
            iModel++;
            return null;
            */
            DirectoryInfo di = new DirectoryInfo(sPath);
            foreach (FileInfo fi in di.GetFiles())
                if ((fi.Name.StartsWith("Kd") || fi.Name.StartsWith("Kp")) && fi.Name.EndsWith(".pddl"))
                    fi.Delete();
            int cTags = 0;
            //sPath = @"D:\Research\projects\PDDL\CLG_benchmarks\PDDLs\";
            //sChosen = pssCurrent.WriteTaggedDomainAndProblem(sPath + "Kd." + pssCurrent.Problem.Name + "..pddl", sPath + "Kp." + pssCurrent.Problem.Name + "..pddl", out cTags);
            MemoryStream msModels = null;
            sChosen = pssCurrent.WriteTaggedDomainAndProblem(sPath + "Kd.pddl", sPath + "Kp.pddl", out cTags, out msModels);

            if (false)
            {
                //Current problem - not clear how we can identify the problematic line - 
                //it seems that (affected ?x) applies to all devices on their way to the device, and thus we can distinguish between them
                //idea - try to connect the suspected problematic line to the other side

                Parser parser = new Parser();
                Domain dK = parser.ParseDomain(sPath + "Kd.pddl");
                Problem pK = parser.ParseProblem(sPath + "Kp.pddl", dK);

                //BFSSolver solver = new BFSSolver();
                LandmarkSolver solver = new LandmarkSolver();
                solver.IdentifyLandmarks(pK, dK);
                List<Action> lActions = solver.ManualSolve(pK, dK);

                //ForwardSearchPlanner solver = new ForwardSearchPlanner(dK, pK, new HSPHeuristic(dK, pK.Goal, false));
                //List<Action> lActions = solver.Plan(pK.GetInitialBelief().ChooseState(false));
                List<string> lActionNames = new List<string>();
                foreach (Action a in lActions)
                {
                    lActionNames.Add(a.Name.Replace("_", " "));
                }
                bFirst = false;
                return lActionNames;
            }              
            /*
            foreach (Process pFF in Process.GetProcesses())
            {
                if (pFF.ProcessName.ToLower().Contains("ff.exe"))
                    pFF.Kill();
                if (pFF.ProcessName.ToLower().Contains("mips-xxl.exe"))
                    pFF.Kill();
            }
             * */
            MemoryStream msPlan = null;
            List<string> lPlan = null;
            if (!WriteAllKVariations || cTags == 1)
            {
                lPlan = RunPlanner(sPath, msModels, -1);
                if (lPlan == null)
                {
                    Console.WriteLine("FF failed to meet timeout");
                    return null;
                }
                /*
                if (lPlan != null && !pssCurrent.Problem.Domain.Name.Contains("localize") && !pssCurrent.Problem.Domain.Name.Contains("sliding-doors"))
                {
                    List<List<String>> lPlans = new List<List<string>>();
                    lPlans.Add(lPlan);
                    if (cTags > 1)
                        lPlan = ComputeSensingPrefix(lPlans, pssCurrent.Problem.Domain);
                    else
                        lPlan = lPlans[0];
                }
                 * */
            }
            else
            {
                List<List<string>> lPlans = new List<List<string>>();
                for (int i = 0; i < cTags; i++)
                {
                    lPlan = RunPlanner(sPath, msModels, i);
                    if (msPlan == null)
                    {
                        //throw new Exception("FF failed to meet timeout");
                        Console.WriteLine("FF failed to meet timeout");
                        return null;
                    }
                    else
                        lPlans.Add(lPlan);
                }
                /*
                if (ComputePlanSimilarity(lPlans) < 0.2)
                {//learn to distinguish between states
                    if (!RunPlanner(sPath, cTags))
                    {
                        throw new Exception("FF failed to meet timeout");
                    }
                    lPlan = ReadPlan(sPath);
                }
                else
                    lPlan = lPlans[0];
                 */
                //List<string> lJointPlan = ComputeJointPrefix(lPlans, pssCurrent.Problem.Domain);
                //List<string> lJointPlan = ComputeVotingPrefix(lPlans, pssCurrent.Problem.Domain);
                List<string> lJointPlan = ComputeSensingPrefix(lPlans, pssCurrent.Problem.Domain);
                if (lJointPlan.Count == 0)
                {//learn to distinguish between states
                    lPlan = RunPlanner(sPath, msModels, cTags);
                    if (lPlan == null)
                    {
                        //throw new Exception("FF failed to meet timeout");
                        Console.WriteLine("FF failed to meet timeout");
                        return null;
                    }
                }
                else
                    lPlan = lJointPlan;
            }

            
#if DEBUG
            if (lPlan == null || lPlan.Count == 0)
                Debug.WriteLine("BUGBUG");
            else if(!WriteAllKVariations && UseFilesForPlanners)
                VerifyPlan(sPath, lPlan);
#endif           
            return lPlan;
        }

        private double ComputePlanSimilarity(List<string> lPlan1, List<string> lPlan2)
        {
            int i = 0;
            double cIntersection = 0;
            foreach (string sAction in lPlan1)
                if (lPlan2.Contains(sAction))
                    cIntersection++;
            return cIntersection / (lPlan1.Count + lPlan2.Count - cIntersection);
        }

        private double ComputePlanSimilarity(List<List<string>> lPlans)
        {
            double dMinSimilarity = 1.0;
            for (int i = 0; i < lPlans.Count - 1; i++)
            {
                for (int j = i + 1; j < lPlans.Count; j++)
                {
                    double dSim = ComputePlanSimilarity(lPlans[i], lPlans[j]);
                    if (dSim < dMinSimilarity)
                        dMinSimilarity = dSim;
                }
            }
            return dMinSimilarity;
        }
        
        private List<string> ComputeJointPrefix(List<List<string>> lPlans, Domain d)
        {
            List<string> lJointPrefix = new List<string>();
            List<List<string>> lPlansSuffix = new List<List<string>>();
            foreach (List<string> lPlan in lPlans)
                lPlansSuffix.Add(FilterReasoningActions(lPlan));
            string sCurrentAction = "";
            while (lPlansSuffix[0].Count > 0)
            {
                sCurrentAction = lPlansSuffix[0][0];
                bool bAllAgree = true;
                for (int i = 1; i < lPlansSuffix.Count; i++)
                {
                    if (lPlansSuffix[i][0] != sCurrentAction)
                        bAllAgree = false;
                }
                if (bAllAgree)
                {
                    lJointPrefix.Add(sCurrentAction);
                    foreach (List<string> lPlan in lPlansSuffix)
                        lPlan.RemoveAt(0);
                }
                else
                    break;
            }
            //now add all immediate sensing actions
            foreach (List<string> lPlan in lPlansSuffix)
            {
                int iCurrent = 0;
                while (d.IsObservationAction(lPlan[iCurrent]))
                {
                    if(!lJointPrefix.Contains(lPlan[iCurrent]))
                        lJointPrefix.Add(lPlan[iCurrent]);
                    iCurrent++;
                }
            }
            
            return lJointPrefix;
        }

        private List<string> ComputeSensingPrefix(List<List<string>> lPlans, Domain d)
        {
            List<string> lJointPrefix = new List<string>();
            List<List<string>> lPlansSuffix = new List<List<string>>();
            foreach (List<string> lPlan in lPlans)
                lPlansSuffix.Add(FilterReasoningActions(lPlan));
            SameAction sa = new SameAction();

            List<string> lFirstSensingPlan = null, lShortestPlan = null;
            int iFirstSensingAction = -1;
            int iAction = 0;
            int cPlans = lPlansSuffix.Count;
            for (iAction = 0; cPlans > 0 && lFirstSensingPlan == null; iAction++)
            {
                foreach (List<string> lPlan in lPlansSuffix)
                {
                    if (lPlan.Count == iAction)
                    {
                        if(lShortestPlan == null)
                            lShortestPlan = lPlan;
                        cPlans--;
                    }
                    if ( iAction < lPlan.Count && d.IsObservationAction(lPlan[iAction]))
                    {
                        iFirstSensingAction = iAction;
                        lFirstSensingPlan = lPlan;
                    }
                }
            }
            if (lFirstSensingPlan == null)
                lFirstSensingPlan = lShortestPlan;
            if (iFirstSensingAction == -1)
                iFirstSensingAction = lFirstSensingPlan.Count;


            for (iAction = 0; iAction < iFirstSensingAction; iAction++)
            {
                List<List<string>> lNewSuffixes = new List<List<string>>();
                foreach (List<string> lPlan in lPlansSuffix)
                {
                    if(sa.Equals(lPlan[iAction], lFirstSensingPlan[iAction]))
                        lNewSuffixes.Add(lPlan);
                }
                lJointPrefix.Add(lFirstSensingPlan[iAction]);
                lPlansSuffix = lNewSuffixes;
            }
            foreach (List<string> lPlan in lPlansSuffix)
            {
                for (iAction = iFirstSensingAction; iAction < lPlan.Count; iAction++)
                {
                    if (d.IsObservationAction(lPlan[iAction]))
                    {
                        if (!lJointPrefix.Contains(lPlan[iAction]))
                            lJointPrefix.Add(lPlan[iAction]);
                    }
                    else
                        break;
                }
            }
            
            return lJointPrefix;
        }

        private List<string> ComputeVotingPrefix(List<List<string>> lPlans, Domain d)
        {
            List<string> lJointPrefix = new List<string>();
            List<List<string>> lPlansSuffix = new List<List<string>>();
            foreach (List<string> lPlan in lPlans)
                lPlansSuffix.Add(FilterReasoningActions(lPlan));
            string sCurrentAction = "";
            SameAction sa = new SameAction();
            while (lPlansSuffix.Count >= lPlans.Count / 2 && lPlansSuffix[0].Count > 0)
            {
                bool bFoundObservationAction = false;
                Dictionary<string, int> dVotes = new Dictionary<string, int>(sa);
                foreach (List<string> lPlan in lPlansSuffix)
                {
                    if (lPlan.Count > 0)
                    {
                        while (d.IsObservationAction(lPlan[0]))
                        {
                            if (!lJointPrefix.Contains(lPlan[0]))
                            {
                                lJointPrefix.Add(lPlan[0]);
                            }
                            bFoundObservationAction = true;
                            lPlan.RemoveAt(0);
                        }
                        sCurrentAction = lPlan[0];
                        if (!dVotes.ContainsKey(sCurrentAction))
                            dVotes[sCurrentAction] = 0;
                        dVotes[sCurrentAction]++;
                    }
                }
                if (bFoundObservationAction)
                    break;
                string sMaxAction = dVotes.Keys.First();
                foreach (KeyValuePair<string, int> p in dVotes)
                {
                    if (p.Value > dVotes[sMaxAction])
                        sMaxAction = p.Key;
                }
                lJointPrefix.Add(sMaxAction);
                List<List<string>> lNewSuffixes = new List<List<string>>();
                foreach (List<string> lPlan in lPlansSuffix)
                {
                    if (lPlan.Count > 0 && sa.Equals(lPlan[0], sMaxAction))
                    {
                        lPlan.RemoveAt(0);
                        lNewSuffixes.Add(lPlan);
                    }
                }
                lPlansSuffix = lNewSuffixes;
            }
            return lJointPrefix;
        }

        private class SameAction : IEqualityComparer<string>
        {

            #region IEqualityComparer<string> Members

            public bool Equals(string s1, string s2)
            {
                int iTag1Index = s1.IndexOf("-kw-tag") + 7;
                string s1Tag = s1.Substring(iTag1Index, 1).Trim();
                s1 = s1.Replace("-kw-tag" + s1Tag, "");
                int iTag2Index = s2.IndexOf("-kw-tag") + 7;
                string s2Tag = s2.Substring(iTag2Index, 1).Trim();
                s2 = s2.Replace("-kw-tag" + s2Tag, "");
                return s1 == s2;
            }

            public int GetHashCode(string obj)
            {
                return obj.Substring(0, obj.IndexOf("-")).GetHashCode();
            }

            #endregion
        }

        private List<string> FilterReasoningActions(List<string> lPlan)
        {
            List<string> lFiltered = new List<string>();
            foreach (string sAction in lPlan)
            {
                if (sAction.StartsWith("merge") || sAction.StartsWith("unmerge") || sAction.StartsWith("tagrefute") || sAction.StartsWith("tagmerge") || sAction.StartsWith("refute"))
                    continue;
                if (sAction.EndsWith("-t") || sAction.EndsWith("-f"))
                    lFiltered.Add(sAction.Substring(sAction.Length - 2));
                else if (sAction.Contains("-t "))
                    lFiltered.Add(sAction.Replace("-t ", " "));
                else if (sAction.Contains("-f "))
                    lFiltered.Add(sAction.Replace("-f ", " "));
                else
                    lFiltered.Add(sAction);
            }
            return lFiltered;
        }

        private string m_sFFOutput;
        private void OutputHandler(object sendingProcess, DataReceivedEventArgs outLine)
        {
            //Console.WriteLine(outLine.Data);
            m_sFFOutput += outLine.Data + "\n";
        }

        private void VerifyPlan(string sPath, List<string> lPlan)
        {
            Parser p = new Parser();
            Domain domain = p.ParseDomain(sPath + "Kd.pddl");
            Problem problem = p.ParseProblem(sPath + "Kp.pddl", domain);
            State sInit = problem.GetInitialBelief().ChooseState(true);
            State sCurrent = sInit, sNext = null;
            for (int i = 0; i < lPlan.Count; i++)
            {
                string sAction = lPlan[i];
                sNext = sCurrent.Apply(sAction);
                if (sNext == null)
                {
                    Debug.WriteLine("BUGBUG");
                    sNext = sCurrent.Apply(sAction);
                    return;
                }
                sCurrent = sNext;
            }
            if (!problem.IsGoalState(sCurrent))
                Debug.WriteLine("Plan verification failed!");
        }

        TimeSpan tsInPlanning = new TimeSpan();
        public void OfflinePlanningII(string sPath, Domain domain, Problem problem)
        {
            BeliefState bsInitial = problem.GetInitialBelief();
            //if (bsInitial.AvailableActions.Count==0) throw new Exception("Can not create initial belief state!");
            Stack<PartiallySpecifiedState> stateStack = new Stack<PartiallySpecifiedState>();
            DateTime dtStart = DateTime.Now;
            Dictionary<string, List<PartiallySpecifiedState>> dClosedStates = new Dictionary<string, List<PartiallySpecifiedState>>();
            State sChosen = null;
            bool bGoalReached = false;
            bool bDone = false;
            PartiallySpecifiedState pssInitial = bsInitial.GetPartiallySpecifiedState();
            PartiallySpecifiedState pssCurrent = pssInitial;
            List<List<string>> lExecutedPlans = new List<List<string>>();
            List<PartiallySpecifiedState> lGoalStates = new List<PartiallySpecifiedState>();
            Dictionary<GroundedPredicate, Dictionary<PartiallySpecifiedState, List<Action>>> dFinalPlans = new Dictionary<GroundedPredicate, Dictionary<PartiallySpecifiedState, List<Action>>>();
            int cGoalLeaves = 0, cDeadends = 0;
            Formula fObserved = null;

            while (!bDone)
            {
                List<string> lPlan = null;

                lPlan = null;
                Debug.Write("Checking state " + pssCurrent.ToString());
                if (!pssCurrent.IsClosedState(dClosedStates))
                {
                    Debug.WriteLine(" planning");
                    DateTime dtBefore = DateTime.Now;

                    //PartiallySpecifiedState pssClosed = pssCurrent.FindSimilarState(dClosedStates);
                    PartiallySpecifiedState pssClosed = null;

                    lPlan = Plan(sPath, pssCurrent, pssClosed, out sChosen);

                    tsInPlanning += DateTime.Now - dtBefore;
                }
                else
                {
                    Debug.WriteLine(" plan found");
                    pssCurrent.UpdateClosedStates(dClosedStates, domain, true);
                    if (stateStack.Count == 0)
                    {
                        bDone = true;
                        break;
                    }
                    pssCurrent = stateStack.Pop();
                }

                PartiallySpecifiedState pssPlanState = pssCurrent;
                if (lPlan != null)
                {
                    lExecutedPlans.Add(new List<string>());
                    foreach (string sAction in lPlan)
                    {
                        if (!IsReasoningAction(sAction.ToLower()))
                        {
                            PartiallySpecifiedState psTrueState, psFalseState;
                            lExecutedPlans.Last().Add(sAction);
                            Action a = null;

                            if (pssCurrent.IsClosedState(dClosedStates))
                            {
                                //if (!CheckPlan(pssCurrent, pssCurrent.Plan))
                                //    Console.Write("**");
                                pssCurrent.UpdateClosedStates(dClosedStates, domain, true);
                                if (stateStack.Count > 0)
                                    pssCurrent = stateStack.Pop();
                                else
                                    bDone = true;
                                break;
                            }

                            pssCurrent.ApplyOffline(sAction, out a, out fObserved, out psTrueState, out psFalseState);

                            if (psTrueState == null && psFalseState == null)
                                break;
                            if (psFalseState != null)
                            {
                                //stateStack.Push(psFalseState);
                                //pssCurrent = psTrueState;
                                stateStack.Push(psTrueState);
                                pssCurrent = psFalseState;
                                break;
                            }
                            else
                            {
                                pssCurrent = psTrueState;
                                bGoalReached = pssCurrent.IsGoalState();
                                if (bGoalReached)
                                {
                                    cGoalLeaves++;
                                    pssCurrent.UpdateClosedStates(dClosedStates, domain, false);
                                    lGoalStates.Add(pssCurrent);
                                    if (stateStack.Count > 0)
                                    {
                                        pssCurrent = stateStack.Pop();
                                        break;
                                    }
                                    else
                                    {
                                        bDone = true;
                                        break;
                                    }

                                }
                            }
                        }
                    }
                }
                else
                {
                    bGoalReached = pssCurrent.IsGoalState();
                    Debug.WriteLine("Deadend branch detected!");
                    cDeadends++;
                    if (stateStack.Count > 0)
                        pssCurrent = stateStack.Pop();
                    else
                        bDone = true;
                }
            }

            Console.WriteLine("Found " + cDeadends + " deadends and " + cGoalLeaves + " successful paths");

            if (pssInitial.Plan != null)
                Console.WriteLine(pssInitial.Plan);
            Console.WriteLine("Done. Validating plan.");
            if (CheckPlan(pssInitial, pssInitial.Plan))
                Console.WriteLine("Plan validated.");
            else
                Console.WriteLine("Invalid plan!");

            Console.WriteLine("Total time " + (DateTime.Now - dtStart).TotalSeconds);
            Console.WriteLine("Time in planning: " + tsInPlanning.TotalSeconds);
            Console.WriteLine("Time in update closed states: " + PartiallySpecifiedState.tsInUpdateClosed.TotalSeconds);
            Console.WriteLine("Time in is closed state: " + PartiallySpecifiedState.tsInIsClosed.TotalSeconds);

        }

        public void OfflinePlanning(string sPath, Domain domain, Problem problem)
        {
            BeliefState bsInitial = problem.GetInitialBelief();
            //if (bsInitial.AvailableActions.Count==0) throw new Exception("Can not create initial belief state!");
            Stack<PartiallySpecifiedState> stateStack = new Stack<PartiallySpecifiedState>();
            DateTime dtStart = DateTime.Now;
            Dictionary<string, List<PartiallySpecifiedState>> dClosedStates = new Dictionary<string, List<PartiallySpecifiedState>>();
            State sChosen = null;
            bool bGoalReached = false;
            bool bDone = false;
            PartiallySpecifiedState pssInitial = bsInitial.GetPartiallySpecifiedState();
            PartiallySpecifiedState pssCurrent = null;
            List<List<string>> lExecutedPlans = new List<List<string>>();
            List<PartiallySpecifiedState> lGoalStates = new List<PartiallySpecifiedState>();
            Dictionary<GroundedPredicate, Dictionary<PartiallySpecifiedState, List<Action>>> dFinalPlans = new Dictionary<GroundedPredicate, Dictionary<PartiallySpecifiedState, List<Action>>>();
            int cGoalLeaves = 0, cDeadends = 0;
            Formula fObserved = null;

            stateStack.Push(pssInitial);
            while (stateStack.Count > 0)
            {
                List<string> lPlan = null;

                lPlan = null;
                pssCurrent = stateStack.Pop();
                Debug.Write("Checking state " + pssCurrent.ToString());
                bGoalReached = pssCurrent.IsGoalState();
                if (bGoalReached)
                {
                    cGoalLeaves++;
                    pssCurrent.UpdateClosedStates(dClosedStates, domain, false);
                    lGoalStates.Add(pssCurrent);
                    Debug.WriteLine(" goal!");
                }
                else
                {
                    lPlan = null;
                    if (pssCurrent.IsClosedState(dClosedStates))
                    {
                        Debug.WriteLine(" closed state found");
                        pssCurrent.UpdateClosedStates(dClosedStates, domain, true);
                    }
                    else
                    {
                        Debug.WriteLine(" planning");
                        DateTime dtBefore = DateTime.Now;

                        //PartiallySpecifiedState pssClosed = pssCurrent.FindSimilarState(dClosedStates);
                        PartiallySpecifiedState pssClosed = null;

                        lPlan = Plan(sPath, pssCurrent, pssClosed, out sChosen);

                        tsInPlanning += DateTime.Now - dtBefore;

                        PartiallySpecifiedState pssPlanState = pssCurrent;
                        if (lPlan != null)
                        {
                            lExecutedPlans.Add(new List<string>());
                            foreach (string sAction in lPlan)
                            {
                                if (!IsReasoningAction(sAction.ToLower()))
                                {
                                    PartiallySpecifiedState psTrueState, psFalseState;
                                    lExecutedPlans.Last().Add(sAction);
                                    Action a = null;

                                    if (pssCurrent.IsClosedState(dClosedStates))
                                    {
                                        //if (!CheckPlan(pssCurrent, pssCurrent.Plan))
                                        //    Console.Write("**");
                                        pssCurrent.UpdateClosedStates(dClosedStates, domain, true);
                                        break;
                                    }

                                    pssCurrent.ApplyOffline(sAction, out a, out fObserved, out psTrueState, out psFalseState);

                                    if (psTrueState == null && psFalseState == null)
                                    {
                                        stateStack.Push(pssCurrent);
                                        break;
                                    }
                                    if (psFalseState != null) //Switch true and false
                                    {
                                        stateStack.Push(psTrueState);
                                        stateStack.Push(psFalseState);
                                        
                                        break;
                                    }
                                    else
                                    {
                                        if (sAction == lPlan.Last())
                                            stateStack.Push(psTrueState);
                                        else
                                            pssCurrent = psTrueState;
                                    }
                                }
                            }
                        }
                        else
                        {
                            Debug.WriteLine("Deadend branch detected!");
                            pssCurrent.UpdateClosedStates(dClosedStates, domain, true);//maybe not here
                            cDeadends++;
                            if (stateStack.Count > 0)
                                pssCurrent = stateStack.Pop();
                            else
                                bDone = true;
                        }
                    }
                }
            }

            Console.WriteLine("Found " + cDeadends + " deadends and " + cGoalLeaves + " successful paths");

            /*if (pssInitial.Plan != null)
                Console.WriteLine(pssInitial.Plan);
            Console.WriteLine("Done. Validating plan.");
            if (CheckPlan(pssInitial, pssInitial.Plan))
                Console.WriteLine("Plan validated.");
            else
                Console.WriteLine("Invalid plan!");*/
            
            Console.WriteLine("Total time " + (DateTime.Now - dtStart).TotalSeconds);
            Console.WriteLine("Time in planning: " + tsInPlanning.TotalSeconds);
            Console.WriteLine("Time in update closed states: " + PartiallySpecifiedState.tsInUpdateClosed.TotalSeconds);
            Console.WriteLine("Time in is closed state: " + PartiallySpecifiedState.tsInIsClosed.TotalSeconds);

        }


        private bool CheckPlan(PartiallySpecifiedState pssCurrent, ConditionalPlanTreeNode nCurrent)
        {
            if(pssCurrent == null)
                return false;
            if (pssCurrent.IsGoalState())
                return true;

            if (nCurrent.Action == null)
                return false;
            Formula fObserved = null;
            PartiallySpecifiedState psTrueState, psFalseState;

            pssCurrent.ApplyOffline(nCurrent.Action, out fObserved, out psTrueState, out psFalseState);
            if (nCurrent.Action.Observe == null)
                return CheckPlan(psTrueState, nCurrent.SingleChild);
            bool bTrueOk = CheckPlan(psTrueState, nCurrent.TrueObservationChild); 
            bool bFalseOk = CheckPlan(psFalseState, nCurrent.FalseObservationChild);
            return bTrueOk && bFalseOk;
        }

        HashSet<PartiallySpecifiedState> lFail = new HashSet<PartiallySpecifiedState>();

        private bool CompareRelevantVariables(PartiallySpecifiedState pssSource, PartiallySpecifiedState pssTarget, List<Action> lPlan, Domain d)
        {
            HashSet<Predicate> hsKnownPredicates = new HashSet<Predicate>();

            foreach (GroundedPredicate gpKnown in pssSource.Observed)
            {
                if (d.AlwaysKnown(gpKnown))
                {
                    if (!pssTarget.Observed.Contains(gpKnown))
                        return false;
                    else hsKnownPredicates.Add(gpKnown);
                }
            }
            foreach (Action a in lPlan)
            {
                HashSet<Predicate> lPreconditions = a.Preconditions.GetAllPredicates();
                foreach (Predicate p in lPreconditions)
                {
                    if (!d.AlwaysKnown(p))
                    {
                        if (!pssTarget.Observed.Contains(p))
                            return false;
                        else hsKnownPredicates.Add(p);
                    }
                }
            }
            /*if (pssSource.Predecessor.m_lOfflinePredicatesKnown != null)
            {
                foreach (Predicate p in hsKnownPredicates)
                {
                    Predicate pNegate = p.Negate();
                    if (pssSource.Predecessor.m_lOfflinePredicatesKnown.Contains(pNegate))
                    {
                        if (p.Negation) pssSource.Predecessor.m_lOfflinePredicatesUnknown.Add(pNegate);
                        else pssSource.Predecessor.m_lOfflinePredicatesUnknown.Add(p);
                        //pssSource.Predecessor.m_lOfflinePredicatesKnown.Remove();
                    }
                }
            }
            else pssSource.Predecessor.m_lOfflinePredicatesKnown = hsKnownPredicates;*/
            return true;
        }


        public void OnlineReplanning(string sPath, Domain domain, Problem problem, out int cActions, out int cPlanning, out int cObservations, out TimeSpan tsTime)
        {
            //RandomGenerator.Init(iSeed++);
            BeliefState bsInitial = problem.GetInitialBelief();//, bsCurrent = bsInitial, bsNext = null;
            bsInitial.UnderlyingEnvironmentState = null;
            State s = bsInitial.ChooseState(true);
            
            PartiallySpecifiedState pssCurrent = bsInitial.GetPartiallySpecifiedState(), pssNext = null;
            List<State> lTrueStates = new List<State>();
            lTrueStates.Add(pssCurrent.UnderlyingEnvironmentState);
            List<string> lActions = new List<string>();

            List<List<string>> lExecutedPlans = new List<List<string>>();
            List<State> lChosen = new List<State>();

            /*
            List<State> lStates = new List<State>();
            Process proc = Process.GetCurrentProcess();
            for (int i = 0; i < 1000; i++)
            {
                Console.Write("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b" + i + ", " + (proc.WorkingSet64 / 1000000));
                lStates.Add(bsInitial.ChooseState(true));
            }
            */

            Formula fObserved = null;
            cActions = 0;
            cPlanning = 0;
            cObservations = 0;

            bool bPlanEndedSuccessfully = false, bGoalReached = false;
            DateTime dtStart = DateTime.Now;
            while (!bGoalReached)
            {
                State sChosen = null;


                if (cActions >= 100000)
                    break;
                //used only for finding loops
                if (lExecutedPlans.Count > 4)
                {
                    if (pssCurrent.Equals(pssCurrent.Predecessor.Predecessor))
                    {
                        if (pssCurrent.Predecessor.Equals(pssCurrent.Predecessor.Predecessor.Predecessor))
                        {
                            if (SameList(lExecutedPlans[lExecutedPlans.Count - 1], lExecutedPlans[lExecutedPlans.Count - 3]))
                            {
                                if (SameList(lExecutedPlans[lExecutedPlans.Count - 2], lExecutedPlans[lExecutedPlans.Count - 4]))
                                {
                                    //throw new Exception("stuck in a loop");
                                    //Console.WriteLine("Stuck in a loop");
                                }
                            }
                        }
                    }
                    bool bAllEmpty = true;
                    for (int i = 1; i <= 4; i++)
                        if (lExecutedPlans[lExecutedPlans.Count - i].Count != 0)
                            bAllEmpty = false;
                    if(bAllEmpty)
                        throw new Exception("stuck in a loop");
                }

                //List<string> lPlan = MineSweeperPlan(pssCurrent, domain);
                
                List<string> lPlan = null;
                if (GivenPlanFile != null)
                    lPlan = ReadPlanSimple(GivenPlanFile);
                else
                {
                    if (UseDomainSpecificHeuristics)
                    {
                        if (domain.Name.Contains("LargeWumpus"))
                            lPlan = LargeWumpusDomain.LargeWumpusHeuristic(pssCurrent, domain);
                        else if (domain.Name.Contains("Battleship"))
                            lPlan = Battleship.BattleshipHeuristic(pssCurrent, domain, fObserved);
                        else if (domain.Name.Contains("MineSweeper"))
                            lPlan = MineSweeper.MineSweeperHeuristic(pssCurrent, domain, fObserved);
                        else if (domain.Name.Contains("sliding-doors"))
                            lPlan = ChooseLocalizeAction(pssCurrent, domain);
                        else if (domain.Name.Contains("RockSample"))
                            lPlan = RockSample.RockSampleHeuristic(pssCurrent, domain);
                        else if (domain.Name.Contains("MasterMind"))
                            lPlan = MasterMind.MasterMindHeuristic(pssCurrent, domain);
                        else
                            lPlan = Plan(sPath, pssCurrent, out sChosen);
                    }
                    else
                        lPlan = Plan(sPath, pssCurrent, out sChosen);
                }
                cPlanning++;
                lChosen.Add(sChosen);
                bPlanEndedSuccessfully = true;

                lExecutedPlans.Add(new List<string>());

                if (lPlan != null)
                {
                    foreach (string sAction in lPlan)
                    {

                        if (!IsReasoningAction(sAction.ToLower()))
                        {
                            Console.Write("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b" +
                                domain.Name + ": " + cActions + "/" + lPlan.Count + ", memory:" + Process.GetCurrentProcess().PrivateMemorySize64/1000000 + "MB        ");
                                //domain.Name + ": " + cActions + "/" + lPlan.Count + ", predicates:" + Predicate.PredicateCount + ", formulas:" + Formula.FormulaCount + ", observed: " + pssCurrent.Observed.Count() + "   ");
                            Debug.WriteLine("");
                            TimeSpan ts = DateTime.Now - dtStart;
                            if (ts.TotalMinutes > 60)
                                throw new Exception("Execution taking too long");
                            Debug.WriteLine((int)(ts.TotalMinutes) + "," + cActions + ") " + domain.Name + ", executing action " + sAction);
 
                            lExecutedPlans.Last().Add(sAction);
                            DateTime dtBefore = DateTime.Now;
                            //bsNext = bsCurrent.Apply(sAction, out fObserved);
                                   
                            pssNext = pssCurrent.Apply(sAction, out fObserved);
                            Debug.WriteLine("Apply time: " + (DateTime.Now - dtBefore).TotalSeconds);
                            if (pssNext == null /*&& !sAction.ToLower().Contains("-kw")*/)
                            {
                                bPlanEndedSuccessfully = false;
                                Debug.WriteLine(domain.Name + ", cannot execute " + sAction);

                                if (domain.Name.Contains("RockSample"))
                                {
                                    //cActions = 1000;
                                }

                                break;
                            }
                            else
                            {
                                lTrueStates.Add(pssNext.UnderlyingEnvironmentState);

                                if (pssNext != null)
                                {
                                    lActions.Add(sAction);

                                    if (SDR_OBS)
                                    {
                                        List<Action> lObservationActions = bsInitial.Problem.Domain.GroundAllObservationActions(pssNext.Observed, true);
                                        foreach (Action a in lObservationActions)
                                        {
                                            Predicate pObserve = ((PredicateFormula)a.Observe).Predicate;
                                            if (!pssNext.Observed.Contains(pObserve) && !pssNext.Observed.Contains(pObserve.Negate()))
                                            {
                                                pssNext = pssNext.Apply(a, out fObserved);
                                                cObservations++;
                                                Debug.WriteLine(domain.Name + ", observed " + fObserved);
                                                cActions++;
                                            }
                                        }
                                    }
                                    cActions++;
                                    pssCurrent = pssNext;
                                    if (fObserved != null)
                                    {
                                        cObservations++;
                                        Debug.WriteLine(domain.Name + ", observed " + fObserved);

                                        //bPlanEndedSuccessfully = false;
                                        //break;
                                        /*
                                        if (!WriteAllKVariations)
                                        {
                                            bPlanEndedSuccessfully = false;
                                            break;
                                        }
                                         * */
                                    }
                                }
                                else
                                {
                                    //Debug.WriteLine("Skipping inapplicable KW action...");
                                }
                           }
                        }
                    }
                }
                //if (cActions > 60)
                //    Console.Write("*");
                if (bPlanEndedSuccessfully)
                {
                    DateTime dtBefore = DateTime.Now;
                    bGoalReached = pssCurrent.IsGoalState();
                    Debug.WriteLine("Goal time: " + (DateTime.Now - dtBefore).TotalSeconds);
                }
                else
                {
                    GroundedPredicate gpDead = new GroundedPredicate("dead");
                    if (pssCurrent.Observed.Contains(gpDead))
                        bGoalReached = true;
                    if (domain.Name.Contains("mines-"))
                        break;
                }
            }
            bool b = pssCurrent.IsGoalState();
            tsTime = DateTime.Now - dtStart;
            Console.WriteLine();
            Debug.WriteLine("Average time - " + tsTime.TotalSeconds * 1.0 / cActions);
            Debug.WriteLine("*******************************************************************************");
        }


        private List<string> ChooseRandomAction(PartiallySpecifiedState pssCurrent, Domain d)
        {
            List<Action> lActions = d.GroundAllActions(pssCurrent.Observed, true);
            List<Action> lEffectsActions = new List<Action>();
            List<string> lPlan = new List<string>();
            int iOpen = -1;
            foreach (Action a in lActions)
            {
                if (a.Observe != null && a.Effects == null)//pure observation actions go first
                    lPlan.Add(a.Name.Replace("_", " "));
                else
                    lEffectsActions.Add(a);
                if (a.Name.StartsWith("open"))
                    iOpen = lEffectsActions.Count - 1;
            }
            if (iOpen >= 0)
            {
                lPlan.Add(lEffectsActions[iOpen].Name.Replace("_", " "));
            }
            else
            {
                int iRnd = RandomGenerator.Next(lEffectsActions.Count);
                lPlan.Add(lEffectsActions[iRnd].Name.Replace("_", " "));
            }
            return lPlan;
        }

        static int iStep = 0;
        private List<string> MineSweeperPlan(PartiallySpecifiedState pssCurrent, Domain d)
        {
            List<string> lPlan = new List<string>();
            
            if (iStep == 0)
            {
                lPlan.Add("open-cell-at-step" + iStep);
                iStep++;
            }
            else
            {
                foreach (GroundedPredicate gp in pssCurrent.Observed)
                {
                    if (gp.Name == "need-gather-obs0-at" && gp.Negation == false)
                    {
                        Constant c = gp.Constants[0];
                        for (int i = 0; i < 9; i++)
                        {
                            lPlan.Add("gather-obs" + i + " " + c.Name);
                            lPlan.Add("advance-gather-counter" + i + " " + c.Name);
                        }
                        lPlan.Add("advance-step");

                        int[] aFlagSteps = new int[] { 5, 6, 7, 9 };
                        while (aFlagSteps.Contains(iStep))
                        {
                            lPlan.Add("put-flag-at-step" + iStep);
                            lPlan.Add("advance-step");
                            iStep++;
                        }

                        lPlan.Add("open-cell-at-step" + iStep);
                        iStep++;
                    }

                }
            }
            return lPlan;
        }

        bool bFirstLocalize = true;

        private List<string> ChooseLocalizeAction(PartiallySpecifiedState pssCurrent, Domain d)
        {
            List<string> lPlan = new List<string>();
            if (bFirstLocalize)
                bFirstLocalize = false;
            else
            {
                bool bValidUp = pssCurrent.Observed.Contains(new GroundedPredicate("free-up"));
                bool bValidRight = pssCurrent.Observed.Contains(new GroundedPredicate("free-right"));
                bool bValidDown = pssCurrent.Observed.Contains(new GroundedPredicate("free-down"));
                bool bValidLeft = pssCurrent.Observed.Contains(new GroundedPredicate("free-left"));
                /*
                List<string> lMoveActions = new List<string>();
                if (bValidDown)
                    lMoveActions.Add("move-down");
                if (bValidUp)
                    lMoveActions.Add("move-up");
                if (bValidLeft)
                    lMoveActions.Add("move-left");
                if (bValidRight)
                    lMoveActions.Add("move-right");
                Random rnd = new Random();
                int idx = rnd.Next(lMoveActions.Count);
                lPlan.Add(lMoveActions[idx]);
                 */
                if (bValidUp)
                    lPlan.Add("move-up");
                else if (bValidRight)
                    lPlan.Add("move-right");

            }

            lPlan.Add("checking");
            lPlan.Add("sense-left");
            lPlan.Add("sense-right");
            lPlan.Add("sense-up");
            lPlan.Add("sense-down");            

            
            return lPlan;
        }


        //static int iSeed = 0;
        public void OnlineReplanningII(string sPath, Domain domain, Problem problem, out int cActions, out int cPlanning, out int cObservations, out TimeSpan tsTime)
        {
            DateTime dtStart = DateTime.Now;
            //RandomGenerator.Init(iSeed++);
            BeliefState bsInitial = problem.GetInitialBelief();//, bsCurrent = bsInitial, bsNext = null;
            //bsInitial.ToSimpleForm();
            bsInitial.UnderlyingEnvironmentState = null;
            State s = bsInitial.ChooseState(true), sCurrent = null, sNext = null;
            PartiallySpecifiedState pssCurrent = bsInitial.GetPartiallySpecifiedState(), pssNext = null;
            //while (true)
            //    s = bsInitial.ChooseState();
            List<BeliefState> lStates = new List<BeliefState>();
            lStates.Add(bsInitial);
            List<string> lActions = new List<string>();

            List<List<string>> lExecutedPlans = new List<List<string>>();
            List<State> lChosen = new List<State>();

            Formula fObserved = null;
            cActions = 0;
            cPlanning = 0;
            cObservations = 0;

            bool bPlanEndedSuccessfully = false, bGoalReached = false;
            while (!bGoalReached)
            {
                State sChosen = null;

                if (lExecutedPlans.Count > 4)
                {
                    if (lChosen[lChosen.Count - 1] == null || lChosen[lChosen.Count - 1].Equals(lChosen[lChosen.Count - 3]))
                    {
                        if (lChosen[lChosen.Count - 2] == null || lChosen[lChosen.Count - 2].Equals(lChosen[lChosen.Count - 4]))
                        {
                            if (SameList(lExecutedPlans[lExecutedPlans.Count - 1], lExecutedPlans[lExecutedPlans.Count - 3]))
                            {
                                if (SameList(lExecutedPlans[lExecutedPlans.Count - 2], lExecutedPlans[lExecutedPlans.Count - 4]))
                                {
                                    throw new Exception("stuck in a loop");
                                    //Console.WriteLine("Stuck in a loop");
                                }
                            }
                        }
                    }
                }

                List<string> lPlan = Plan(sPath, pssCurrent, out sChosen);
                cPlanning++;
                sCurrent = sChosen;
                lChosen.Add(sChosen);
                bPlanEndedSuccessfully = true;

                lExecutedPlans.Add(new List<string>());

                if (lPlan != null)
                {
                    foreach (string sAction in lPlan)
                    {
                        if (!IsReasoningAction(sAction.ToLower()))
                        {
                            TimeSpan ts = DateTime.Now - dtStart;
                            if (ts.TotalMinutes > 60)
                                throw new Exception("Execution taking too long");
                            Debug.WriteLine((int)(ts.TotalMinutes) + "," + cActions + ") " + domain.Name + ", executing action " + sAction);

                            lExecutedPlans.Last().Add(sAction);

                            //bsNext = bsCurrent.Apply(sAction, out fObserved);
                            pssNext = pssCurrent.Apply(sAction, out fObserved);

                            if (fObserved != null)
                            {
                                cObservations++;
                                Debug.WriteLine(domain.Name + ", observed " + fObserved);
                            }
                            if (pssNext == null)
                            {
                                bPlanEndedSuccessfully = false;
                                Debug.WriteLine(domain.Name + ", cannot execute " + sAction);
                                break;
                            }

                            lActions.Add(sAction);

                            if (SDR_OBS)
                            {
                                List<Action> lObservationActions = bsInitial.Problem.Domain.GroundAllObservationActions(pssNext.Observed, true);
                                foreach (Action a in lObservationActions)
                                {
                                    Predicate pObserve = ((PredicateFormula)a.Observe).Predicate;
                                    if (!pssNext.Observed.Contains(pObserve) && !pssNext.Observed.Contains(pObserve.Negate()))
                                    {
                                        pssNext = pssNext.Apply(a, out fObserved);
                                        cObservations++;
                                        Debug.WriteLine(domain.Name + ", observed " + fObserved);
                                        cActions++;
                                    }
                                }
                            }

                            //if (pssNext == null && bsNext != null)
                            //    break;
                            //if (pssNext != null && bsNext != null)
                            //    if (pssNext.IsGoalState() != bsNext.IsGoalState())
                            //        Console.WriteLine("BUGBUG");
                            sNext = sCurrent.Apply(sAction);
                            /*
                            if (bsNext == null)
                            {
                                Console.WriteLine(domain.Name + ", action failed");
                                break;
                            }
                            */
                            cActions++;
                            //lStates.Add(bsNext);
                            //bsCurrent = bsNext;
                            sCurrent = sNext;
                            pssCurrent = pssNext;
                            /*
                            if (pssCurrent != null && pssCurrent.IsGoalState())
                            {
                                Console.WriteLine("PSS: goal");
                                break;
                            }
                            */
                            if (!pssNext.ConsistentWith(sNext))
                            {
                                bPlanEndedSuccessfully = false;
                                Debug.WriteLine(domain.Name + ", state inconsistent with the belief");
                                break;
                            }

                        }
                    }
                }
                if (bPlanEndedSuccessfully)
                    bGoalReached = pssCurrent.IsGoalState();
            }
            bool b = pssCurrent.IsGoalState();
            tsTime = DateTime.Now - dtStart;
            Debug.WriteLine("*******************************************************************************");
        }

        private bool SameList(List<string> l1, List<string> l2)
        {
            if (l1 == null && l2 == null)
                return true;
            if (l1 == null && l2 != null)
                return false;
            if (l1 != null && l2 == null)
                return false;

            if (l1.Count != l2.Count)
                return false;
            for (int i = 0; i < l1.Count; i++)
                if (l1[i] != l2[i])
                    return false;
            return true;
        }

        private bool IsReasoningAction(string sAction)
        {
            if (sAction.StartsWith("merge") || sAction.StartsWith("refute") || sAction.StartsWith("unmerge") || sAction.StartsWith("tagmerge"))
                return true;
            if (sAction.Contains("knowledgegain") || sAction.Contains("knowledgeloss"))
                return true;
            if (!sAction.StartsWith("r"))
                return false;
            for (int i = 1; i < sAction.Length; i++)
                if (sAction[i] < '0' || sAction[i] > '9')
                    return false;
            return true;
        }

        public void Start()
        {
            int cActions = 0, cPlanning = 0, cObservations = 0;
            TimeSpan tsTime;
#if !DEBUG

            try
#endif
            {
                Stopwatch sw = new Stopwatch();
                sw.Start();
                //OnlineReplanning(Data.Path, Data.Domain, Data.Problem, out cActions, out cPlanning, out cObservations, out tsTime);
                OfflinePlanning(Data.Path, Data.Domain, Data.Problem);
                sw.Stop();
                Console.WriteLine("Total time:" + sw.Elapsed);
                Data.Actions = cActions;
                Data.Planning = cPlanning;
                //Data.Time = tsTime;
                Data.Observations = cObservations;
            }
#if !DEBUG
            catch (Exception e)
            {
                 Data.Exception = e.ToString();
                Console.Error.WriteLine(e);
                Console.Error.WriteLine("FAILED: " + Data.Domain.Name + ", " + Data.Problem.Name);
            }
#endif
        }

        public void TerminateFFPRocesses(Thread t)
        {
            if (FFProcesses.ContainsKey(t))
            {
                if (FFProcesses[t] != null)
                {
                    if(!FFProcesses[t].HasExited)
                        FFProcesses[t].Kill();
                    FFProcesses[t].WaitForExit();
                }
                FFProcesses.Remove(t);
            }
        }

        public class ExecutionData
        {
            public int Observations { get; set; }
            public int Actions { get; set; }
            public int Planning { get; set; }
            public TimeSpan Time { get; set; }
            public Domain Domain { get; set; }
            public Problem Problem { get; set; }
            public string Path { get; set; }
            public string Exception { get; set; }
            public bool Failure { get { return Exception != ""; } }

            public ExecutionData(string sPath, Domain d, Problem p)
            {
                Domain = d;
                Problem = p;
                Path = sPath;
                Exception = "";
            }
            


        }



    }


}
