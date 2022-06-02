using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace CPOR_MA
{
    public class Disjunctionsolver
    {
        private static HashSet<Dictionary<String, uint>> condValConj = null;
        private static List<String> booleanformulaString = null;
        private static HashSet<String> variables = null;

        public static List<Constant> interestingConstants = null;
        public static void CompilationToSingleAgent(Constant agt, Problem problem)
        {            
            interestingConstants = new List<Constant>();
            foreach (Constant cons in problem.Domain.Constants)
            {
                // for box pushing case - box and table mover case table
                if (cons.Type.ToString().Equals("table"))
                {
                    interestingConstants.Add(cons);
                }
            }
        }

        public Disjunctionsolver(HashSet<Dictionary<String, uint>> condValConjunct, Constant agt, Problem problem)
        {
            CompilationToSingleAgent(agt, problem);
            condValConj = new HashSet<Dictionary<string, uint>>();
            booleanformulaString = new List<String>();
            List<String> localBooleanformulaString = new List<string>();
            Disjunctionsolver.condValConj = condValConjunct;
            booleanformulaString.Add("import boolean");
            booleanformulaString.Add("algebra = boolean.BooleanAlgebra()");
            variables = new HashSet<string>();
            foreach (Dictionary<string, uint> dictCond in condValConj)
            {
                String clause = "("; uint ii = 0;
                foreach (String key in dictCond.Keys)
                {
                    String[] local = key.Split('-'); String loc = "";
                    foreach (String st in local)
                    {
                        loc = loc + st;
                    }
                    variables.Add(loc);                     
                    if (dictCond[key] == 0)
                        clause = clause + "~" + loc;
                    else
                        clause = clause + "" + loc;    
                    if(dictCond.Count > ++ii)
                        clause = clause + " & ";
                }
                clause = clause + " )";
                localBooleanformulaString.Add(clause);
            }

            // make "x, y, z = algebra.symbols('x', 'y', 'z')",
            variables.Add("dummy"); // dummy is added so that boolean solver cannot throw error?
            String str = ""; String str1 = ""; uint count = 0;
            foreach (String var in variables)
            {
                if (variables.Count > ++count)
                {
                    str = str + var + ", ";
                    str1 = str1 + "'" + var + "'" + ", ";
                }
                else
                {
                    str = str + var + " = algebra.symbols(";
                    str1 = str1 + "'" + var + "'" + ")";
                }
            }
            str = str + str1;
            booleanformulaString.Add(str);
            String localStr = "print("; uint iii = 0;
            foreach(String p in localBooleanformulaString)
            {
                if (localBooleanformulaString.Count > ++iii)
                {
                    localStr = localStr + p + " | ";
                } 
                else
                {
                    localStr = localStr + p;
                }
            }
            localStr = localStr + ").simplify()";
            booleanformulaString.Add(localStr);            
        }

        public static String simplify()
        {
            // for now no need to perform conjuction if there is only one variable   
            string fileName = @"C:\Users\shekhar\Dropbox\bgu-phd\boolean-master\boolean-master\file1.py";
            System.IO.File.WriteAllLines(fileName, booleanformulaString);            

            System.Diagnostics.Process p = new System.Diagnostics.Process();
            p.StartInfo = new ProcessStartInfo(@"C:\Python27\python.exe", fileName)
            {
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true
            };
            p.Start();
            string output = p.StandardOutput.ReadToEnd();
            p.WaitForExit();

            // Console.WriteLine("\n disj cond: " + output);            
            /*
             * Dummy Simple Boolean expression
            string[] lines = {
                "import boolean",
                "algebra = boolean.BooleanAlgebra()",
                /*Changes will occur here* /
                "x, y, z = algebra.symbols('x', 'y', 'z')",
                "print((x & y & z) | (x & ~y & z) | (~x&~y&z) | (~x&~y&z)).simplify()"
            };

            // write that into a file
            System.IO.File.WriteAllLines(@"C:\Users\shekhar\Dropbox\bgu-phd\boolean-master\boolean-master\file1.py", lines);

            //simplify the expression
            string fileName = @"C:\Users\shekhar\Dropbox\bgu-phd\boolean-master\boolean-master\file1.py";
            System.Diagnostics.Process p = new System.Diagnostics.Process();
            p.StartInfo = new ProcessStartInfo(@"C:\Python27\python.exe", fileName)
            {
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true
            };
            p.Start();

            string output = p.StandardOutput.ReadToEnd();
            p.WaitForExit();
            Console.WriteLine("\n" + output);
            Console.ReadLine(); */

            return output;
        }
    }
}

