using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace CPOR_MA
{
    public class CompiletoSA_BDD
    {
        public static List<string> listOfOtherAgt = null;
        public static List<Constant> interestingConstants = null;
        public CompiletoSA_BDD(Constant agt, Problem problem) 
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

        public static void generateAgentWiseAugmentedDomains(
            Problem problem,
            Dictionary<string, List<string>> disjunctiveCondStringList,
            //HashSet<Dictionary<String, String>> agentActionCond,
            Constant agt,
            String childDomainFolder)
        {
            String filePath = "\\" + childDomainFolder + "\\" + agt.ToString() + "\\";
            System.IO.FileInfo file =
                new System.IO.FileInfo(childDomainFolder + "\\" + agt.ToString() + "\\" + "d.pddl");
            file.Directory.Create();
            StringBuilder domain = new StringBuilder();
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
                    domain.Append( "\t" + c + " - " + c.Type);
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
            domain.AppendLine();
            domain.Append("\t" + "(nothingtoachieve ?a - agent)");
            domain.AppendLine();
            domain.Append("\t" + "(nothingachieved ?a - agent)");
            domain.AppendLine();
             
            /*
            // Much more work is required here
            bool brk = false;
            HashSet<string> youHaveAlreadyAdded = new HashSet<string>();
            foreach (String act in agentActionCond1.Keys)
            {
                List<List<string>> disCond = agentActionCond1[act];

                String obs = ""; //= actionObs[action];
                // sample: obs = "w|(x&z)|(~x&y)|(~y&z)";
                String[] obsList = obs.Split('|');
                // considering that there will be a&b type of observation
                obsList = obsList[0].Split('&');
                foreach (String str in obsList)
                {
                    foreach (Constant c in interestingConstants)
                    {
                        if (str.Contains(c.ToString()))
                        {
                            brk = true;
                            domain.Append("\t(achieve ?" + c.ToString() + " - " + c.Type + ")");
                        }
                        if (brk) break; // this needs to be removed later 
                    }
                    if (brk) break;
                }
            }
            
            domain.AppendLine();
            domain.Append(")");
            domain.AppendLine();
            foreach (ParametrizedAction act in problem.Domain.Actions)
            {
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
                        /*foreach (String s in listOfOtherAgt)
                        {
                            if (p.ToString().Contains(homogenousAgent))
                                count++;
                        }* /
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
                    foreach (ParametrizedPredicate p in f.GetAllPredicates())
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
                            /*
                        count = 0;
                        //foreach (String s in listOfOtherAgt)
                        {
                            if (p.ToString().Contains(homogenousAgent))
                                count++;
                        }
                        if (count == 0)
                            domain.Append(p.ToString() + " ");
                            * /
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

                        // Much more corrections required here
                        bool flag = false; // right now just table is considered
                        foreach (Dictionary<String, String> actionObs in agentActionCond)
                        {
                            foreach (String action in actionObs.Keys)
                            {
                                String obs = actionObs[action];
                                if (action.Split('_')[1].Equals(act.Name))
                                {
                                    foreach (Constant c in interestingConstants)
                                    {                                        
                                        List<Parameter> pList = act.Parameters;
                                        foreach (Parameter p in pList)
                                        {
                                            if (p.Type.Equals(c.Type))
                                            {
                                                domain.Append("(achieve " + p + ")");
                                                flag = true;
                                                break; // this needs to be removed later 
                                            }
                                        }
                                        if (flag)
                                            break;
                                    }
                                }
                                if (flag)
                                    break;
                            }
                            if (flag)
                                break;
                        }
                        domain.Append(")");
                        domain.AppendLine();
                    }
                }
                else if (f != null)
                {
                    domain.Append("\t:effect (and ");
                    foreach (ParametrizedPredicate p in f.GetAllPredicates())
                    {
                        domain.Append(p.ToString() + " ");
                    }
                        // Much more corrections required here
                    foreach (Dictionary<String, String> actionObs in agentActionCond)
                    {
                        foreach (String action in actionObs.Keys)
                        {
                            String obs = actionObs[action];
                            if (action.Split('_')[1].Equals(act.Name))
                            {
                                foreach (Constant c in interestingConstants)
                                {
                                    bool flag = false;
                                    List<Parameter> pList = act.Parameters;
                                    foreach (Parameter p in pList)
                                    {
                                        if (p.Type.Equals(c.Type))
                                        {
                                            domain.Append("\t(achieve " + p + ")");
                                            flag = true;
                                            break; // this needs to be removed later 
                                        }
                                    }
                                    if (flag)
                                        break;
                                }
                            }
                        }
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
                domain.AppendLine();
            }
            domain.AppendLine();
            domain.Append("(:action donothing :parameters (?a - agent) :precondition (and (nothingtoachieve ?a)) :effect (and (nothingachieved ?a)))");
            domain.AppendLine();
            foreach (Dictionary<String, String> actionCond in agentActionCond)
            {
                foreach (String act in actionCond.Keys)
                {
                    String obsDisj = actionCond[act];

                    /*
                        String obs = actionObs[action];
                    // sample: obs = "w|(x&z)|(~x&y)|(~y&z)";
                    String[] obsList = obs.Split('|');
                    // considering that there will be a&b type of observation
                    obsList = obsList[0].Split('&');                    
                    foreach (String str in obsList)
                    {   
                    * /
                    foreach (Constant c in interestingConstants)
                    {
                        if (obsDisj.Contains(c.ToString()))
                        {
                            domain.AppendLine();
                            domain.Append("(:action ");
                            domain.Append("dummy-action-" + c.ToString());
                            domain.AppendLine();
                            domain.Append("\t:parameters ()");
                            domain.AppendLine();
                            domain.Append("\t:precondition (and ");
                            foreach(CompoundFormula f in problem.hiddenFormula())
                            {
                                bool b = false;
                                foreach(Formula ff in f.Operands)
                                {
                                    if(ff.ToString().Contains(c.ToString()))
                                    {
                                        domain.Append("(not " + ff.ToString() + ") )");
                                        b = true;
                                        break;
                                    }
                                }
                                if (b)
                                    break;
                            }
                            domain.AppendLine();
                            domain.Append("\t:effect (and ");
                            domain.Append("(achieve " + c.ToString() + ")"); 
                        }
                    }
                    domain.Append(") )");
                    domain.AppendLine();
                }                
            }
            */
            domain.Append(")");
            System.IO.File.WriteAllText(file.FullName, domain.ToString());
        }

        public static void generateAgentWiseAugmentedProblem(
            Problem problem,
            HashSet<Dictionary<String, String>> agentActionCond,
            Constant agt,
            String childDomainFolder)
        {
            String filePath = "\\" + childDomainFolder + "\\" + agt.ToString() + "\\";
            System.IO.FileInfo file =
                new System.IO.FileInfo(childDomainFolder + "\\" + agt.ToString() + "\\" + "p.pddl");
            file.Directory.Create(); StringBuilder prob = new StringBuilder();
            prob.Append("(define ");
            prob.AppendLine();
            prob.Append("(problem " + problem.Name.ToString() + ")");
            prob.AppendLine();
            prob.Append("(:domain" + " " + problem.domainName().ToString() + "-" + agt.ToString());
            prob.Append(")");
            prob.AppendLine();
            prob.Append("(:goal (and ");
            Formula goal = problem.Goal;
            HashSet<Constant> cons = new HashSet<Constant>();

            // if there is nothing to achieve for and agent 
            bool nothingToAchieve = true;
            foreach (Predicate pred in goal.GetAllPredicates())
            {
                bool flag = true, flag1 = false;
                foreach (String str in listOfOtherAgt)
                {
                    if (pred.ToString().Contains(str))
                    {
                        flag = false;
                    }
                }                
                foreach (Constant c in interestingConstants)
                {
                    flag1 = false;
                    foreach (Dictionary<String,string> dictActCond in agentActionCond)
                    {
                        foreach(String key in dictActCond.Keys)
                        {                        
                            if (dictActCond[key].Contains(c.ToString()) && key.Contains(c.ToString()))
                            {
                                flag1 = true;
                            }
                        }
                    }
                    if (!flag1)
                    {
                        cons.Add(c);
                    }
                }
                if (flag)
                {
                    bool temp = true;
                    foreach(Constant c in cons)
                    {
                        if (pred.ToString().Contains(c.ToString()))
                        {
                            temp = false; 
                        }
                    }
                    if (temp)
                    {
                        prob.AppendLine();
                        prob.Append("\t" + pred.ToString());
                        nothingToAchieve = false;
                    }
                }
            }
            if (nothingToAchieve)
            {
                prob.AppendLine();
                prob.Append("(nothingachieved " + agt.ToString() + ")");
            }
            // Much more corrections required here
            foreach (Dictionary<String, String> actionObs in agentActionCond)
            {
                foreach(String action in actionObs.Keys)
                {
                    String obs = actionObs[action];
                    // sample: obs = "w|(x&z)|(~x&y)|(~y&z)";
                    String[] obsList = obs.Split('|');
                    // considering that there will be a&b type of observation
                    obsList = obsList[0].Split('&');
                    foreach(String str in obsList)
                    {
                        foreach(Constant c in interestingConstants)
                        {
                            if (str.Contains(c.ToString()))
                            {
                                prob.AppendLine();
                                prob.Append("(achieve " + c.ToString() + ")");
                            }
                        }                        
                    }
                }                
            }
            prob.Append(")");
            prob.Append(")");
            prob.AppendLine();
            prob.Append("(:init (and ");
            foreach(GroundedPredicate p in problem.knownPredicates())
            {
                bool flag = true, flag1 = true;                
                foreach (String str in listOfOtherAgt)
                {
                    if (p.ToString().Contains(str) || p.ToString().Split(new string[] {agt.ToString()}, 
                        StringSplitOptions.None).Length > 2)
                    {
                        flag = false;
                    }
                }
                foreach(Constant c in cons)
                {
                    if (p.ToString().Contains(c.ToString()))
                        flag1 = false;
                }
                if (flag && flag1)
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
                foreach (Constant c in cons)
                {
                    if (p.ToString().Contains(c.ToString()))
                        flag1 = false;
                }
                if (flag && flag1)
                {
                    prob.AppendLine();
                    prob.Append("\t" + p.ToString());
                }
            }
            //prob.Append(")");
            prob.AppendLine();
            prob.Append("\t(nothingtoachieve " + agt.ToString() + ")");
            prob.AppendLine();
            prob.Append(") ) )");
            prob.AppendLine();
            System.IO.File.WriteAllText(file.FullName, prob.ToString());
        }
    }
}
