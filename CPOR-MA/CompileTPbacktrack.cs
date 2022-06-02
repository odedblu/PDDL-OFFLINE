using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace CPOR_MA
{
    public class CompileTPbacktrack
    {
        public static Dictionary<Constant, ConditionalPlanTreeNode> dictAgentPlanTreeFailure;
        public static List<string> pairOfCommitObsProp  = new List<string>();

        public CompileTPbacktrack(Dictionary<Constant, ConditionalPlanTreeNode> dict)
        {
            dictAgentPlanTreeFailure = dict;
        }

        private static List<Action> ScapegoatActions(ConditionalPlanTreeNode failedPlan)
        {
            if (failedPlan == null)
            {
                return null;
            }
            if (failedPlan.Action == null)
            {
                List<Action> actionsInFirstBranch = new List<Action>();
                Action lastAct = null;
                while (!(failedPlan.SingleParent.Action.Name.Contains("observe-")))
                {
                    actionsInFirstBranch.Add(failedPlan.SingleParent.Action);
                    failedPlan = failedPlan.SingleParent;
                    lastAct = failedPlan.SingleParent.Action;
                }
                failedPlan = failedPlan.SingleParent;
                Action obsAction = failedPlan.Action;
                List<Action> actionsInSecondBranch = new List<Action>();
                if (actionsInFirstBranch.Count > 0)
                {
                    failedPlan = failedPlan.TrueObservationChild;
                    while (!(failedPlan.Action == null))
                    {
                        if (failedPlan.Action.Name.ToString().Contains("observe-"))
                        {
                            return ScapegoatActions(failedPlan);
                        }
                        actionsInSecondBranch.Add(failedPlan.TrueObservationChild.Action);
                        failedPlan = failedPlan.SingleChild;
                    }                                      
                }
                else
                {
                    failedPlan = failedPlan.TrueObservationChild;
                    while (!(failedPlan.Action == null))
                    {
                        actionsInSecondBranch.Add(failedPlan.Action);
                        failedPlan = failedPlan.SingleChild;
                    }                  
                }
                List<Action> listOfAct = new List<Action>();
                foreach(Action a1 in actionsInFirstBranch)
                {
                    bool flag = false;
                    foreach(Action a2 in actionsInSecondBranch)
                    {
                        if(a1.Name.ToString().Equals(a2.Name.ToString()))
                        {
                            flag = true; break;
                        }
                    }
                    if(!flag)
                    {
                        listOfAct.Add(obsAction);
                        listOfAct.Add(a1);
                        return listOfAct;
                    }
                }                
                foreach (Action a1 in actionsInSecondBranch)
                {
                    bool flag = false;
                    foreach (Action a2 in actionsInFirstBranch)
                    {
                        if (a1.Name.ToString().Equals(a2.Name.ToString()))
                        {
                            flag = true; break;
                        }
                    }
                    if (!flag)
                    {
                        listOfAct.Add(obsAction);
                        listOfAct.Add(a1);
                        return listOfAct;
                    }
                }
            }
            if(failedPlan.SingleChild != null)
            {
                return ScapegoatActions(failedPlan.SingleChild);
            }
            if (failedPlan.FalseObservationChild != null)
            {
                return ScapegoatActions(failedPlan.FalseObservationChild);
            }
            if(failedPlan.TrueObservationChild != null)
            {
                return ScapegoatActions(failedPlan.TrueObservationChild);
            }
            return null;
        }

        public static void UpdateTPWhileBacktrack(
            Problem problem, string aStaticBasePath, string aBenchmarkPath, string[] sBenchmark, int counter) 
        {
            foreach(Constant agt in dictAgentPlanTreeFailure.Keys)
            {
                ConditionalPlanTreeNode planFailed = dictAgentPlanTreeFailure[agt];
                UpdateTeamDomainDescription(problem, agt, planFailed, aStaticBasePath, aBenchmarkPath, sBenchmark, counter);
                UpdateTeamProblemDescription(problem, agt, planFailed, aStaticBasePath, aBenchmarkPath, sBenchmark, counter);
                break;
            }
        }

        private static void UpdateTeamProblemDescription(Problem problem, Constant agent,
            ConditionalPlanTreeNode failedPlan, string aStaticBasePath, string aBenchmarkPath, string[] sBenchmark, int counter)
        {
            String rProblemFilePath = aStaticBasePath + counter + "\\" + "p.pddl";
            string path = Path.Combine(rProblemFilePath);
            using (StreamWriter problemUpdate = File.CreateText(path))
            {
                problemUpdate.WriteLine("(define");
                problemUpdate.WriteLine("(problem " + problem.Name + ")");
                problemUpdate.WriteLine("(:domain " + problem.Domain.Name + ")");

                StringBuilder goal = new StringBuilder();
                goal.Append("(:goal \t(and ");
                Formula fGoal = problem.Goal;
                HashSet<Predicate> pList = fGoal.GetAllPredicates();
                foreach(Predicate p in pList)
                {
                    goal.AppendLine();
                    goal.Append("\t" + p);
                }
                goal.AppendLine();
                goal.Append("\t(not " + pairOfCommitObsProp[1] + ")");
                goal.AppendLine();
                goal.Append("\t)");
                goal.AppendLine();
                goal.Append(")");                
                problemUpdate.WriteLine(goal);

                StringBuilder initState = new StringBuilder();
                initState.Append("(:init (and ");
                initState.AppendLine();
                initState.Append("\t(not " + pairOfCommitObsProp[0] + ")");
                initState.AppendLine();
                initState.Append("\t(not " + pairOfCommitObsProp[1] + ")");
                foreach (GroundedPredicate f in problem.knownPredicates())
                {
                    initState.AppendLine();
                    initState.Append("\t" + f);
                }
                foreach (Formula f in problem.hiddenFormula())
                {
                    initState.AppendLine();
                    initState.Append("\t" + f);
                }
                initState.AppendLine();
                initState.Append("\t)");
                initState.AppendLine();
                initState.Append(")");
                initState.AppendLine();
                initState.Append(")");
                problemUpdate.WriteLine(initState);
            }
        }

        private static void UpdateTeamDomainDescription( Problem problem, Constant agent, 
            ConditionalPlanTreeNode failedPlan, string aStaticBasePath, string aBenchmarkPath, string[] sBenchmark, int counter)
        {
            if (counter > 1)
            {
                String deleteDirectoryPath = aStaticBasePath + counter + "\\";
                if (!System.IO.Directory.Exists(deleteDirectoryPath))
                {
                    System.IO.Directory.Delete(deleteDirectoryPath);
                }
            }
            String directoryPath = aStaticBasePath + counter + "\\";
            if (!System.IO.Directory.Exists(directoryPath))
            {
                System.IO.Directory.CreateDirectory(directoryPath);
            }
            
            String rDomainFilePath = aStaticBasePath + counter + "\\" + "d.pddl" ;                        
            string path = Path.Combine(rDomainFilePath);
            using (StreamWriter domainUpdate = File.CreateText(path))
            {
                domainUpdate.WriteLine("(define");
                domainUpdate.WriteLine("(domain " + problem.Domain.Name + ")");
                domainUpdate.Write("(:types"); 
                foreach(string t in problem.Domain.Types)
                {
                    domainUpdate.Write(" " + t);
                }
                domainUpdate.WriteLine(")");
                domainUpdate.WriteLine("(:constants");
                foreach (Constant c in problem.Domain.Constants)
                {
                    domainUpdate.WriteLine("\t" + c + " - " + c.Type);
                }
                domainUpdate.WriteLine(")");

                StringBuilder listOfPredicates = new StringBuilder();
                listOfPredicates.Append("(:predicates");
                listOfPredicates.AppendLine();
                
                foreach (ParametrizedPredicate pred in problem.Domain.Predicates)
                {
                    listOfPredicates.Append("\t" + pred.getPredicate());
                    listOfPredicates.AppendLine();
                }

                // To find asymmetric branch/action: most simple case first
                List<Action> culpritActions = ScapegoatActions(failedPlan);

                List<StringBuilder> listOfUpdatedActions = new List<StringBuilder>();
                foreach (ParametrizedAction act in problem.Domain.Actions)
                {
                    // Action culpritActions[0] is the observation action
                    // Action culpritActions[1] is the action needed to be enforced on both side
                    if (culpritActions[1].Name.Split('_')[1].ToString().Equals(act.Name.ToString()))
                    {
                        StringBuilder currAct = new StringBuilder();
                        StringBuilder currActAgentCopy = new StringBuilder();
                        StringBuilder currActAgentObs = new StringBuilder();
                        StringBuilder currActAgentCommit = new StringBuilder();

                        currAct.Append("(:action " + act.Name);
                        currActAgentCopy.Append("(:action " + act.Name + "-" + agent);
                        currAct.AppendLine();
                        currActAgentCopy.AppendLine();
                        currAct.Append("\t:parameters (");
                        currActAgentCopy.Append("\t:parameters (");
                        foreach (Parameter param1 in act.Parameters)
                        {
                            currAct.Append(" " + param1 + " - " + param1.Type);
                            if (!param1.Type.ToString().Equals("agent"))
                            {
                                currActAgentCopy.Append(" " + param1 + " - " + param1.Type);
                            }
                        }
                        currAct.Append(" )");
                        currActAgentCopy.Append(" )");
                        currAct.AppendLine();
                        currActAgentCopy.AppendLine();
                        currAct.Append("\t:precondition (and ");
                        currActAgentCopy.Append("\t:precondition (and ");

                        // New precondition predicates added, will not be added in the copy.
                        foreach (Parameter param1 in act.Parameters)
                        {
                            if(param1.Type.ToString().Equals("agent"))
                            {
                                currAct.Append("(not (= " + param1 + " " + agent + "))");
                            }
                        }

                        listOfPredicates.
                            Append("\t(c-p-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        listOfPredicates.AppendLine();
                        listOfPredicates.
                            Append("\t(observe-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        listOfPredicates.AppendLine();

                        pairOfCommitObsProp.
                            Add("(observe-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        pairOfCommitObsProp.
                            Add("(c-p-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")");

                        currActAgentCopy.Append("(c-p-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        currActAgentCopy.Append("(observe-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")");

                        Formula f = act.Preconditions;
                        string[] param = culpritActions[1].Name.ToString().Split('_');
                        foreach (ParametrizedPredicate p in f.GetAllPredicates())
                        {
                            currAct.Append(" " + p);
                            bool flag = false;
                            StringBuilder locPred = new StringBuilder();                            
                            if(p.Negation == true)
                            {
                                locPred.Append("(not (" + p.Name);
                            }
                            else
                            {
                                locPred.Append("(" + p.Name);
                            }
                            
                            foreach (Parameter pp in p.Parameters)
                            {
                                if (pp.Type.ToString().Equals("agent"))
                                {
                                    int sh = 0;
                                    foreach (Parameter pm in act.Parameters)
                                    {
                                        sh++;
                                        if (pp.ToString().Equals(pm.ToString()))
                                        {
                                            flag = true;
                                            locPred.Append(" " + param[sh + 1]);
                                        }
                                    }
                                }
                                else
                                {
                                    locPred.Append(" " + pp);
                                }
                            }

                            if (p.Negation)
                            {
                                locPred.Append("))");
                            }
                            else
                            {
                                locPred.Append(")");
                            }
                            if (!flag)
                            {
                                currActAgentCopy.Append(" " + p);
                            }
                            else
                            {
                                currActAgentCopy.Append(locPred);
                            }
                        }
                        currAct.Append(" )");
                        currActAgentCopy.Append(" )");
                        currAct.AppendLine();
                        currActAgentCopy.AppendLine();

                        // add action effect
                        if (act.Effects != null)
                        {
                            currAct.Append("\t:effect (and ");
                            currActAgentCopy.Append("\t:effect (and ");
                            currActAgentCopy.Append("(when " +
                                "(c-p-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")" +
                                " (not (c-p-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")) )");
                            HashSet<Predicate> allPredicates = act.Effects.GetAllPredicates();
                            foreach (object p in allPredicates)
                            {
                                currAct.Append(p.ToString() + " ");
                                ParametrizedPredicate ppp = (ParametrizedPredicate) p;
                                bool flag = false;
                                StringBuilder locPred = new StringBuilder();
                                if (ppp.Negation == true)
                                {
                                    locPred.Append("(not (" + ppp.Name);
                                }
                                else
                                {
                                    locPred.Append("(" + ppp.Name);
                                }
                                foreach (Parameter pp in ppp.Parameters)
                                {
                                    if(pp.Type.ToString().Equals("agent"))
                                    {
                                        int sh = 0;
                                        foreach (Parameter pm in act.Parameters)
                                        {
                                            sh++;
                                            if (pp.ToString().Equals(pm.ToString()))
                                            {
                                                flag = true;
                                                locPred.Append(" " + param[sh + 1]);
                                            }
                                        }
                                    }
                                }
                                if (ppp.Negation)
                                {
                                    locPred.Append("))");
                                }
                                else
                                {
                                    locPred.Append(")");
                                }
                                if (!flag)
                                {
                                    currActAgentCopy.Append(" " + ppp);
                                }
                                else
                                {
                                    currActAgentCopy.Append(locPred);
                                }
                            }
                            currAct.Append(")");
                            currActAgentCopy.Append(")");
                            currAct.AppendLine();
                            currActAgentCopy.AppendLine();
                            currAct.Append(")");
                            currActAgentCopy.Append(")");
                        }

                        // add observation predicates
                        if (act.Observe != null)
                        {
                            currAct.Append("\t:observe ");
                            HashSet<Predicate> allPredicates = act.Observe.GetAllPredicates();
                            foreach (object p in allPredicates)
                            {
                                currAct.Append(p.ToString() + " ");
                            }
                            currAct.AppendLine();
                            currAct.Append(")");
                        }

                        // two new dummy actions
                        currActAgentCommit.Append("(:action commit-" + culpritActions[1].Name.ToString().Split('_')[1] + "-" +
                            culpritActions[1].Name.ToString().Split('_')[0]);
                        currActAgentCommit.AppendLine();
                        currActAgentCommit.Append("\t:parameters (?a - agent)");
                        currActAgentCommit.AppendLine();
                        currActAgentCommit.Append("\t:precondition (and (not ");
                        currActAgentCommit.Append("(observe-" +
                                culpritActions[1].Name.ToString().Split('_')[1] + "-" +
                                culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        currActAgentCommit.Append(") )");
                        currActAgentCommit.AppendLine();
                        currActAgentCommit.Append("\t:effect (and ");
                        currActAgentCommit.
                            Append("(c-p-" + act.Name + "-" + culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        currActAgentCommit.Append(")");
                        currActAgentCommit.AppendLine();
                        currActAgentCommit.Append(")");
                         
                        /** A temperory solution: need to change once I get time **/
                        string allAgents = "";
                        foreach(Constant c in problem.Domain.Constants)
                        {
                            if (c.Type.ToString().Equals("agent"))
                            {
                                allAgents = allAgents + "-" + c.ToString();
                            }
                        }
                        currActAgentObs.
                            Append("(:action obs" + "-" +
                                culpritActions[1].Name.ToString().Split('_')[0] + allAgents);
                        currActAgentObs.AppendLine();
                        currActAgentObs.Append("\t:parameters (?a - agent)");
                        currActAgentObs.AppendLine();
                        
                        currActAgentObs.Append("\t:precondition (and ");
                        currActAgentObs.
                            Append("(not (observe-" + culpritActions[1].Name.ToString().Split('_')[1] + "-" +
                                culpritActions[1].Name.ToString().Split('_')[0] + "))");
                        
                        currActAgentObs.Append(")");
                        currActAgentObs.AppendLine();
                        
                        currActAgentObs.Append("\t:effect (and ");
                        currActAgentObs.
                            Append("(observe-" + culpritActions[1].Name.ToString().Split('_')[1] + "-" +
                                culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        currActAgentObs.Append(")");
                        currActAgentObs.AppendLine();
                        currActAgentObs.Append(")");

                        listOfUpdatedActions.Add(currAct);
                        listOfUpdatedActions.Add(currActAgentCopy);
                        listOfUpdatedActions.Add(currActAgentCommit);
                        listOfUpdatedActions.Add(currActAgentObs);
                    }
                    else 
                    {
                        StringBuilder currAct = new StringBuilder();
                        currAct.Append("(:action " + act.Name);
                        currAct.AppendLine();
                        currAct.Append("\t:parameters (");
                        foreach (Parameter param in act.Parameters)
                        {
                            currAct.Append(" " + param + " - " + param.Type);
                        }
                        currAct.Append(" )");
                        currAct.AppendLine();
                        currAct.Append("\t:precondition (and ");

                        if (culpritActions[0].Name.Split('_')[1].ToString().Equals(act.Name.ToString()))
                        {
                            currAct.Append("(observe-" +
                                culpritActions[1].Name.ToString().Split('_')[1] + "-" +
                                culpritActions[1].Name.ToString().Split('_')[0] + ")");
                        }
                        Formula f = act.Preconditions;
                        foreach (Predicate p in f.GetAllPredicates())
                        {
                            currAct.Append(" " + p);
                        }
                        currAct.Append(" )");
                        currAct.AppendLine();

                        // add effect predicates
                        if (act.Effects != null)
                        {
                            currAct.Append("\t:effect (and ");
                            HashSet<Predicate> allPredicates = act.Effects.GetAllPredicates();
                            foreach (object p in allPredicates)
                            {
                                currAct.Append(p.ToString() + " ");
                            }
                            currAct.Append(" )");
                            currAct.AppendLine();
                            currAct.Append(")");
                        }

                        // add observation predicates
                        if (act.Observe != null)
                        {
                            currAct.Append("\t:observe ");
                            HashSet<Predicate> allPredicates = act.Observe.GetAllPredicates();
                            foreach (object p in allPredicates)
                            {
                                currAct.Append(p.ToString() + " ");
                            }
                            currAct.AppendLine();
                            currAct.Append(")");
                        }
                        listOfUpdatedActions.Add(currAct);
                    }
                }
                // Just to acpture all the newly added predicates
                listOfPredicates.Append(")");
                domainUpdate.WriteLine(listOfPredicates);
                foreach(StringBuilder act in listOfUpdatedActions)
                {
                    domainUpdate.WriteLine(act);
                }                
                domainUpdate.WriteLine(")");
            }           
        }
    }
}
