using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CPOR_MA
{
    public class ExtraxtConditions
    {
        public static Problem prob;
        public static List<String> branches;

        public ExtraxtConditions(Problem p, List<String> b)
        {
            prob = p;
            branches = b;
        }

        /* Not a decent way to do like this, it could be very time consuming. */
        public static Dictionary<Constant, HashSet<Dictionary<String, HashSet<Dictionary<String, uint>>>>> agtWiseCondPerAction()
        {
            Dictionary<Constant, HashSet<HashSet<Dictionary<String, Dictionary<String, uint>>>>> keyValuePairs = extraxtConditions();
            HashSet<String> hashKeys = null;
            Dictionary<Constant, HashSet<String>> hashedAgentVariable = new Dictionary<Constant, HashSet<string>>();
            foreach(Constant c in keyValuePairs.Keys)
            {
                hashKeys = new HashSet<string>();
                HashSet<HashSet<Dictionary<String, Dictionary<String, uint>>>> keyValues = keyValuePairs[c];
                foreach(HashSet<Dictionary<String, Dictionary<String, uint>>> setDict in keyValues)
                {
                    foreach(Dictionary<String, Dictionary<String, uint>> dict in setDict)
                    {
                        foreach(String str in dict.Keys)
                        {                            
                            hashKeys.Add(str); // it's a weird way to do like this, need to improve later
                        }
                    }
                }
                hashedAgentVariable.Add(c, hashKeys);
            }

            // This code to see which agents does which collaborative action under which conditions
            Dictionary<Constant, HashSet<Dictionary<String, HashSet<Dictionary<String, uint>>>>> agentWiseEachActionDisSetCond = new
                Dictionary<Constant, HashSet<Dictionary<String, HashSet<Dictionary<String, uint>>>>>();
            HashSet<Dictionary<String, HashSet<Dictionary<String, uint>>>> agentWiseEachActionDisCond = null;
            foreach (Constant c in keyValuePairs.Keys)
            {
                agentWiseEachActionDisCond = new HashSet<Dictionary<String, HashSet<Dictionary<String, uint>>>>();
                Dictionary<String, HashSet<Dictionary<String, uint>>> actionDisCond = null;
                foreach (String str in hashedAgentVariable[c])
                {
                    actionDisCond = new Dictionary<string, HashSet<Dictionary<string, uint>>>();
                    HashSet<HashSet<Dictionary<String, Dictionary<String, uint>>>> keyValues = keyValuePairs[c];
                    HashSet<Dictionary<String, uint>> dictKey = new HashSet<Dictionary<string, uint>>();
                    foreach (HashSet<Dictionary<String, Dictionary<String, uint>>> setDict in keyValues)
                    {
                        foreach (Dictionary<String, Dictionary<String, uint>> dict in setDict)
                        {
                            foreach (String str1 in dict.Keys)
                            {
                                if (str.Equals(str1))
                                    dictKey.Add(dict[str1]);
                            }
                        }
                    }
                    actionDisCond.Add(str, dictKey);
                    agentWiseEachActionDisCond.Add(actionDisCond);
                 }
                agentWiseEachActionDisSetCond.Add(c, agentWiseEachActionDisCond);
            }
            return agentWiseEachActionDisSetCond;
        }

        public static Dictionary<Constant, HashSet< HashSet< Dictionary< String, Dictionary< String, uint>>>>> extraxtConditions()
        {
            HashSet<Constant> agetnts = new HashSet<Constant>();            
            foreach (Constant s in prob.Domain.Constants)
            {
                if (s.Type.ToString().Equals("agent"))
                    agetnts.Add(s);                
            }
            return ec1(agetnts);
        }

        public static Dictionary<Constant, HashSet< HashSet< Dictionary< String, Dictionary< String, uint>>>>> ec1(HashSet<Constant> agetnts)
        {
            Dictionary<Constant, HashSet< HashSet< Dictionary< String, Dictionary< String, uint>>>>> agtActCondList =
                new Dictionary<Constant, HashSet<HashSet<Dictionary<String, Dictionary<String, uint>>>>>();
            foreach (Constant agt in agetnts)
            {
                HashSet<HashSet<Dictionary<String, Dictionary<String, uint>>>> actCondList =
                    new HashSet<HashSet<Dictionary<String, Dictionary<String, uint>>>>();
                foreach (String str in branches)
                {
                    HashSet<Dictionary<String, Dictionary<String, uint>>> condList =
                        new HashSet<Dictionary<String, Dictionary<String, uint>>>();
                    String[] branch = str.Split('*');
                    Dictionary<String, Dictionary<String, uint>> locaList = ec2(agetnts, agt, branch);
                    if (locaList.Count > 0)
                    {
                        condList.Add(locaList);
                        actCondList.Add(condList);
                    }
                }
                agtActCondList.Add(agt, actCondList);
            }
            return agtActCondList;
        }

        public static Dictionary<String, Dictionary<String, uint>> ec2(HashSet<Constant> agetnts, Constant agt, String[] branch)
        {
            Dictionary<String,Dictionary<String, uint>> listIndiJointAct = new Dictionary<String, Dictionary<String, uint>>();
            for (uint i = 0; i < branch.Length; i++)     
            {
                // Lift for table mover and push for box-pushing domain
                Dictionary<String, uint> obsAct = new Dictionary<String, uint>();
                bool decision = false;                

                // for table-mover
                if (
                    branch[i].Contains(agt.ToString()) 
                    && 
                    (branch[i].Contains("joint-lift")))
                {
                    decision = true;
                }

                // for box-pushing  
                if (
                    !decision 
                    &&
                    (branch[i].Contains(agt.ToString()) 
                    && 
                    (branch[i].Contains("joint-")
                    ||
                    branch[i].Contains("push"))))
                {
                    decision = true;
                }

                // for heavy-structural-damage
                if (
                    !decision
                    &&
                    branch[i].Contains(agt.ToString()) 
                    && 
                    (branch[i].Contains("joint-")))
                {
                    decision = true;
                }

                if (decision)
                {                    
                    String[] truthStatus = branch[i].Split('_');
                    truthStatus = truthStatus[0].Split(':');
                    uint counter = 0;
                    for (uint j = 0; j < i; j++)
                    {
                        if (branch[j].Contains("observe"))
                        {
                            String[] s = branch[j].Split('_');
                            String[] p = s[0].Split(':');
                            s[0] = p[p.Length - 1];
                            String cond = "observe";
                            for (uint k = 0; k < s.Length; k++)
                            {
                                bool flag = false;
                                foreach (Constant cc in agetnts)
                                {
                                    if (cc.ToString().Equals(s[k]) /*&& !cc.ToString().Equals(agt.ToString())*/)
                                    {
                                        flag = true;
                                        break;
                                    }                                        
                                }
                                if(!flag)
                                    cond = cond + "_" + s[k].ToString();
                            }
                            obsAct.Add(cond, uint.Parse(truthStatus[counter++]));
                        }                                
                    }
                    String[] ss = branch[i].Split(':');
                    String[] s1 = ss[ss.Length - 1].Split('_');
                    String keyName = "";
                    for (uint k = 0; k < s1.Length; k++)
                    {
                        bool flag = false;
                        foreach (Constant cc in agetnts)
                        {
                            if (cc.ToString().Equals(s1[k]) /*&& !cc.ToString().Equals(agt.ToString())*/)
                                flag = true;
                        }
                        if (!flag)
                            keyName = keyName + "_" + s1[k].ToString();
                    }
                    listIndiJointAct.Add(keyName, obsAct);
                }
            }
            return listIndiJointAct;
        }
    }
}

