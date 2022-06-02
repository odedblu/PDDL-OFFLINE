using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace ContingentToFOND
{
    class Program
    {
        public static string BASE_PATH = ".";

        static void Main(string[] args)
        {
            if (args.Length < 4)
            {
                Console.WriteLine("Usage: ContingentToFOND <in-domain-file> <in-problem-file> <out-domain-file> <out-problem-file>");
                return;
            }
            string sInDomainFile = args[0];
            string sInProblemFile = args[1];
            string sOutDomainFile = args[2];
            string sOutProblemFile = args[3];
           
            /*
            string sInDomainFile = @"D:\Dropbox\SDR\Offline\CLG_benchmarks\doors5\d.pddl";
            string sInProblemFile = @"D:\Dropbox\SDR\Offline\CLG_benchmarks\doors5\p.pddl";
            string sOutDomainFile = @"D:\Dropbox\SDR\Offline\CLG_benchmarks\doors5\Kd.pddl";
            string sOutProblemFile = @"D:\Dropbox\SDR\Offline\CLG_benchmarks\doors5\Kp.pddl";
 */


            Parser parser = new Parser();

            Console.WriteLine("Reading domain file");
            Domain d = parser.ParseDomain(sInDomainFile);
            Console.WriteLine("Reading problem file");
            Problem p = parser.ParseProblem(sInProblemFile, d);

            foreach(Action a in d.Actions)
            {
                if(a.ContainsNonDeterministicEffect)
                {
                    Console.Write("Supporting only simple domains. Action " + a.Name + " contains non deterministic effects.");
                    return;
                }
                if(a.HasConditionalEffects)
                {
                    foreach(CompoundFormula cfWhen in a.GetConditions())
                    {
                        HashSet<Predicate> lCondition = cfWhen.Operands[0].GetAllPredicates();
                        foreach(Predicate pred in lCondition)
                        {
                            if(!d.AlwaysKnown(pred))
                            {
                                Console.Write("Supporting only simple domains. Action " + a.Name + " contains conditional effects over unknown facts.");
                                return;
                            }
                        }
                    }
                }
            }


            foreach(CompoundFormula cf in p.Hidden)
            {
                if(!cf.IsSimpleFormula())
                {
                    Console.Write("Supporting only simple formulas in the initial state: " + cf.ToString());
                    return;
                }
            }

            Console.WriteLine("Writing translated files");
            d.WriteKnowledgeDomain(p, sOutDomainFile);
            p.WriteKnowledgeProblem(sOutProblemFile);

        }


    }
}

