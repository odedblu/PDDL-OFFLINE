using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class Evaluation
    {
        
        public string WorldsBasePath { get; set; }        
        public Domain domain { get; set; }
        public Problem problem { get; set; }
        public PomcpAlgorithm PomcpAlgorithm { get; set; }


        public Evaluation(string worldsBasePath)
        {
            WorldsBasePath = worldsBasePath;

        }
        
        public void SetWorld(string worldName)
        {
            Parser domainParser = new Parser();
            domain = domainParser.ParseDomain(String.Format(@"{0}\{1}\d.pddl", WorldsBasePath, worldName));
            problem = domainParser.ParseProblem(String.Format(@"{0}\{1}\p.pddl", WorldsBasePath, worldName), domain);
        }

        public void SetAlgorithmParameters(double DiscountFactor, double DepthThreshold, int Simulations, IActionSelectPolicy actionSelectPolicy, IActionSelectPolicy FinalActionSelectPolicy, IRolloutPolicy rolloutPolicy)
        {
            ObservationPomcpNode root = new ObservationPomcpNode(new PartiallySpecifiedState(problem.GetInitialBelief()));
            PomcpAlgorithm = new PomcpAlgorithm(DiscountFactor, DepthThreshold, Simulations, problem, root, FinalActionSelectPolicy, actionSelectPolicy, rolloutPolicy, RewardFunctions.GeneralReward);
        }

        public void ResetRoot()
        {
            ObservationPomcpNode root = new ObservationPomcpNode(new PartiallySpecifiedState(problem.GetInitialBelief()));
            PomcpAlgorithm.Root = root;
        }

        public List<Dictionary<string, double>> RunExperiment(int NumberOfRuns)
        {
            List<Dictionary<string, double>> results = new List<Dictionary<string, double>>();

            for(int i = 0; i < NumberOfRuns; i++)
            {
                ResetRoot();
                var watch = System.Diagnostics.Stopwatch.StartNew();
                List<Action> plan = PomcpAlgorithm.FindPlan();
                watch.Stop();

                Dictionary<string, double> RunResult = new Dictionary<string, double>
                {
                    {"time", watch.ElapsedMilliseconds},
                    {"total steps took", plan.Count}
                };

                results.Add(RunResult);

            }

            return results;
        }
    }
}
