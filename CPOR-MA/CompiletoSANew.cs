using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace CPOR_MA
{
    public class CompiletoSANew
    {
        public static List<string> listOfOtherAgt = null;
        public static List<Constant> interestingConstants = null;
        public CompiletoSANew(Constant agt, Problem problem)
        {
            listOfOtherAgt = new List<string>();
            interestingConstants = new List<Constant>();
            foreach (Constant cons in problem.Domain.Constants)
            {
                if (cons.Type.ToString().Equals("agent") && !cons.ToString().Equals(agt.ToString()))
                {
                    listOfOtherAgt.Add(cons.ToString());
                }                
                if (cons.Type.ToString().Equals("box") && problem.Name.Contains("box"))
                {
                    interestingConstants.Add(cons);
                }
                else if (cons.Type.ToString().Equals("table") && problem.Name.Contains("table"))
                {
                    interestingConstants.Add(cons);
                }
                else if (cons.Type.ToString().Equals("hsd") && problem.Name.Contains("hsd"))
                {
                    interestingConstants.Add(cons);
                }
            }
        }
        
        public static void GenerateAgentWiseAugmentedDomains (Problem problem, Constant agt, HashSet<Constant> agentList,
            ConditionalPlanTreeNode shrunkAgtPlanTree, HashSet<Action> publicActions, String childDomainFolder)
        {            
            String filePath = "\\" + childDomainFolder + "\\" + agt.ToString() + "\\";
            System.IO.FileInfo file = new System.IO.FileInfo(childDomainFolder + "\\" + agt.ToString() + "\\" + "d.pddl");
            file.Directory.Create();

            StringBuilder domain = new StringBuilder();
            // StringBuilder domain1 = new StringBuilder();
            domain.Append("(define ");
            domain.Append("(domain" + " " + problem.domainName().ToString() + "-" + agt.ToString());
            domain.Append(")");
            domain.AppendLine();
            domain.Append("(:types ");

            foreach (String t in problem.Domain.Types)
            {
                domain.Append(t + " ");
            }
            domain.Append(")");
            domain.AppendLine();
            domain.Append("(:constants ");
            foreach (Constant c in problem.Domain.Constants)
            {
                if (c.Type == "agent" && !c.ToString().Equals(agt.ToString()))
                    continue;
                else
                {
                    domain.AppendLine();
                    domain.Append("\t" + c + " - " + c.Type);
                }
            }
            domain.AppendLine();
            domain.Append(")");
            domain.AppendLine();
            domain.Append("(:predicates ");

            foreach (ParametrizedPredicate pp in problem.Domain.Predicates)
            {
                if (pp.getPredicateType().Count < 2)
                {
                    domain.AppendLine();
                    domain.Append("\t" + pp.getPredicate());
                }
            }

            StringBuilder groundedPubAction = new StringBuilder();
            HashSet<string> extra_propositions = new HashSet<string>();
            ProjectionOfSATree.GroundedAction(agt, agentList, shrunkAgtPlanTree, ref groundedPubAction, ref extra_propositions, 0);            
            // Console.WriteLine(groundedPubAction);

            foreach (string prop in extra_propositions)
            {
                domain.AppendLine();
                domain.Append("\t" + prop);
            }
            domain.AppendLine();
            domain.Append(")");
            domain.AppendLine();

            foreach (ParametrizedAction act in problem.Domain.Actions)
            {
                bool contin = false;
                foreach (Action a in publicActions)
                    if (a.Name.ToString().Equals(act.Name.ToString()))
                        contin = true;
                if (contin)
                    continue;

                bool foo = false;
                foreach (Action action in publicActions)
                {
                    if (act.Name.ToString().Equals(action.Name.ToString()))
                    {
                        foo = true; break;
                    }
                }
                if (foo)
                    continue;
                domain.AppendLine();
                domain.Append("(:action ");
                domain.Append(act.Name.ToString());
                domain.AppendLine();
                domain.Append("\t:parameters (");
                uint count = 0;
                String homogenousAgent = "a1";
                foreach (Parameter param in act.Parameters)
                {
                    if (param.Type.ToString().Equals("agent"))
                    {
                        if (++count < 2 && act.ToString().Contains("joint-"))
                        {
                            domain.Append(" ?a1 - " + param.Type);
                        }
                        else if (count < 2)
                        {
                            domain.Append(" " + param.ToString() + " - " + param.Type);
                        }
                    }
                    else
                    {
                        domain.Append(" " + param.ToString() + " - " + param.Type);
                    }
                }
                domain.Append(")");
                domain.AppendLine();
                domain.Append("\t:precondition (and ");
                Formula f = act.Preconditions;
                if (act.Name.ToString().Contains("joint-"))
                {
                    foreach (ParametrizedPredicate p in f.GetAllPredicates())
                    {
                        //count = 0;
                        foreach (String s in listOfOtherAgt)
                        {
                            if (p.ToString().Contains(homogenousAgent))
                                count++;
                        }
                        bool foo1 = false, foo2 = true, foo3 = true;
                        foreach (Argument arg in p.Parameters)
                        {
                            String str = arg.ToString().Split('?')[1];
                            if (arg.Type.ToString().Equals("agent"))
                            {
                                if (str.ToString().Equals(homogenousAgent))
                                {
                                    foo1 = true;
                                }
                                else
                                {
                                    foo2 = false;
                                }
                                foo3 = false;
                            }
                        }
                        if (foo1 && foo2)
                            domain.Append(p.ToString() + " ");
                        else if (foo3)
                            domain.Append(p.ToString() + " ");
                    }
                }
                else
                {
                    foreach (object p in f.GetAllPredicates())
                    {
                        domain.Append(p.ToString() + " ");
                    }
                }
                domain.Append(")");
                domain.AppendLine();
                f = act.Effects;
                if (act.Name.ToString().Contains("joint-"))
                {
                    if (f != null)
                    {
                        domain.Append("\t:effect (and ");
                        foreach (ParametrizedPredicate p in f.GetAllPredicates())
                        {

                            count = 0;
                            //foreach (String s in listOfOtherAgt)
                            {
                                if (p.ToString().Contains(homogenousAgent))
                                    count++;
                            }
                            if (count == 0)
                                domain.Append(p.ToString() + " ");

                            bool foo1 = false, foo2 = true, foo3 = true;
                            foreach (Argument arg in p.Parameters)
                            {
                                String str = arg.ToString().Split('?')[1];
                                if (arg.Type.ToString().Equals("agent"))
                                {
                                    if (str.ToString().Equals(homogenousAgent))
                                    {
                                        foo1 = true;
                                    }
                                    else
                                    {
                                        foo2 = false;
                                    }
                                    foo3 = false;
                                }
                            }
                            if (foo1 && foo2)
                                domain.Append(p.ToString() + " ");
                            else if (foo3)
                                domain.Append(p.ToString() + " ");
                        }

                        domain.Append(")");
                        domain.AppendLine();
                    }
                }
                else if (f != null)
                {
                    domain.Append("\t:effect (and ");
                    HashSet<Predicate> allPredicates = f.GetAllPredicates();

                    foreach (object p in f.GetAllPredicates())
                    {
                        domain.Append(p.ToString() + " ");
                    }
                    domain.Append(")");
                    domain.AppendLine();
                }
                f = act.Observe;
                if (f != null)
                {
                    domain.Append("\t:observe ");
                    foreach (Predicate p in f.GetAllPredicates())
                    {
                        count = 0;
                        foreach (String s in listOfOtherAgt)
                        {
                            if (p.ToString().Contains(s))
                                count++;
                        }
                        if (count == 0)
                            domain.Append(p.ToString() + " ");
                    }
                }
                domain.Append(")");                
            }
            domain.Append(groundedPubAction);
            groundedPubAction = null;
            domain.AppendLine();
            domain.Append(")");
            System.IO.File.WriteAllText(file.FullName, domain.ToString());
        }

        public static void generateAgentWiseAugmentedProblem (Problem problem, 
            ConditionalPlanTreeNode shrunkAgtPlanTree, Constant agt, HashSet<Action> publicActions, String childDomainFolder)
        {   
            String filePath = "\\" + childDomainFolder + "\\" + agt.ToString() + "\\";
            System.IO.FileInfo file = new System.IO.FileInfo(childDomainFolder + "\\" + agt.ToString() + "\\" + "p.pddl");
            file.Directory.Create(); StringBuilder prob = new StringBuilder();

            prob.Append("(define ");
            prob.AppendLine();
            prob.Append("(problem " + problem.Name.ToString() + ")");
            prob.AppendLine();
            prob.Append("(:domain" + " " + problem.domainName().ToString() + "-" + agt.ToString());
            prob.Append(")");
            prob.AppendLine();
            prob.Append("(:goal (and (done-goal)))");
            
            prob.AppendLine();
            prob.Append("(:init (and ");
            prob.AppendLine();
            prob.Append("\t(init-" + shrunkAgtPlanTree.Action.Name.ToString() + ")");
            foreach (GroundedPredicate p in problem.knownPredicates())
            {
                bool flag = true;
                List<Constant> listConst = p.Constants;
                foreach (String str in listOfOtherAgt)
                {
                    int counter = 0;
                    foreach (Constant cc in listConst)
                    {                        
                        if (cc.ToString().ToString().Equals(str))
                        {
                            flag = false; break;
                        }
                        if (cc.Type.ToString().Equals("agent"))
                        {
                            counter++;
                        }
                    }
                    if (counter >= 2)
                    {
                        flag = false; break;
                    }
                }
               
                if (flag)
                {
                    prob.AppendLine();
                    prob.Append("\t" + p.ToString());
                }
            }
            foreach (Formula p in problem.hiddenFormula())
            {
                bool flag = true, flag1 = true;
                foreach (String str in listOfOtherAgt)
                {
                    if (p.ToString().Contains(str) || p.ToString().Split(new string[] { agt.ToString() },
                        StringSplitOptions.None).Length > 2)
                    {
                        flag = false;
                    }
                }
                /*
                foreach (Constant c in cons)
                {
                    if (p.ToString().Contains(c.ToString()))
                        flag1 = false;
                }
                */
                if (flag && flag1)
                {
                    prob.AppendLine();
                    prob.Append("\t" + p.ToString());
                }
            }
            prob.AppendLine();
            prob.Append(") )");
            prob.AppendLine();
            prob.Append(")");
            /*
            prob.AppendLine();
            prob.Append("\t(nothingtoachieve " + agt.ToString() + ")");
            prob.AppendLine();
            prob.Append(") ) )");
            prob.AppendLine();
            */
            System.IO.File.WriteAllText(file.FullName, prob.ToString());
        }
    }
}
