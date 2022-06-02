using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UCLouvain.BDDSharp;

namespace CPOR_MA
{
    public class GenerateBranch
    {        
        private static Problem problem;
        private static List<Constant> listOfAgts; 
        private static List<Constant> interestingConstants;

        private GenerateBranch(Problem prob)
        {
            problem = prob;
            CrucialInformation(problem);
        }

        public static string Print(ConditionalPlanTreeNode root)
        {
            StringBuilder sb = new StringBuilder();
            RecPrint(root, 0, "", ref sb);
            return sb.ToString();
        }

        public static List<string> GenerateBranches(ConditionalPlanTreeNode root)
        {            
            List<String> listBranch = new List<string>();
            RecGenerateBranches(root, 0, "", "", ref listBranch); 
            return listBranch;
        }

        public static Dictionary<String, List<string>> GenerateBDD( Constant agt, ConditionalPlanTreeNode root, 
            BDDManager manager, int BDDVarSize, HashSet<String> actions)
        {            
            List<String> acts = new List<string>();
            Dictionary<String, List<string>> ConstraintForAnAgent = new Dictionary<string, List<string>>();            

            foreach (string currentAction in actions)
            {
                HashSet<int> BDDVarSet = new HashSet<int>();
                for (int i = 0; i < BDDVarSize - 1; i++)
                {
                    BDDVarSet.Add(i);
                }

                acts.Add(currentAction);
                // Console.WriteLine("\nAction: " + a);
                HashSet<Dictionary<String, int>> BDDVariableIndex = new HashSet<Dictionary<string, int>>();
                BDDNode nodea = BDDVar(agt, manager, BDDVarSet, root, currentAction, BDDVariableIndex);

                // ROBDD - after reduction
                var res = manager.Reduce(nodea);
                               
                /***
                Console.WriteLine();
                foreach (BDDNode n in res.Nodes)
                    Console.WriteLine(n);
                Console.WriteLine();
                ***/
                
                // take the constraints out of the reduced tree                
                if (res!=null && (res.Id !=0 || res.Id !=1))
                {
                    List<string> disConstraint = new List<string>();
                    // Console.WriteLine("Which agent? " + agt + ", constraints for action: " + currentAction);
                    AgentWiseActionConstraints(BDDVariableIndex, ref disConstraint, res, "");
                    
                    /*
                    foreach (string list in disConstraint)
                    {
                        Console.Write(list + "\n");
                    } 
                    */
                    ConstraintForAnAgent.Add(currentAction, disConstraint);
                }                  
            }
            return ConstraintForAnAgent;
        }

        public static void AgentWiseActionConstraints(HashSet<Dictionary<String, int>> BDDVariableIndex,
            ref List<string> disConstraint, BDDNode root, string intern)
        {
            string tString = intern;
            if(root.SingleChild() && root.Id == 1)
            {
                disConstraint.Add(tString);                
            }            
            if (root.Low != null)
            {
                string localCopy = tString;
                if (root.Low.Id != 0)
                {                    
                    foreach (Dictionary<String, int> dict in BDDVariableIndex)
                    {
                        foreach (String key in dict.Keys)
                        {
                            if (dict[key] == root.Index)
                            {
                                tString = tString + "|~" + key.ToString();                                
                            }
                        }
                    }
                }            
                AgentWiseActionConstraints(BDDVariableIndex, ref disConstraint, root.Low, tString);
                tString = localCopy;
            }
            if (root.High != null)
            {
                string localCopy = tString;
                if (root.High.Id !=0 )
                {
                    foreach (Dictionary<String, int> dict in BDDVariableIndex)
                    {
                        foreach (String key in dict.Keys)
                        {
                            if (dict[key] == root.Index)
                            {
                                tString = tString + "|" + key.ToString();
                            }
                        }
                    }
                }
                AgentWiseActionConstraints(BDDVariableIndex, ref disConstraint, root.High, tString);
                tString = localCopy;
            }            
        }

        public static HashSet<String> FindRelevantActions(ConditionalPlanTreeNode root, Constant agent)
        {
            HashSet<String> intersetingActions = new HashSet<string>();
            RelevantActions(root, intersetingActions, agent);
            return intersetingActions;
        }

        // Manually need to figure out the relevant actions for each domain and each agent
        // Need to write a domain independent algorithm that can extract/segregate public/private actions
        // Not hard to write, also currently not focusing on that part
        // It extracts from the team-plan tree -- node
        private static void RelevantActions(ConditionalPlanTreeNode node, HashSet<String> actions, Constant agent)
        {
            if (node == null)
                return;            
            if (node.Action != null)
            {
                if (problem.Domain.Name.ToString().Contains("box"))
                {
                    string name = node.Action.Name.ToString();
                    if (name.Contains("joint-push") || name.Contains("push"))
                    {
                        if (name.Contains(agent.ToString()))
                        {
                            string s = name.Split('_')[0];
                            // interestingConstants - again manually selected
                            foreach (Constant c in interestingConstants)
                            {
                                if (name.Contains(c.ToString()))
                                {
                                    actions.Add(s + "_" + c.ToString());
                                    break;                                 
                                }
                            }
                        }
                    }
                    else if(name.Contains("observe"))
                    {
                        string s = name.Split('_')[0];
                        foreach (Constant c in interestingConstants)
                        {
                            if (name.Contains(c.ToString()))
                            {
                                actions.Add(s + "_" + c.ToString());
                                break;
                            }
                        }
                    }
                }
                if (problem.Domain.Name.ToString().Contains("table"))
                {
                    string name = node.Action.Name.ToString();
                    if (name.Contains("joint-"))
                    {
                        if (name.Contains(agent.ToString()))
                        {
                            string s = name.Split('_')[0];
                            foreach(Constant c in interestingConstants)
                            {
                                if (name.Contains(c.ToString()))
                                {
                                    actions.Add(s + "_" + c.ToString());
                                }
                            }                            
                        }
                    }
                    else if (name.Contains("observe"))
                    {
                        string s = name.Split('_')[0];
                        foreach (Constant c in interestingConstants)
                        {
                            if (name.Contains(c.ToString()))
                            {
                                actions.Add(s + "_" + c.ToString());
                            }
                        }
                    }
                }
                if (problem.Domain.Name.ToString().Contains("hsd"))
                {
                    string name = node.Action.Name.ToString();
                    if (name.Contains("joint-") || name.Contains("rescue")) 
                    {
                        if (name.Contains(agent.ToString()))
                        {
                            string s = name.Split('_')[0];
                            foreach (Constant c in interestingConstants)
                            {
                                if (name.Contains(c.ToString()))
                                {
                                    actions.Add(s + "_" + c.ToString());
                                }
                            }
                        }
                    }
                    else if (name.Contains("observe"))
                    {
                        string s = name.Split('_')[0];
                        foreach (Constant c in interestingConstants)
                        {
                            if (name.Contains(c.ToString()))
                            {
                                actions.Add(s + "_" + c.ToString());
                            }
                        }
                    }
                }
                if (problem.Domain.Name.ToString().Contains("Rover"))
                {
                    string name = node.Action.Name.ToString();
                    if (name.Contains("joint-"))
                    {
                        if (name.Contains(agent.ToString()))
                        {
                            string s = name.Split('_')[0];
                            foreach (Constant c in interestingConstants)
                            {
                                if (name.Contains(c.ToString()))
                                {
                                    actions.Add(s + "_" + c.ToString());
                                }
                            }
                        }
                    }
                    else if (name.Contains("observe"))
                    {
                        string s = name.Split('_')[0];
                        foreach (Constant c in interestingConstants)
                        {
                            if (name.Contains(c.ToString()))
                            {
                                actions.Add(s + "_" + c.ToString());
                            }
                        }
                    }
                }
            }
            if (node.SingleChild != null)
            {
                RelevantActions(node.SingleChild, actions, agent);
            }
            if (node.FalseObservationChild != null)
            {
                RelevantActions(node.FalseObservationChild, actions, agent);
            }
            if (node.TrueObservationChild != null)
            {
                RelevantActions(node.TrueObservationChild, actions, agent);
            }
        }

        private static void RecPrint(ConditionalPlanTreeNode node, int depth, string path, ref StringBuilder sb)
        {            
            if (node == null)
                return;
            if (node.Action != null)
            { 
                sb.AppendLine(path + node.Action.Name.ToString());                
            }           
            if (node.SingleChild != null)
            {
                string tPath = path + "\t";
                RecPrint(node.SingleChild, depth + 1, tPath, ref sb);
            }
            if (node.FalseObservationChild != null)
            {
                string tPath = path + "\t(f)";
                RecPrint(node.FalseObservationChild, depth + 1, tPath, ref sb);
            }
            if (node.TrueObservationChild != null)
            {
                string tPath = path + "\t(t)";
                RecPrint(node.TrueObservationChild, depth + 1, tPath, ref sb);
            }            
        }

        private static void RecGenerateBranches(ConditionalPlanTreeNode node, int depth, string path, string branch, 
            ref List<String> listBranch)
        {
            string tBranch = branch;
            StringBuilder sb = new StringBuilder();
            if (node == null)
                return;
            if (node.Action != null)
            {
                sb.AppendLine(path + node.Action.Name.ToString());
                tBranch = tBranch + "*" + path + node.Action.Name.ToString();
            }
            if (node.SingleChild != null)
            {
                string tPath = path;
                RecGenerateBranches(node.SingleChild, depth + 1, tPath, tBranch, ref listBranch);
            }
            if (node.FalseObservationChild != null)
            {
                string tPath = path + "0:";
                RecGenerateBranches(node.FalseObservationChild, depth + 1, tPath, tBranch, ref listBranch);
            }
            if (node.TrueObservationChild != null)
            {
                string tPath = path + "1:";
                RecGenerateBranches(node.TrueObservationChild, depth + 1, tPath, tBranch, ref listBranch);
            }
            if (node.ToString().Equals(")goal")) // Is there a better way to compare?
            {
                listBranch.Add(tBranch.ToString());
            }
        }

        private static BDDNode BDDVar(Constant agt, UCLouvain.BDDSharp.BDDManager manager, HashSet<int> BDDVarSet,
            ConditionalPlanTreeNode node, String action, HashSet<Dictionary<string, int>> indexVariable)
        {            
            BDDNode bDDNode = null;
            if (node == null)
                return null;
            if (node.SingleChild != null)
            {
                BDDNode nod = BDDVar(agt, manager, BDDVarSet, node.SingleChild, action, indexVariable);
                if (
                    node.Action.Name.ToString().Contains(action.Split('_')[0]) 
                    &&
                    node.Action.Name.ToString().Contains(action.Split('_')[1])
                    && 
                    node.Action.Name.ToString().Contains(agt.ToString())
                    )
                {
                    nod = manager.One;
                }
                return nod;
            }
            BDDNode LowChild = null; BDDNode HighChild = null;           
            if (node.FalseObservationChild != null)
            {
                LowChild = BDDVar(agt, manager, BDDVarSet, node.FalseObservationChild, action, indexVariable);                
            }
            if (node.TrueObservationChild != null)
            {
                HighChild = BDDVar(agt, manager, BDDVarSet, node.TrueObservationChild, action, indexVariable);
            }
            if (node.ToString().Equals(")goal")) 
            {             
                return manager.Zero;
            }
            if(node.Action.Name.ToString().Contains("observe"))
            {
                int index = -1;
                foreach (Dictionary<String, int> dict in indexVariable)
                {
                    foreach(String key in dict.Keys)
                    {
                        foreach(Constant c in interestingConstants)
                        {
                            if(key.Equals(c.ToString()) && node.Action.Name.ToString().Contains(c.ToString()))
                            {
                                index = (int) dict[key];  
                            }
                        }
                    }
                }
                if (index == -1)
                {
                    index = BDDVarSet.Max();
                    BDDVarSet.Remove(index);
                    foreach (Constant c in interestingConstants)
                    {
                        if(node.Action.Name.ToString().Contains(c.ToString()))
                        {
                            Dictionary<String, int> tempDict = new Dictionary<string, int>();
                            tempDict.Add(c.ToString(), index);
                            indexVariable.Add(tempDict);
                            break;
                        }
                    }
                }
                bDDNode = manager.Create(index, HighChild, LowChild);
                return bDDNode;                                                 
            }
            return bDDNode;
        }

        public static void CrucialInformation(Problem problem)
        {
            listOfAgts = new List<Constant>();
            interestingConstants = new List<Constant>();
            foreach (Constant cons in problem.Domain.Constants)
            {
                if (cons.Type.ToString().Equals("agent"))
                {
                    listOfAgts.Add(cons);
                }
                if (cons.Type.ToString().Equals("box") && problem.Name.Contains("box"))
                {
                    interestingConstants.Add(cons);
                }
                else if (cons.Type.ToString().Equals("table") && problem.Name.Contains("table"))
                {
                    interestingConstants.Add(cons);
                }
                else if (cons.Type.ToString().Equals("patient") && problem.Name.Contains("hsd"))
                {
                    interestingConstants.Add(cons);
                }
            }
        }
    }
}
