using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UCLouvain.BDDSharp;

namespace CPOR_MA
{
    public class ProjectionOfSATree
    {        
        private static Problem problem;

        public ProjectionOfSATree(Problem prob)
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

        public static int GetDepthOfTree(ConditionalPlanTreeNode node)
        {
            int count = 0, countLeft = 0, countRight = 0;
            if (node == null)
            {
                return 0;
            }
            if (node.SingleChild != null)
            {
                count += GetDepthOfTree(node.SingleChild);
            }
            if (node.FalseObservationChild != null)
            {
                countLeft = GetDepthOfTree(node.FalseObservationChild);
            }
            if (node.TrueObservationChild != null)
            {
                countRight = GetDepthOfTree(node.TrueObservationChild);
            }
            if (node.Action == null)
            {
                return 0;
            }
            if (node.Action != null)
            {
                if (node.Action.Name.ToString().Contains("dummy") || node.Action.Name.ToString().Contains("goal-achieve"))
                {
                    return (count + 0 + (countLeft > countRight ? countLeft : countRight));
                }
                else
                {
                    return (count + 1 + (countLeft > countRight ? countLeft : countRight));
                }
            }
            return (count + (countLeft > countRight ? countLeft : countRight));
        }

        public static int GetLeafCount(ConditionalPlanTreeNode node) 
        {
            int count = 0;
            if (node == null)
            {
                return 0;
            }
            if (node.Action == null)
            {
                return 1;
            }
            if(node.SingleChild != null)
            {
                count = GetLeafCount(node.SingleChild);
            }
            if(node.FalseObservationChild != null)
            {
                count += GetLeafCount(node.FalseObservationChild);
            }
            if(node.TrueObservationChild != null)
            {
                count += GetLeafCount(node.TrueObservationChild);
            }
            return count;
        }

        public static ConditionalPlanTreeNode 
            MakeActionsUniqueByTheirNames(ConditionalPlanTreeNode node, ref ConditionalPlanTreeNode duplicate)
        {            
            if (node == null)
                return null;
            if (node.Action != null)
            {
                duplicate.Action = node.Action;
                Action acti = new Action(RandomString(3) + "_" + node.Action.Name.ToString());
                acti.Preconditions = node.Action.Preconditions;
                acti.Effects = node.Action.Effects;
                acti.Observe = node.Action.Observe;                
                duplicate.Action = (Action) acti;                
            }
            if (node.SingleChild != null)
            {
                ConditionalPlanTreeNode copy = new ConditionalPlanTreeNode();
                duplicate.SingleChild = MakeActionsUniqueByTheirNames(node.SingleChild, ref copy);
            }
            if (node.FalseObservationChild != null)
            {
                ConditionalPlanTreeNode copy = new ConditionalPlanTreeNode();
                duplicate.FalseObservationChild = MakeActionsUniqueByTheirNames(node.FalseObservationChild, ref copy);
            }
            if (node.TrueObservationChild != null)
            {
                ConditionalPlanTreeNode copy = new ConditionalPlanTreeNode();
                duplicate.TrueObservationChild = MakeActionsUniqueByTheirNames(node.TrueObservationChild, ref copy);
            }
            duplicate.SingleParent = node.SingleParent;
            duplicate.childType = node.childType;
            return duplicate;
        }

        public static ConditionalPlanTreeNode DoAgentWiseProjection( HashSet<Action> allPrivateActions, 
            HashSet<Action> allPublicActions, ConditionalPlanTreeNode root, Constant agent, HashSet<Constant> agentList)
        { 
            /** Extracts the relevant plan for a particular agent. **/
            ConditionalPlanTreeNode projectedTree = new ConditionalPlanTreeNode();
            RecDoAgentWiseProjection(root, agent, allPrivateActions, allPublicActions, ref projectedTree);
            
            StringBuilder sb = new StringBuilder();   
            sb = new StringBuilder();
            Console.WriteLine("\nThe projected plan tree for " + agent + ":");
            RecPrint(projectedTree, 0, "", ref sb);
            Console.Write(sb); Console.WriteLine();

            /** Projected tree is fully compressed to its minimal form, multiple compressions was not part of ICAPS19. **/
            ConditionalPlanTreeNode shrunkAgtPlan = null;
            while (true)
            {
                shrunkAgtPlan = new ConditionalPlanTreeNode();
                ShrinkProjectedTree(projectedTree, agentList, ref shrunkAgtPlan);
                
                if(ComparePlanTrees(projectedTree, shrunkAgtPlan))
                {
                    break;
                }
                projectedTree = shrunkAgtPlan;
            }

            sb = new StringBuilder();
            Console.WriteLine("\nThe compressed plan tree for " + agent + ":");
            RecPrint(shrunkAgtPlan, 0, "", ref sb);
            Console.Write(sb);

            /** Makes the actions of this compressed plan tree unique **/
            ConditionalPlanTreeNode shrunkAgtPlanTree = new ConditionalPlanTreeNode();
            ProjectionOfSATree.MakeActionsUniqueByTheirNames(shrunkAgtPlan, ref shrunkAgtPlanTree);
            
            /** Need to call it to have access reference of all the ancestors.
             ** This is required for the case when the plan tree has multiple continuous observation actions. 
             **/
            MarkParamsToCompressedTreeNode("", null, ref shrunkAgtPlanTree);

            return shrunkAgtPlanTree;
        }

        private static ConditionalPlanTreeNode MarkParamsToCompressedTreeNode (
            String indicator, ConditionalPlanTreeNode node, ref ConditionalPlanTreeNode compressed)
        {
            compressed.SingleParent = node;
            compressed.childType = indicator;
            ConditionalPlanTreeNode localTree = new ConditionalPlanTreeNode();
            if (compressed == null)
            {
                return null;
            }
            if (compressed.SingleChild != null)
            {
                localTree = compressed.SingleChild;
                MarkParamsToCompressedTreeNode("center", compressed, ref localTree);
                compressed.SingleChild = localTree;
            }
            if (compressed.FalseObservationChild != null)
            {
                localTree = compressed.FalseObservationChild;
                MarkParamsToCompressedTreeNode("left", compressed, ref localTree);
                compressed.FalseObservationChild = localTree;
            }
            if (compressed.TrueObservationChild != null)
            {
                localTree = compressed.TrueObservationChild;
                MarkParamsToCompressedTreeNode("right", compressed, ref localTree);
                compressed.TrueObservationChild = localTree;
            }

            if (compressed.FalseObservationChild != null || compressed.TrueObservationChild != null)
            {
                Action dummy = new Action("dummy-" + compressed.Action.Name.ToString());
                compressed.DummyParentActionForObs = dummy;
            }

            /** adding dummy actions **/
            if (compressed.FalseObservationChild != null)
            {
                Action dummy = new Action("dummy-left-"+ compressed.Action.Name.ToString());
                compressed.DummyChildActionForFalseObs = dummy;
            }
            if (compressed.TrueObservationChild != null)
            {
                Action dummy = new Action("dummy-right-" + compressed.Action.Name.ToString());
                compressed.DummyChildActionForTrueObs = dummy;
            }
            return compressed;
        }

        private static ConditionalPlanTreeNode ShrinkProjectedTree( 
            ConditionalPlanTreeNode projectedTree, HashSet<Constant> agentList, ref ConditionalPlanTreeNode shrinkProjectedTree)
        {
            ConditionalPlanTreeNode localTree = new ConditionalPlanTreeNode();
            if (projectedTree == null)
            {
                return null;
            }
            if (projectedTree.Action != null)
            {
                shrinkProjectedTree.Action = projectedTree.Action;
            }
            if (projectedTree.SingleChild != null)
            {
                // shrinkProjectedTree = projectedTree;                               
                shrinkProjectedTree.SingleChild = ShrinkProjectedTree(projectedTree.SingleChild, agentList, ref localTree);
            }
            if (projectedTree.FalseObservationChild != null && projectedTree.TrueObservationChild != null)
            {   
                bool comparison = 
                    CompareTrees(projectedTree.FalseObservationChild, projectedTree.TrueObservationChild, agentList);
                if (!comparison)
                {
                    // shrinkProjectedTree = projectedTree;
                    if (projectedTree.FalseObservationChild != null)
                    {
                        localTree = new ConditionalPlanTreeNode(); 
                        shrinkProjectedTree.FalseObservationChild = 
                            ShrinkProjectedTree(projectedTree.FalseObservationChild, agentList, ref localTree);
                    }
                    if (projectedTree.TrueObservationChild != null)
                    {
                        localTree = new ConditionalPlanTreeNode(); 
                        shrinkProjectedTree.TrueObservationChild = 
                            ShrinkProjectedTree(projectedTree.TrueObservationChild, agentList, ref localTree);
                    }
                }
                else
                {                    
                    shrinkProjectedTree = 
                        ShrinkProjectedTree (projectedTree.TrueObservationChild, agentList, ref localTree);                    
                }
            }
            else if (projectedTree.FalseObservationChild != null || projectedTree.TrueObservationChild != null)
            {
                if (projectedTree.FalseObservationChild != null)
                {
                    shrinkProjectedTree.FalseObservationChild =
                        ShrinkProjectedTree(projectedTree.FalseObservationChild, agentList, ref localTree);
                }
                if (projectedTree.TrueObservationChild != null)
                {
                    shrinkProjectedTree.TrueObservationChild =
                        ShrinkProjectedTree(projectedTree.TrueObservationChild, agentList, ref localTree);
                }
            }
            return shrinkProjectedTree;
        }

        private static bool ComparePlanTrees(ConditionalPlanTreeNode n1, ConditionalPlanTreeNode n2)
        {
            if (n1.Action == null && n2.Action == null)
            {
                if (n1.ToString().Equals(n2.ToString()))
                    return true;
                else
                    return false;
            }
            bool value = false;
            if (n1.Action != null && n2.Action != null)
            {
                if (n1.Action.Name.ToString().Equals(n2.Action.Name.ToString()))
                {
                    value = true;
                }
            }
            bool x1 = false, x2 = false, x3 = false;
            if (n1.SingleChild != null && n2.SingleChild != null)
            {
                x1 = ComparePlanTrees(n1.SingleChild, n2.SingleChild);
            }
            if (n1.FalseObservationChild != null && n2.FalseObservationChild != null)
            {
                x2 = ComparePlanTrees(n1.FalseObservationChild, n2.FalseObservationChild);
            }
            if (n1.TrueObservationChild != null && n2.TrueObservationChild != null)
            {
                x3 = ComparePlanTrees(n1.TrueObservationChild, n2.TrueObservationChild);
            }
            if ((value && x1) || (value && x2 && x3))
                return true;
            return false;
        }

        private static bool CompareTrees(ConditionalPlanTreeNode n1, ConditionalPlanTreeNode n2, HashSet<Constant> agentList)
        {
            if (n1.Action == null && n2.Action == null)
            {
                if (n1.ToString().Equals(n2.ToString()))
                    return true;
                else
                    return false;
            }
            bool value = false;
            if (n1.Action != null && n2.Action != null)
            {
                if (n1.Action.Name.ToString().Equals(n2.Action.Name.ToString()))
                {
                    value = true;
                }
                else
                {                    
                    string[] node1 = n1.Action.Name.ToString().Split('_');
                    string[] node2 = n2.Action.Name.ToString().Split('_');
                    if(node1.Length == node2.Length)
                    {
                        bool locaFlag = false;
                        for(int ii=0; ii < node1.Length; ii++)
                        {
                            bool check1 = false;
                            bool check2 = false;
                            if (! node1[ii].Equals(node2[ii]))
                            {
                                foreach(Constant agt in agentList)
                                {
                                    if (agt.ToString().Equals(node1[ii]))
                                        check1 = true;
                                    if (agt.ToString().Equals(node2[ii]))
                                        check2 = true;
                                }
                                if (!check1 && !check2)
                                {
                                    locaFlag = true;
                                    break;
                                }
                            }                            
                        }
                        if (!locaFlag)
                            value = true;
                    }
                }                                          
            }
            bool x1 = false, x2 = false, x3 = false;
            if (n1.SingleChild != null && n2.SingleChild != null)
            {
                x1 = CompareTrees(n1.SingleChild, n2.SingleChild, agentList);
            }
            if (n1.FalseObservationChild != null && n2.FalseObservationChild != null)
            {
                x2 = CompareTrees(n1.FalseObservationChild, n2.FalseObservationChild, agentList);
            }
            if (n1.TrueObservationChild != null && n2.TrueObservationChild != null)
            {
                x3 = CompareTrees(n1.TrueObservationChild, n2.TrueObservationChild, agentList);
            }
            if ((value && x1) || (value && x2 && x3))
                return true;
            return false;
        }

        /** ICAPS 2019 results are based on this **/
        private static bool CompareTrees_old(ConditionalPlanTreeNode n1, 
            ConditionalPlanTreeNode n2, HashSet<Constant> agentList, HashSet<String> setOfRelAction)
        {           
            if (n1.Action == null && n2.Action == null) 
            {
                return true;
            }
            bool value = false;
            if (n1.Action != null && n2.Action != null )
            {
                if(problem.Name.ToString().Contains("box"))
                {
                    if(n1.Action.Name.ToString().Contains("observe") && n2.Action.Name.ToString().Contains("observe"))
                    {

                    }
                }
                if (problem.Name.ToString().Contains("hsd"))
                {
                    if (n1.Action.Name.ToString().Contains("observe") &&
                        n2.Action.Name.ToString().Contains("observe"))
                    {
                        foreach (String name in setOfRelAction)
                        {
                            if (n1.Action.Name.ToString().Contains(name.Split('_')[0]) &&
                                n1.Action.Name.ToString().Contains(name.Split('_')[1]) &&
                                n2.Action.Name.ToString().Contains(name.Split('_')[0]) &&
                                n2.Action.Name.ToString().Contains(name.Split('_')[0]))
                            {
                                value = true; break;
                            }
                        }
                    }
                    else if (! n1.Action.Name.ToString().Equals(n2.Action.Name.ToString()))
                    {                        
                        return false;
                    }
                }
                else
                {
                    foreach (String name in setOfRelAction)
                    {
                        if (n1.Action.Name.ToString().Contains(name.Split('_')[0]) &&
                            n1.Action.Name.ToString().Contains(name.Split('_')[1]) &&
                            n2.Action.Name.ToString().Contains(name.Split('_')[0]) &&
                            n2.Action.Name.ToString().Contains(name.Split('_')[0]))
                        {
                            value = true; break;
                        }
                    }
                }
            }
            bool x1 = false, x2 = false, x3 = false;
            if(n1.SingleChild != null && n2.SingleChild != null)
            {
                x1 = CompareTrees_old(n1.SingleChild, n2.SingleChild, agentList, setOfRelAction);
            }
            if(n1.FalseObservationChild != null && n2.FalseObservationChild != null)
            {
                x2 = CompareTrees_old(n1.FalseObservationChild, n2.FalseObservationChild, agentList, setOfRelAction);
            }
            if (n1.TrueObservationChild != null && n2.TrueObservationChild != null)
            {
                x3 = CompareTrees_old(n1.TrueObservationChild, n2.TrueObservationChild, agentList, setOfRelAction);
            }            
            if (( value && x1) || (value && x2 && x3))
                return true;
            return false;
        }

        private static ConditionalPlanTreeNode RecDoAgentWiseProjection (ConditionalPlanTreeNode node, Constant agent,
             HashSet<Action> allPrivateActions, HashSet<Action> allPublicActions, ref ConditionalPlanTreeNode projectedTree)
        {            
            if (node == null)
                return null;
            if (node.Action != null)
            {
                while (true)
                {
                    bool flag = false, pub = false, obs = false;
                    string actName = node.Action.Name.ToString();
                    foreach (Action act in allPublicActions)
                    {
                        if (actName.Contains(act.Name.ToString()))
                        {
                            flag = true;
                            break;
                        }
                    }

                    if(actName.Contains("observe"))
                    {
                        obs = true;
                    }

                    // temporary fix: || actName.Contains("obs-")
                    if (actName.Contains(agent.ToString()) || actName.Contains("obs-"))
                    {
                        pub = true; 
                    }
                    
                    if ((flag && pub) || (flag && obs))
                    {
                        projectedTree.Action = node.Action;
                        break;
                    }

                    /** No need to have a check, as there is always a single-child: (SA->JA->SA->O) **/
                    node = node.SingleChild; 
                }
            }
            if (node.SingleChild != null)
            {                
                ConditionalPlanTreeNode singleChild = new ConditionalPlanTreeNode();                
                while (true)
                {                    
                    if (node.SingleChild.Action == null)
                    {                       
                        projectedTree.SingleChild = 
                            RecDoAgentWiseProjection(node.SingleChild, agent, allPrivateActions, allPublicActions, ref singleChild);
                        break;
                    }
                    else if (node.SingleChild.Action.Name.ToString().Contains("observe"))
                    {                        
                        projectedTree.SingleChild = 
                            RecDoAgentWiseProjection(node.SingleChild, agent, allPrivateActions, allPublicActions, ref singleChild);
                        break;
                    }

                    string name = node.SingleChild.Action.Name.ToString();
                    bool pri = false; bool pub = false;
                    foreach (Action act in allPrivateActions)
                    {
                        if(name.Contains(act.Name.ToString()))
                        {
                            pri = true; break;
                        }
                    }
                    foreach (Action act in allPublicActions)
                    {
                        if (name.Contains(act.Name.ToString()) && name.Contains(agent.ToString()))
                        {
                            pub = true; break;
                        }
                    }
                    
                    if (!pri && pub)
                    {
                        projectedTree.SingleChild = RecDoAgentWiseProjection(
                            node.SingleChild, agent, allPrivateActions, allPublicActions, ref singleChild);
                        break;
                    }
                    node = node.SingleChild;                    
                }                                             
            }

            ConditionalPlanTreeNode savedNode = node.TrueObservationChild;
            if (node.FalseObservationChild != null)
            {
                /**
                ConditionalPlanTreeNode falseObsChild = new ConditionalPlanTreeNode();
                projectedTree.FalseObservationChild =
                        RecDoAgentWiseProjection(node.FalseObservationChild, agent, setOfRelAction, ref falseObsChild);
                **/                
                ConditionalPlanTreeNode falseObsChild = new ConditionalPlanTreeNode();                

                bool temp = false; bool pub = false;

                if (node.FalseObservationChild.Action == null)
                {
                    temp = true;
                    projectedTree.FalseObservationChild = RecDoAgentWiseProjection(
                        node.FalseObservationChild, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                }
                else if (node.FalseObservationChild.Action.Name.ToString().Contains("observe"))
                {
                    temp = true;
                    projectedTree.FalseObservationChild = RecDoAgentWiseProjection(
                        node.FalseObservationChild, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                }                
                else if (!temp)
                {
                    foreach(Action act in allPublicActions)
                    {
                        if (node.FalseObservationChild.Action.Name.ToString().Contains(agent.ToString()) &&
                            node.FalseObservationChild.Action.Name.ToString().Contains(act.Name.ToString()))
                        {
                            pub = true;
                            projectedTree.FalseObservationChild = RecDoAgentWiseProjection(
                                node.FalseObservationChild, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                            break;
                        }
                    }                    
                }
                if(!pub && !temp)
                {
                    node = node.FalseObservationChild;
                    while (true)
                    {
                        if (node.Action == null)
                        {
                            projectedTree.FalseObservationChild = RecDoAgentWiseProjection(
                                node, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                            break;
                        }
                        if (node.Action.Name.ToString().Contains("observe"))
                        {
                            projectedTree.FalseObservationChild = RecDoAgentWiseProjection(
                                node, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                            break;
                        }
                        bool flag = false;

                        foreach (Action act in allPublicActions)
                        {
                            // temporary solution 
                            if ( 
                                (node.Action.Name.ToString().Contains(agent.ToString()) &&
                                (node.Action.Name.ToString().Contains(act.Name.ToString()))) 
                                ||
                                (node.Action.Name.ToString().Contains("obs-") &&
                                (node.Action.Name.ToString().Contains(act.Name.ToString())))
                            )
                            {
                                projectedTree.FalseObservationChild = RecDoAgentWiseProjection(
                                    node, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                                flag = true;
                                break;
                            }
                        }
                        if (flag)
                            break;
                        node = node.SingleChild;
                    }
                }                
            }

            if (savedNode != null)
            {
                /**
                ConditionalPlanTreeNode falseObsChild = new ConditionalPlanTreeNode();
                projectedTree.TrueObservationChild =
                        RecDoAgentWiseProjection(node.TrueObservationChild, agent, setOfRelAction, ref falseObsChild);
                **/
                ConditionalPlanTreeNode falseObsChild = new ConditionalPlanTreeNode();
                bool temp = false; bool flag1 = false;
                if (savedNode.Action == null)  
                {
                    temp = true;
                    projectedTree.TrueObservationChild = RecDoAgentWiseProjection(
                        savedNode, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                }
                else if (savedNode.Action.Name.ToString().Contains("observe"))
                {
                    temp = true;
                    projectedTree.TrueObservationChild = RecDoAgentWiseProjection(
                        savedNode, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                }
                else if (!temp)
                {
                    foreach (Action act in allPublicActions)
                    {
                        if (savedNode.Action.Name.ToString().Contains(agent.ToString()) &&
                            (savedNode.Action.Name.ToString().Contains(act.Name.ToString())))
                        {
                            flag1 = true;
                            projectedTree.TrueObservationChild = RecDoAgentWiseProjection(
                                savedNode, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                            break;
                        }
                    }
                }
                if (!flag1 && !temp)
                {
                    node = savedNode;
                    while (true)
                    {
                        if (node.Action == null)
                        {
                            projectedTree.TrueObservationChild = RecDoAgentWiseProjection(
                                node, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                            break;
                        }
                        if (node.Action.Name.ToString().Contains("observe"))
                        {
                            projectedTree.TrueObservationChild = RecDoAgentWiseProjection(
                                node, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                            break;
                        }
                        bool flag = false;

                        foreach (Action act in allPublicActions)
                        {
                            if (node.Action.Name.ToString().Contains(agent.ToString()) &&
                                (node.Action.Name.ToString().Contains(act.Name.ToString())))
                            {
                                projectedTree.TrueObservationChild = RecDoAgentWiseProjection(
                                    node, agent, allPrivateActions, allPublicActions, ref falseObsChild);
                                flag = true;
                                break;
                            }
                        }
                        if (flag)
                            break;
                        node = node.SingleChild;
                    }
                } 
            }            
            return projectedTree;
        }

        /**  
         * Will be called so that the actions have different names in the translated domain
         * CPOR has issues with actions having same name irrespective of different conditions/effects... **/
        private static Random random = new Random ();
        public static string RandomString (int length)
        {
            const string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
            return new string (Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public static void GroundedAction(Constant agt, HashSet<Constant> agentList, 
            ConditionalPlanTreeNode node, ref StringBuilder sb, ref HashSet<string> extra_propositions, int indicator)
        {            
            if (node == null)
                return;
            if (node.ToString().Equals(")goal"))
            {  
                if (node.childType.Equals("center"))
                {
                    sb.AppendLine();
                    sb.Append("(:action goal-achieve-" + node.SingleParent.Action.Name.ToString());
                    sb.AppendLine();
                    sb.Append("\t:parameters ( ?a - agent )");
                    sb.AppendLine();
                    sb.Append("\t:precondition (and (pre-" + node.SingleParent.Action.Name.ToString() + "))");
                    extra_propositions.Add("(pre-" + node.SingleParent.Action.Name.ToString() + ")");
                    sb.AppendLine();
                    sb.Append("\t:effect (and (done-goal))");
                    extra_propositions.Add("(done-goal)");
                    sb.AppendLine();
                    sb.Append(")");
                }
                else 
                {
                    sb.AppendLine();
                    sb.Append("(:action goal-achieve-" + node.childType.ToString() + "-" + node.SingleParent.Action.Name.ToString());
                    sb.AppendLine();
                    sb.Append("\t:parameters ( ?a - agent )");
                    sb.AppendLine();
                    sb.Append("\t:precondition (and ");
                    
                    /**
                    sb.Append("(" + node.SingleParent.DummyParentActionForObs.Name.ToString() + ")");
                    extra_propositions.Add("(" + node.SingleParent.DummyParentActionForObs.Name.ToString() + ")");
                    **/

                    if(node.childType.Equals("left"))
                    {
                        sb.Append("(" + node.SingleParent.DummyChildActionForFalseObs.Name.ToString() + ")");
                        extra_propositions.Add("(" + node.SingleParent.DummyChildActionForFalseObs.Name.ToString() + ")");
                    }
                    if (node.childType.Equals("right"))
                    {
                        sb.Append("(" + node.SingleParent.DummyChildActionForTrueObs.Name.ToString() + ")");
                        extra_propositions.Add("(" + node.SingleParent.DummyChildActionForTrueObs.Name.ToString() + ")");
                    }

                    ConditionalPlanTreeNode node1 = node;
                    while (node1.SingleParent != null)
                    {
                        /** Come out of loop if the singleParent is a non-observation action. **/
                        if (!node1.SingleParent.Action.Name.Contains("observe"))
                            break;

                        string groundActionLocal = node1.SingleParent.Action.Name.ToString();
                        string[] actParamLocal = groundActionLocal.Split('_');
                        
                        foreach (ParametrizedAction act in problem.Domain.Actions)
                        {
                            if (actParamLocal[1].Equals(act.Name.ToString()))
                            {
                                List<string> param = new List<string>();
                                List<Argument> listExtra = new List<Argument>();
                                bool argu = false;
                                for (int i = 0; i < act.Parameters.Count; i++)
                                {
                                    param.Add(act.Parameters[i].ToString());
                                    if (act.Parameters[i].Type.ToString().Equals("agent"))
                                    {
                                        if (argu)
                                            listExtra.Add(act.Parameters[i]);
                                        argu = true;
                                    }
                                }

                                Formula formula = (Formula)act.Observe;
                                argu = false;
                                foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
                                {
                                    argu = false;
                                    foreach (Argument a in pp.Parameters)
                                    {
                                        foreach (Argument ag in listExtra)
                                        {
                                            if (ag.ToString().Equals(a.ToString()))
                                                argu = true;
                                        }
                                    }

                                    if (argu)
                                        continue;

                                    if (node1.childType.Equals("right"))
                                        sb.Append("(" + pp.Name.ToString());
                                    else
                                        sb.Append("(not (" + pp.Name.ToString());

                                    foreach (Argument a in pp.Parameters)
                                    {
                                        for (int i = 0; i < param.Count; i++)
                                        {
                                            if (param[i].ToString().Equals(a.ToString()))
                                            {
                                                if (a.Type.ToString().Equals("agent"))
                                                {
                                                    sb.Append(" " + agt);
                                                }
                                                else
                                                {
                                                    sb.Append(" " + actParamLocal[i + 2]);
                                                }
                                            }
                                        }
                                    }
                                    if(node1.childType.Equals("right"))
                                        sb.Append(")");
                                    else
                                        sb.Append("))");                                            
                                }
                            }
                        }                        
                        node1 = node1.SingleParent;
                    }
                    if (!node1.childType.Equals("right"))                       
                        sb.Append(")");
                    sb.AppendLine();
                    sb.Append("\t:effect (and (done-goal))");
                    extra_propositions.Add("(done-goal)");
                    sb.AppendLine();
                    sb.Append(")");
                }                
            }            
            StringBuilder stringBuilderLocal = new StringBuilder();
            if (node.Action != null)
            {
                /** To check whether the agent has sensing capability: string matching. 
                 ** When we capture the notion of non-homogenous agents. **/
                bool flag = true;
                if (node.Action.Name.ToString().Contains("observe"))
                {
                    bool check1 = false, check2 = false;
                    foreach (Action act in problem.Domain.Actions)
                    {
                        foreach (Constant cons in agentList)
                        {
                            if (act.Name.ToString().Contains("observe") && act.Name.ToString().Contains(cons.ToString()))
                            {
                                check1 = true;
                            }
                        }
                        if (act.Name.ToString().Contains("observe") && act.Name.ToString().Contains(agt.ToString()))
                        {
                            check2 = true;
                        }
                    }
                    if (check1 && !check2)
                        flag = false;
                }
                if (flag)
                {
                    string groundAction = node.Action.Name.ToString();
                    string[] actParam = groundAction.Split('_');
                    string universalProposition = "";
                    sb.AppendLine();

                    sb.Append("(:action " + "act-" + node.Action.Name.ToString()); 
                    sb.AppendLine();

                    sb.Append("\t:parameters ( ?a - agent )");
                    sb.AppendLine();
                    sb.Append("\t:precondition (and ");

                    /** Case where the current node is center or single child. **/
                    if (node.SingleParent != null && node.SingleParent.SingleChild != null)
                    {
                        sb.Append("(pre-" + node.SingleParent.Action.Name.ToString() + ")");
                        extra_propositions.Add("(pre-" + node.SingleParent.Action.Name.ToString() + ")");
                        stringBuilderLocal.Append("(pre-" + node.SingleParent.Action.Name.ToString() + ")");
                    }

                    /** Case where the current node is the root node of the plan tree. **/
                    if (node.SingleParent == null)
                    {
                        sb.Append("(init-" + node.Action.Name.ToString() + ")");
                        universalProposition += "(init-" + node.Action.Name.ToString() + ")";
                        stringBuilderLocal.Append("(init-" + node.Action.Name.ToString() + ")");
                        extra_propositions.Add("(init-" + node.Action.Name.ToString() + ")");
                                               
                        if (node.Action.Name.ToString().Contains("observe"))
                        {
                            sb.Append("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                            extra_propositions.Add("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                            // stringBuilderLocal.Append("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                        }                        
                    }

                    /** Case where the current node is either a left child or a right child. **/
                    else
                    {
                        if (node.childType.Equals("left"))
                        {
                            sb.Append("(" + node.SingleParent.DummyChildActionForFalseObs.Name.ToString() + ")");
                            stringBuilderLocal.Append("(" + node.SingleParent.DummyChildActionForFalseObs.Name.ToString() + ")");
                            extra_propositions.Add("(" + node.SingleParent.DummyChildActionForFalseObs.Name.ToString() + ")");
                        }

                        if (node.childType.Equals("right"))
                        {
                            sb.Append("(" + node.SingleParent.DummyChildActionForTrueObs.Name.ToString() + ")");
                            stringBuilderLocal.Append("(" + node.SingleParent.DummyChildActionForTrueObs.Name.ToString() + ")");
                            extra_propositions.Add("(" + node.SingleParent.DummyChildActionForTrueObs.Name.ToString() + ")");
                        }
                        
                        /**
                        if (node.SingleParent.DummyParentActionForObs != null)
                        {
                            sb.Append("(immediate-" + node.SingleParent.DummyParentActionForObs.Name.ToString() + ")");
                            extra_propositions.Add("(immediate-" + node.SingleParent.DummyParentActionForObs.Name.ToString() + ")");
                            stringBuilderLocal.Append("(immediate-" + node.SingleParent.DummyParentActionForObs.Name.ToString() + ")");
                        }
                        **/

                        if (node.DummyParentActionForObs != null)
                        {
                            sb.Append("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                            extra_propositions.Add("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                            // stringBuilderLocal.Append("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                        }                        

                        ConditionalPlanTreeNode node1 = node;
                        while (node1.SingleParent != null)
                        {
                            if (!node1.SingleParent.Action.Name.Contains("observe"))
                            {
                                break;
                            }

                            string groundActionLocal = node1.SingleParent.Action.Name.ToString();
                            string[] actParamLocal = groundActionLocal.Split('_');

                            foreach (ParametrizedAction act in problem.Domain.Actions)
                            {
                                if (actParamLocal[1].Equals(act.Name.ToString()))
                                {
                                    List<string> param = new List<string>();
                                    List<Argument> listExtra = new List<Argument>();
                                    bool argu = false;
                                    for (int i = 0; i < act.Parameters.Count; i++)
                                    {
                                        param.Add(act.Parameters[i].ToString());
                                        if (act.Parameters[i].Type.ToString().Equals("agent"))
                                        {
                                            if (argu)
                                                listExtra.Add(act.Parameters[i]);
                                            argu = true;
                                        }
                                    }

                                    Formula formula = (Formula)act.Observe;
                                    argu = false;
                                    foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
                                    {
                                        argu = false;
                                        foreach (Argument a in pp.Parameters)
                                        {
                                            foreach (Argument ag in listExtra)
                                            {
                                                if (ag.ToString().Equals(a.ToString()))
                                                    argu = true;
                                            }
                                        }

                                        if (argu)
                                            continue;

                                        if (node1.childType.Equals("right"))
                                        {
                                            sb.Append("(" + pp.Name.ToString());
                                            stringBuilderLocal.Append("(" + pp.Name.ToString());
                                        }
                                        else
                                        {
                                            sb.Append("(not (" + pp.Name.ToString());
                                            stringBuilderLocal.Append("(not (" + pp.Name.ToString());
                                        }
                                        foreach (Argument a in pp.Parameters)
                                        {
                                            for (int i = 0; i < param.Count; i++)
                                            {
                                                if (param[i].ToString().Equals(a.ToString()))
                                                {
                                                    if (a.Type.ToString().Equals("agent"))
                                                    {
                                                        sb.Append(" " + agt);
                                                        stringBuilderLocal.Append(" " + agt);
                                                    }
                                                    else
                                                    {
                                                        sb.Append(" " + actParamLocal[i + 2]);
                                                        stringBuilderLocal.Append(" " + actParamLocal[i + 2]);
                                                    }
                                                }
                                            }
                                        }
                                        if (node1.childType.Equals("right"))
                                        {
                                            sb.Append(")");
                                            stringBuilderLocal.Append(")");
                                        }
                                        else
                                        {
                                            sb.Append("))");
                                            stringBuilderLocal.Append("))");
                                        }
                                    }
                                }
                            }
                            node1 = node1.SingleParent;
                        }
                    }

                    StringBuilder leftChild = new StringBuilder();
                    StringBuilder rightChild = new StringBuilder();
                    foreach (ParametrizedAction act in problem.Domain.Actions)
                    {
                        if (actParam[1].Contains("joint-push"))
                        {
                            Console.Write("");
                        }

                        if (actParam[1].Equals(act.Name.ToString()))
                        {                            
                            List<string> param = new List<string>();
                            List<Argument> listExtra = new List<Argument>();
                            bool argu = false;
                            Formula formula = (Formula)act.Preconditions;

                            for (int i = 0; i < act.Parameters.Count; i++)
                            {
                                param.Add(act.Parameters[i].ToString());                                
                            }

                            foreach (Predicate ppp in formula.GetAllPredicates())
                            {
                                // temperory solution                                
                                if(! ppp.GetType().ToString().Contains("ParametrizedPredicate"))
                                {
                                    stringBuilderLocal.Append(ppp);
                                    continue;
                                }
                                
                                ParametrizedPredicate pp = (ParametrizedPredicate) ppp; 
                                /** Covers when a predicate has more than one agent in it **/
                                argu = false;                                
                                foreach (Argument a in pp.Parameters)
                                {
                                    for( int i = 0; i < param.Count; i++) 
                                    {
                                        if (param[i].ToString().Equals(a.ToString()))
                                        {
                                            if(a.Type.Equals("agent") && !actParam[1].ToString().Contains("observe"))
                                            {
                                                if (!(actParam[i + 2].ToString().Equals(agt.ToString())))
                                                {
                                                    argu = true; break;
                                                }
                                            }                                            
                                        }
                                    }
                                }
                                if (argu)
                                {
                                    continue;
                                }

                                /** 
                                 * We might need to change the below if later!
                                 * We need it to avoid an action proposition having (= ?a1 a1)
                                 * As of now, we don't need this in the compiled compressed-projected problems.
                                 **/
                                if (pp.Name.ToString().Equals("="))
                                {
                                    continue;
                                }

                                string str = "";
                                bool flagship = false;
                                if (pp.ToString().Contains("not"))
                                {
                                    str += "not (";
                                    flagship = true;
                                }

                                sb.Append("(" + str + pp.Name.ToString());
                                stringBuilderLocal.Append("(" + str + pp.Name.ToString());
                                foreach (Argument a in pp.Parameters)
                                {
                                    for (int i = 0; i < param.Count; i++)
                                    {
                                        if (param[i].ToString().Equals(a.ToString()))
                                        {
                                            if (a.Type.ToString().Equals("agent"))
                                            {
                                                sb.Append(" " + agt);
                                                stringBuilderLocal.Append(" " + agt);
                                            }
                                            else
                                            {
                                                sb.Append(" " + actParam[i + 2]);
                                                stringBuilderLocal.Append(" " + actParam[i + 2]);
                                            }
                                        }
                                    }

                                    if (a.GetType().ToString().Contains("Constant") && a.Type.Equals("agent"))
                                    {
                                        sb.Append(" " + agt);
                                        stringBuilderLocal.Append(" " + agt);
                                    }
                                }
                                sb.Append(")");
                                stringBuilderLocal.Append(")");
                                if (flagship)
                                {
                                    sb.Append(")");
                                    stringBuilderLocal.Append(")");
                                }
                            }
                            sb.Append(")");
                            // stringBuilderLocal.Append(")");

                            if (actParam[1].Contains("observe"))
                            {
                                sb.AppendLine();
                                sb.Append("\t:observe ");
                                formula = (Formula)act.Observe;
                                foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
                                {
                                    argu = false;
                                    foreach (Argument a in pp.Parameters)
                                    {
                                        foreach (Argument ag in listExtra)
                                        {
                                            if (ag.ToString().Equals(a.ToString()))
                                                argu = true;
                                        }
                                    }
                                    if (argu)
                                        continue;

                                    string str = "";
                                    string str1 = "";
                                    bool flagship = false;
                                    bool flagship1 = false;
                                    if (pp.ToString().Contains("not"))
                                    {
                                        str += "not (";
                                        flagship = true;
                                    }

                                    if (! pp.ToString().Contains("not"))
                                    {
                                        str1 += "not (";
                                        flagship1 = true;
                                    }

                                    sb.Append("(" + str + pp.Name.ToString());
                                    rightChild.Append("(" + str + pp.Name.ToString());
                                    leftChild.Append("(" + str1 + pp.Name.ToString());

                                    foreach (Argument a in pp.Parameters)
                                    {
                                        for (int i = 0; i < param.Count; i++)
                                        {
                                            if (param[i].ToString().Equals(a.ToString()))
                                            {
                                                if (a.Type.ToString().Equals("agent"))
                                                {
                                                    sb.Append(" " + agt);
                                                    leftChild.Append(" " + agt);
                                                    rightChild.Append(" " + agt);
                                                }
                                                else
                                                {
                                                    sb.Append(" " + actParam[i + 2]);
                                                    leftChild.Append(" " + actParam[i + 2]);
                                                    rightChild.Append(" " + actParam[i + 2]);
                                                }
                                            }
                                        }
                                    }
                                    sb.Append(")");
                                    leftChild.Append(")");
                                    rightChild.Append(")");
                                    if (flagship)
                                    {
                                        sb.Append(")");
                                        rightChild.Append(")");
                                    }
                                    if (flagship1)
                                    {
                                        leftChild.Append(")");
                                    }
                                }
                            }
                            else
                            {
                                sb.AppendLine();
                                sb.Append("\t:effect (and ");
                                // sb.Append("(not (init-" + node.Action.Name.ToString() + "))");
                                sb.Append("(pre-" + node.Action.Name.ToString() + ")");
                                extra_propositions.Add("(pre-" + node.Action.Name.ToString() + ")");

                                Formula form = (Formula)act.Effects;
                                HashSet<Predicate> predList = form.GetAllPredicates();
                                foreach (Predicate p in predList)
                                {
                                    ParametrizedPredicate pp = null;
                                    try
                                    { 
                                        pp = (ParametrizedPredicate) p;
                                    }
                                    catch(Exception e)
                                    {
                                        // Console.WriteLine(e.Message);
                                        sb.Append(p);
                                        continue;
                                        // Continue because there are no parameters
                                    }

                                    argu = false;                                    
                                    foreach (Argument a in pp.Parameters)
                                    {
                                        for (int i = 0; i < param.Count; i++)
                                        {
                                            if (param[i].ToString().Equals(a.ToString()))
                                            {
                                                if (a.Type.Equals("agent")) 
                                                {
                                                    if (!actParam[i + 2].ToString().Equals(agt.ToString()))
                                                    {
                                                        argu = true; break;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if (argu)
                                        continue;

                                    string str = "";
                                    bool flagship = false;
                                    if (pp.ToString().Contains("not"))
                                    {
                                        str += "not (";
                                        flagship = true;
                                    }

                                    sb.Append("(" + str + pp.Name.ToString());
                                    foreach (Argument a in pp.Parameters)
                                    {
                                        for (int i = 0; i < param.Count; i++)
                                        {
                                            if (param[i].ToString().Equals(a.ToString()))
                                            {
                                                if (a.Type.ToString().Equals("agent"))
                                                    sb.Append(" " + agt);
                                                else
                                                    sb.Append(" " + actParam[i + 2]);
                                            }
                                        }
                                    }
                                    sb.Append(")");
                                    if (flagship)
                                        sb.Append(")");
                                }
                                sb.Append(")");
                            }
                            sb.AppendLine();
                            sb.Append(")");
                        }
                    }

                    // Dummy-parent-action of the current observation node                    
                    if (actParam[1].Contains("observe"))
                    {
                        sb.AppendLine();
                        sb.Append("(:action " + "act-" + node.DummyParentActionForObs.Name.ToString());
                        sb.AppendLine();
                        sb.Append("\t:parameters ( ?a - agent )");
                        sb.AppendLine();
                        if (node.SingleParent != null)
                        {
                            sb.Append("\t:precondition (and ");
                            if (node.SingleParent.Action.Name.ToString().Contains("observe"))
                            {                                
                                // sb.Append("(" + node.SingleParent.DummyParentActionForObs.Name.ToString() + ")");
                                sb.Append(stringBuilderLocal);                                                                
                                // extra_propositions.Add("(" + node.SingleParent.DummyParentActionForObs.Name.ToString() + ")");                                
                            }
                            else
                            {
                                sb.Append("(pre-" + node.SingleParent.Action.Name.ToString() + ")");
                                extra_propositions.Add("(pre-" + node.SingleParent.Action.Name.ToString() + ")");
                                sb.Append(stringBuilderLocal);
                            }
                            sb.Append(")");
                            sb.AppendLine();
                        }
                        else
                        {
                            sb.Append("\t:precondition (and ");
                            sb.Append("(init-" + node.Action.Name.ToString() + ")");
                            sb.Append(")");
                            sb.AppendLine();
                        }
                        sb.Append("\t:effect (and (");
                        sb.Append("immediate-" + node.DummyParentActionForObs.Name.ToString());
                        sb.Append(") )");
                        sb.AppendLine();
                        sb.Append(")");
                        extra_propositions.Add("(" + "immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                    }

                    // The two children dummy actions
                    if (actParam[1].Contains("observe"))
                    {
                        sb.AppendLine();
                        sb.Append("(:action " + node.DummyChildActionForFalseObs.Name.ToString());
                        sb.AppendLine();
                        sb.Append("\t:parameters ( ?a - agent )");
                        sb.AppendLine();
                        sb.Append("\t:precondition (and ");
                        sb.Append(stringBuilderLocal);
                        sb.Append(leftChild);

                        sb.Append("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                        extra_propositions.Add("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                        sb.Append(")");
                        sb.AppendLine();
                        sb.Append("\t:effect (and ");

                        if (!universalProposition.Equals(""))
                        {
                            sb.Append("(not " + universalProposition + ")");
                        }
                        sb.Append("(not " + "(immediate-" + node.DummyParentActionForObs.Name.ToString() + "))");
                        sb.Append("(" + node.DummyChildActionForFalseObs.Name.ToString() + ")");                        
                        sb.Append(")");
                        sb.AppendLine();
                        sb.Append(")");

                        sb.AppendLine();
                        sb.Append("(:action " + node.DummyChildActionForTrueObs.Name.ToString());
                        sb.AppendLine();
                        sb.Append("\t:parameters ( ?a - agent )");
                        sb.AppendLine();
                        sb.Append("\t:precondition (and ");
                        sb.Append(stringBuilderLocal);
                        sb.Append(rightChild);

                        sb.Append("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                        extra_propositions.Add("(immediate-" + node.DummyParentActionForObs.Name.ToString() + ")");
                        sb.Append(")");
                        sb.AppendLine();
                        sb.Append("\t:effect (and ");

                        if (!universalProposition.Equals(""))
                        {
                            sb.Append("(not " + universalProposition + ")");
                        }
                        sb.Append("(not " + "(immediate-" + node.DummyParentActionForObs.Name.ToString() + "))");
                        sb.Append("(" + node.DummyChildActionForTrueObs.Name.ToString() + ")");                        
                        sb.Append(")");
                        sb.AppendLine();
                        sb.Append(")");
                    }
                }
            }
            if (node.SingleChild != null)
            {
                GroundedAction(agt, agentList, node.SingleChild, ref sb, ref extra_propositions, 0);
            }
            if (node.FalseObservationChild != null)
            {
                GroundedAction(agt, agentList, node.FalseObservationChild, ref sb, ref extra_propositions, 1);
            }
            if (node.TrueObservationChild != null)
            {
                GroundedAction(agt, agentList, node.TrueObservationChild, ref sb, ref extra_propositions, 2);
            }            
        }

        public static void RecPrint(ConditionalPlanTreeNode node, int depth, string path, ref StringBuilder sb)
        {            
            if (node == null)
                return;
            /*
            if (node.ToString().Equals(")goal"))
            {
                sb.AppendLine(path + node.ToString());
            }
            */
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
            if (node.ToString().Equals(")goal"))
            {
                sb.AppendLine(path + node.ToString());
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

        /** Ignore this function, never used **/
        private static void CrucialInformation(Problem problem)
        {
            List<Constant> listOfAgts = new List<Constant>();
            List<Constant> interestingConstants = new List<Constant>();
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
                else if (cons.Type.ToString().Equals("pillar") && problem.Name.Contains("hsd"))
                {
                    interestingConstants.Add(cons);
                }
            }
        }
    }
}

///// ------------------------ commented - part of earlier implimentation ----- /////
/* GroundedAction, line 580
if (node.SingleParent.FalseObservationChild != null && indicator == 1)
{
    if (node.SingleParent.FalseObservationChild.ToString().Equals(")goal"))
    {                        
        sb.AppendLine();
        sb.Append("(:action goal-achieve-" + node.SingleParent.Action.Name.ToString());
        sb.AppendLine();
        sb.Append("\t:parameters ( ?a - agent )");
        sb.AppendLine();
        sb.Append("\t:precondition (and ");

        string groundActionLocal = node.SingleParent.Action.Name.ToString();
        string[] actParamLocal = groundActionLocal.Split('_');
                        
        // sb.Append("(pre-" + nodeOrig.Action.Name.ToString() +")");
        // extra_propositions.Add("(pre-" + nodeOrig.Action.Name.ToString() + ")");
        foreach (ParametrizedAction act in problem.Domain.Actions)
        {
            if (act.Name.ToString().Equals(actParamLocal[0])) 
            {
                List<string> param = new List<string>();
                List<Argument> listExtra = new List<Argument>();
                bool argu = false;
                for (int i = 0; i < act.Parameters.Count; i++)
                {
                    param.Add(act.Parameters[i].ToString());
                    if (act.Parameters[i].Type.ToString().Equals("agent"))
                    {
                        if (argu)
                            listExtra.Add(act.Parameters[i]);
                        argu = true;
                    }
                }
                Formula formula = (Formula)act.Observe;
                argu = false;
                foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
                {
                    argu = false;
                    foreach (Argument a in pp.Parameters)
                    {
                        foreach (Argument ag in listExtra)
                        {
                            if (ag.ToString().Equals(a.ToString()))
                                argu = true;
                        }
                    }
                    if (argu)
                        continue;

                    // negative
                    sb.Append("( not (" + pp.Name.ToString());
                    foreach (Argument a in pp.Parameters)
                    {
                        for (int i = 0; i < param.Count; i++)
                        {
                            if (param[i].ToString().Equals(a.ToString()))
                            {
                                if (a.Type.ToString().Equals("agent"))
                                {
                                    sb.Append(" " + agt);
                                }
                                else
                                {
                                    sb.Append(" " + actParamLocal[i + 1]);
                                }
                            }
                        }
                    }
                    sb.Append(")) )");
                    //sb.Append(")");
                }
            }
        }
        sb.AppendLine();
        sb.Append("\t:effect (and (done-goal))");
        extra_propositions.Add("(done-goal)");
        sb.AppendLine();
        sb.Append(")");                        
    }
} 
if (node.SingleParent.TrueObservationChild != null && indicator == 2)
{
    if (node.SingleParent.TrueObservationChild.ToString().Equals(")goal"))
    {
        sb.AppendLine();
        sb.Append("(:action goal-achieve-" + node.SingleParent.Action.Name.ToString());
        sb.AppendLine();
        sb.Append("\t:parameters ( ?a - agent )");
        sb.AppendLine();
        sb.Append("\t:precondition (and ");
        // extra_propositions.Add("(pre-" + nodeOrig.Action.Name.ToString() + ")");

        string groundActionLocal = node.SingleParent.Action.Name.ToString();
        string[] actParamLocal = groundActionLocal.Split('_');
        // sb.Append("(pre-" + nodeOrig.Action.Name.ToString() +")");
        // extra_propositions.Add("(pre-" + nodeOrig.Action.Name.ToString() + ")");
        foreach (ParametrizedAction act in problem.Domain.Actions) 
        {
            if (act.Name.ToString().Equals(actParamLocal[0]))
            {
                List<string> param = new List<string>();
                List<Argument> listExtra = new List<Argument>();
                bool argu = false;
                for (int i = 0; i < act.Parameters.Count; i++)
                {
                    param.Add(act.Parameters[i].ToString());
                    if (act.Parameters[i].Type.ToString().Equals("agent"))
                    {
                        if (argu)
                            listExtra.Add(act.Parameters[i]);
                        argu = true;
                    }
                }
                Formula formula = (Formula)act.Observe;
                argu = false;
                foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
                {
                    argu = false;
                    foreach (Argument a in pp.Parameters)
                    {
                        foreach (Argument ag in listExtra)
                        {
                            if (ag.ToString().Equals(a.ToString()))
                                argu = true;
                        }
                    }
                    if (argu)
                        continue;

                    // positive
                    sb.Append("(" + pp.Name.ToString());
                    foreach (Argument a in pp.Parameters)
                    {
                        for (int i = 0; i < param.Count; i++)
                        {
                            if (param[i].ToString().Equals(a.ToString()))
                            {
                                if (a.Type.ToString().Equals("agent"))
                                {
                                    sb.Append(" " + agt);
                                }
                                else
                                {
                                    sb.Append(" " + actParamLocal[i + 1]);
                                }
                            }
                        }
                    }
                    sb.Append("))");
                }
            }
        }
        sb.AppendLine();
        sb.Append("\t:effect (and (done-goal))");
        extra_propositions.Add("(done-goal)");
        sb.AppendLine();
        sb.Append(")");
    }
}*/

// line 995
// An extra action that keeps O and ~O in precondition
// For now it considers that there is only one oveservation variable
// positive version
/*
if (actParam[0].Contains("observe"))
{
    sb.AppendLine();
    sb.Append("(:action pos-dummy-" + node.Action.Name.ToString());
    sb.AppendLine();
    sb.Append("\t:parameters ( ?a - agent )");
    sb.AppendLine();
    sb.Append("\t:precondition (and ");
    formula = (Formula)act.Observe;
    foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
    {
        argu = false;
        foreach (Argument a in pp.Parameters)
        {
            foreach (Argument ag in listExtra)
            {
                if (ag.ToString().Equals(a.ToString()))
                    argu = true;
            }
        }
        if (argu)
            continue;

        // positive
        sb.Append("(" + pp.Name.ToString());
        foreach (Argument a in pp.Parameters)
        {
            for (int i = 0; i < param.Count; i++)
            {
                if (param[i].ToString().Equals(a.ToString()))
                {
                    if (a.Type.ToString().Equals("agent"))
                    {
                        sb.Append(" " + agt);
                    }
                    else
                    {
                        sb.Append(" " + actParam[i + 1]);
                    }
                }
            }
        }
        sb.Append(")");                                
        sb.Append(")");
        sb.AppendLine();
        sb.Append("\t:effect (and (pre-" + node.Action.Name.ToString() + "))");
        extra_propositions.Add("(pre-" + node.Action.Name.ToString() + ")");
    }
}
sb.AppendLine();
sb.Append(")");

// negative version
if (actParam[0].Contains("observe"))
{
    sb.AppendLine();
    sb.Append("(:action neg-dummy-" + node.Action.Name.ToString());
    sb.AppendLine();
    sb.Append("\t:parameters ( ?a - agent )");
    sb.AppendLine();
    sb.Append("\t:precondition (and ");
    formula = (Formula)act.Observe;
    foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
    {
        argu = false;
        foreach (Argument a in pp.Parameters)
        {
            foreach (Argument ag in listExtra)
            {
                if (ag.ToString().Equals(a.ToString()))
                    argu = true;
            }
        }
        if (argu)
            continue;

        // negative
        sb.Append("(not (" + pp.Name.ToString());
        foreach (Argument a in pp.Parameters)
        {
            for (int i = 0; i < param.Count; i++)
            {
                if (param[i].ToString().Equals(a.ToString()))
                {
                    if (a.Type.ToString().Equals("agent"))
                    {
                        sb.Append(" " + agt);
                    }
                    else
                    {
                        sb.Append(" " + actParam[i + 1]);
                    }
                }
            }
        }
        sb.Append(")))");
        sb.AppendLine();
        sb.Append("\t:effect (and (pre-" + node.Action.Name.ToString() + "))");
        extra_propositions.Add("(pre-" + node.Action.Name.ToString() + ")");
    }
}
sb.AppendLine();
sb.Append(")");
*/

/*
if (node.SingleParent.FalseObservationChild != null && indicator == 1)                    
{
    if (node.SingleParent.FalseObservationChild.Action != null)
    {
        if (node.SingleParent.FalseObservationChild.Action.Name.ToString().Equals(node.Action.Name.ToString()))
        {   
            string groundActionLocal = node.SingleParent.Action.Name.ToString();
            string[] actParamLocal = groundActionLocal.Split('_');
                                
            foreach (ParametrizedAction act in problem.Domain.Actions)
            {
                if (act.Name.ToString().Equals(actParamLocal[0]))
                {
                    List<string> param = new List<string>();
                    List<Argument> listExtra = new List<Argument>();
                    bool argu = false;
                    for (int i = 0; i < act.Parameters.Count; i++)
                    {
                        param.Add(act.Parameters[i].ToString());
                        if (act.Parameters[i].Type.ToString().Equals("agent"))
                        {
                            if (argu)
                                listExtra.Add(act.Parameters[i]);
                            argu = true;
                        }
                    }
                    Formula formula = (Formula)act.Observe;
                    argu = false;
                    foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
                    {
                        argu = false;
                        foreach (Argument a in pp.Parameters)
                        {
                            foreach (Argument ag in listExtra)
                            {
                                if (ag.ToString().Equals(a.ToString()))
                                    argu = true;
                            }
                        }
                        if (argu)
                            continue;

                        // negative
                        sb.Append("( not (" + pp.Name.ToString());
                        foreach (Argument a in pp.Parameters)
                        {
                            for (int i = 0; i < param.Count; i++)
                            {
                                if (param[i].ToString().Equals(a.ToString()))
                                {
                                    if (a.Type.ToString().Equals("agent"))
                                    {
                                        sb.Append(" " + agt);
                                    }
                                    else
                                    {
                                        sb.Append(" " + actParamLocal[i + 1]);
                                    }
                                }
                            }
                        }
                        sb.Append(")");
                        sb.Append(")");
                    }
                }
            }
        }
    }
}
if (node.SingleParent.TrueObservationChild != null && indicator ==2)
{
    if (node.SingleParent.TrueObservationChild.Action != null)
    {
        if (node.SingleParent.TrueObservationChild.Action.Name.ToString().Equals(node.Action.Name.ToString()))
        {
            string groundActionLocal = node.SingleParent.Action.Name.ToString();
            string[] actParamLocal = groundActionLocal.Split('_');
            // sb.Append("(pre-" + nodeOrig.Action.Name.ToString() +")");
            // extra_propositions.Add("(pre-" + nodeOrig.Action.Name.ToString() + ")");
            foreach (ParametrizedAction act in problem.Domain.Actions)
            {
                if (act.Name.ToString().Equals(actParamLocal[0]))
                {
                    List<string> param = new List<string>();
                    List<Argument> listExtra = new List<Argument>();
                    bool argu = false;
                    for (int i = 0; i < act.Parameters.Count; i++)
                    {
                        param.Add(act.Parameters[i].ToString());
                        if (act.Parameters[i].Type.ToString().Equals("agent"))
                        {
                            if (argu)
                                listExtra.Add(act.Parameters[i]);
                            argu = true;
                        }
                    }
                    Formula formula = (Formula)act.Observe;
                    argu = false;
                    foreach (ParametrizedPredicate pp in formula.GetAllPredicates())
                    {
                        argu = false;
                        foreach (Argument a in pp.Parameters)
                        {
                            foreach (Argument ag in listExtra)
                            {
                                if (ag.ToString().Equals(a.ToString()))
                                    argu = true;
                            }
                        }
                        if (argu)
                            continue;

                        // positive
                        sb.Append("(" + pp.Name.ToString());
                        foreach (Argument a in pp.Parameters)
                        {
                            for (int i = 0; i < param.Count; i++)
                            {
                                if (param[i].ToString().Equals(a.ToString()))
                                {
                                    if (a.Type.ToString().Equals("agent"))
                                    {
                                        sb.Append(" " + agt);
                                    }
                                    else
                                    {
                                        sb.Append(" " + actParamLocal[i + 1]);
                                    }
                                }
                            }
                        }
                        sb.Append(")");
                    }
                }
            }
        }
    }
}    
*/
