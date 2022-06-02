using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Threading;
using UCLouvain.BDDSharp;

namespace CPOR_MA
{
    class Program
    {
        public static string BASE_PATH = @"D:\Dropbox\SDR\Offline";        
        public static string Path;
        public static string childDomainFolder = "";
        private static int sBacktrackNumber = 0;
        private static string aStaticBasePath = "";
        public static void Main(string[] args)
        {
            DateTime start = DateTime.Now;
            CPORMain cPOR_Main;
            StageTwoPlanPlusProblem stageTwoPlanPlusProblem;
            
            int randomaNumberOfBacktracks = 1;

            /** Starts from this point when a backtracking happens. **/
            Reexecute:
            DateTime lastIteration = DateTime.Now;

            string sBenchmarkPath = BASE_PATH + @"\CLG_benchmarks\BP\";
            // string sBenchmarkPath = BASE_PATH + @"\CLG_benchmarks\ROVER\";
            // string sBenchmarkPath = BASE_PATH + @"\CLG_benchmarks\HSD17JAN\";

            string problemName = "B9";

            Path = BASE_PATH + @"\PDDL\";                        
            Boolean ifProjectionApproach = true;
            string[] asBenchmarks;
            if (sBacktrackNumber == 0)
            {
                asBenchmarks = new string[]{ problemName };
                aStaticBasePath = sBenchmarkPath + asBenchmarks[0] + "\\" + asBenchmarks[0];
            }
            else
            {
                asBenchmarks = new string[] { problemName + "\\" + problemName + (sBacktrackNumber - 1) };
            }            
            
            /** Save each compressed tree for which the dedicated agent has failed to plan. **/
            Dictionary<Constant, ConditionalPlanTreeNode> 
                agentFailedPlanTrees = new Dictionary<Constant, ConditionalPlanTreeNode>();

            /** GOTO is doing the same what the below for-loop with cFailure was doing. **/
            int cFailures = 0; int maximumTreeSize = 0; int maximumTreeDepth = 0;
            Problem problemCopy = null;
            for (cFailures = 0; cFailures < randomaNumberOfBacktracks; cFailures++)
            { 
                DateTime eachItrStart = DateTime.Now;
                cPOR_Main = new CPORMain();               

                /** Single agent plan tree received for original problem using cpor. **/
                

                // CALL to CPOR (A CONTINGENT PLANNER)
                stageTwoPlanPlusProblem = cPOR_Main.cpormain(sBenchmarkPath, asBenchmarks, cFailures);

                // TestBenchmarkThread testBenchmarkThread = new TestBenchmarkThread();

                // stageTwoPlanPlusProblem = cPOR_Main.

                // StageTwoPlanPlusProblem TestBenchmark(string sBenchmarkPath, string sBenchmark, int cTrials, bool bWriteResults)

                // Print the plan 
                Debug.WriteLine("\nThe original plan tree!");
                StringBuilder sb = new StringBuilder();
                ProjectionOfSATree.RecPrint(stageTwoPlanPlusProblem.conditionalPlanTreeNode, 0, "", ref sb);
                Console.Write(sb); Console.WriteLine();

                return;

                // SOME bugs are still to be removed... (see the file) 

                /** These functions are not automated, they are hard-coded for now **/
                HashSet<Action> publicActions = getAllPublicActions(stageTwoPlanPlusProblem.problem.Domain);
                HashSet<Action> privateActions = getAllPrivateActions(stageTwoPlanPlusProblem.problem.Domain);

                Problem problem = stageTwoPlanPlusProblem.problem;
                                                
                problemCopy = problem;
                
                HashSet<Constant> agentList = new HashSet<Constant>();
                /*
                List<Action> actions = problem.Domain.GroundAllActions(problem);

                HashSet<GroundedPredicate> ll = problem.Domain.GroundAllPredicates();

                foreach(GroundedPredicate p in ll)
                {
                    Console.WriteLine(p.ToString());
                }

                ////
                // Environment.Exit(0);
                ////
                
                */
                foreach (Constant agt in problem.Domain.Constants)
                {
                    if (agt.Type.Equals("agent")) 
                    {
                        agentList.Add(agt);
                    }
                }                    
                
                if (ifProjectionApproach)
                {
                    ProjectionOfSATree projectionOfSATree = new ProjectionOfSATree(problem);
                    List<string> succ = new List<string>();
                    int counter = 0;                    
                    foreach (Constant agt in agentList)
                    {                        
                        counter = counter + 1;

                        /**
                        * Under this function, first a projected plan-tree is generated, then the shrinking algorithm is 
                        * called that reduces this tree, if possible (as per discussed in the paper), then a function is called 
                        * which gives unique names to the actions in the compact tree generated. The last function is important 
                        * as we use parent action name as it is in the children actions preconditions. **/
                        ConditionalPlanTreeNode shrunkAgtPlanTree = ProjectionOfSATree.DoAgentWiseProjection 
                            (privateActions, publicActions, stageTwoPlanPlusProblem.conditionalPlanTreeNode, agt, agentList);

                        /** Required to write each agent's domain and problem files. **/
                        if (!(shrunkAgtPlanTree.ToString().Equals(")goal") && (shrunkAgtPlanTree.Action == null)))
                        {
                            childDomainFolder = sBenchmarkPath + asBenchmarks[0];
                            
                            CompiletoSANew compilationToSingleAgent = new CompiletoSANew(agt, problem);

                            CompiletoSANew.
                                GenerateAgentWiseAugmentedDomains (
                                problem, agt, agentList, shrunkAgtPlanTree, publicActions, childDomainFolder);

                            CompiletoSANew.
                                generateAgentWiseAugmentedProblem(
                                problem, shrunkAgtPlanTree, agt, publicActions, childDomainFolder);

                            Console.WriteLine("\n Child solution \t" + agt);
                            Console.WriteLine("");

                            // A call to cpor for each agent
                            string str = agt.ToString() + "-";
                            str += RunFactoredIndividualDomain(childDomainFolder, agt, cFailures);
                            succ.Add(str);

                            if (maximumTreeSize < Int32.Parse(str.Split('-')[2]))
                            {
                                maximumTreeSize = Int32.Parse(str.Split('-')[2]);
                            }

                            if (maximumTreeDepth < Int32.Parse(str.Split('-')[3]))
                            {
                                maximumTreeDepth = Int32.Parse(str.Split('-')[3]);
                            }

                            if (str.Contains("failure"))
                            {
                                agentFailedPlanTrees[agt] = shrunkAgtPlanTree;
                            }
                        }
                        else
                        {
                            /** When an agent has empty domain and problem descriptions
                             ** CPOR does not capture empty domain-problem pair... **/
                            Console.WriteLine("An empty plan for " + agt.ToString());
                            string str = agt.ToString() + "-";
                            str += "success";
                            succ.Add(str);
                        }                        
                    }
                    // Console.WriteLine("\nNumber of trial: " + (cFailures + 1));
                    // Console.WriteLine("Maximum tree size in this trial: " + maximumTreeSize);
                    counter = 0;
                    foreach(String str in succ)
                    {
                        if(!str.Contains("success"))
                        {
                            Console.WriteLine("\n" + str.Split('-')[0] + " has failed to plan!\n");
                            counter++;
                        }
                    }
                    if (counter == 0)
                        break;                    
                }
                // DateTime eachItrEnd = DateTime.Now;
                // Console.WriteLine("This itr: " + (eachItrEnd - eachItrStart).TotalMilliseconds);
            }
            TimeSpan timeDiff = DateTime.Now - lastIteration;
            Console.WriteLine("\nOverall time taken (for previous backtrack): " + timeDiff.TotalMilliseconds);
            if (agentFailedPlanTrees.Count > 0)
            {
                // Environment.Exit(0);
                CompileTPbacktrack update = new CompileTPbacktrack(agentFailedPlanTrees);
                CompileTPbacktrack.UpdateTPWhileBacktrack(
                    problemCopy, aStaticBasePath, sBenchmarkPath, asBenchmarks, sBacktrackNumber);
                sBacktrackNumber++;                                
                goto Reexecute;
            }
            timeDiff = DateTime.Now - start;
            Console.WriteLine("\nOverall time taken (including all the backtracks): " + timeDiff.TotalMilliseconds);
            Console.WriteLine("Overall Maximum Tree Width: " + maximumTreeSize);
            Console.WriteLine("Overall Maximum Tree Height: " + maximumTreeDepth);
        }

        public static void RunIndividualDomain(String childDomainFolder, Constant agt)
        {
            string sBenchmarkPath = childDomainFolder + "\\";
            Path = BASE_PATH + @"\PDDL\";

            CPORMain cpor = new CPORMain(); 
            string[] asBenchmarks = { agt.ToString() };
        }

        public static string RunFactoredIndividualDomain(String childDomainFolder, Constant agt, int cFailures)
        {
            string sBenchmarkPath = childDomainFolder + "\\";
            Path = BASE_PATH + @"\PDDL\";
            CPORMain cpor = new CPORMain();

            // The original problem and domain
            string[] asBenchmarks = { agt.ToString() };

            // Single agent plan tree received for original problem using cpor            
            StageTwoPlanPlusProblem childPlanTree = cpor.cpormain(sBenchmarkPath, asBenchmarks, cFailures);
                        
            Console.WriteLine("\nPlan tree for " + agt.ToString());
            StringBuilder sb = new StringBuilder();
            ProjectionOfSATree.RecPrint(childPlanTree.conditionalPlanTreeNode, 0, "", ref sb);
            Console.Write(sb);

            int size = ProjectionOfSATree.GetLeafCount(childPlanTree.conditionalPlanTreeNode);
            int depth = ProjectionOfSATree.GetDepthOfTree(childPlanTree.conditionalPlanTreeNode);

            Debug.WriteLine("\nSize: " + size);
            Debug.WriteLine("\nSize: " + depth);

            if (childPlanTree.conditionalPlanTreeNode == null)
            {
                return "failure-" + size + "-" + depth;
            }
            else
            {
                return "success-" + size + "-" + depth;
            }
        }

        /**TODO: implement any approach to find (Secured-MAFS technique). 
         * Currently it is done manually, as if an oracle is defining all these actions:
         * An action is public for an agent, if:
         * (a) There are multiple agents involved in it
         * (b) It achieves some goal condition(s) 
         * (c) It provides/receives some condition that cannot be produced by the agent itself. 
         * (d) Rest of the actions are private. **/
        public static HashSet<Action> getAllPublicActions(Domain domain)
        {
            HashSet<Action> setOfPublicAct = new HashSet<Action>();            
            if(domain.Name.Contains("box")) 
            {
                foreach (Action act in domain.Actions)
                {
                    if (act.Name.Contains("push") || act.Name.Contains("observe") || act.Name.Contains("obs-"))
                    {
                        setOfPublicAct.Add(act);
                    }
                }
            }
            else if (domain.Name.Contains("table"))
            {
                foreach (Action act in domain.Actions)
                    if (act.Name.Contains("joint-") || act.Name.Contains("observe"))
                        setOfPublicAct.Add(act);
            }
            else if (domain.Name.Contains("hsd"))
            {
                foreach (Action act in domain.Actions)
                    if (act.Name.Contains("rescue") || act.Name.Contains("observe"))
                        setOfPublicAct.Add(act);
            }
            else if (domain.Name.Contains("rover"))
            {                
                foreach (Action act in domain.Actions)
                {
                    if (!act.Name.ToString().Contains("navigate"))
                    {
                        setOfPublicAct.Add(act);
                    }
                }
            }
            return setOfPublicAct;
        }

        public static HashSet<Action> getAllPrivateActions(Domain domain)
        {
            HashSet<Action> setOfPrivateAct = new HashSet<Action>();
            if (domain.Name.Contains("box"))
            {
                foreach (Action act in domain.Actions)
                    if (! (act.Name.Contains("push") || act.Name.Contains("observe")) )
                        setOfPrivateAct.Add(act);
            }
            else if (domain.Name.Contains("table"))
            {
                foreach (Action act in domain.Actions)
                    if (! (act.Name.Contains("joint-") || act.Name.Contains("observe")))
                        setOfPrivateAct.Add(act);
            }
            else if (domain.Name.Contains("hsd"))
            {
                foreach (Action act in domain.Actions)
                    if (!(act.Name.Contains("rescue") || act.Name.Contains("observe")))
                        setOfPrivateAct.Add(act);
            }
            else if (domain.Name.Contains("rover"))
            {
                foreach (Action act in domain.Actions)
                {
                    if (act.Name.ToString().Contains("navigate"))
                    {
                        setOfPrivateAct.Add(act);
                    }
                }
            }
            return setOfPrivateAct;
        }
    }
}
