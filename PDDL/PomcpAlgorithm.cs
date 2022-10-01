using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class PomcpAlgorithm
    {
        public double DiscountFactor { get; set; }
        public double UCBExplorationFactor { get; set; }   
        public double DepthThreshold { get; set; }
        public int SimulationsThreshold { get; set; }
        public Problem Problem { get; set; }
        public ObservationPomcpNode Root { get; set; }
        public IActionSelectPolicy ActionSelectPolicy { get; set; }
        public IRolloutPolicy RolloutPolicy { get; set; }  

        public PomcpAlgorithm(double discountFactor, double uCBExplorationFactor, double depthThreshold, 
                              int simulationsThreshold, Problem problem, ObservationPomcpNode root,
                              IActionSelectPolicy actionSelectPolicy, IRolloutPolicy rolloutPolicy)
        {
            DiscountFactor = discountFactor;
            UCBExplorationFactor = uCBExplorationFactor;
            DepthThreshold = depthThreshold;
            SimulationsThreshold = simulationsThreshold;
            Problem = problem;
            Root = root;
            ActionSelectPolicy = actionSelectPolicy;
            RolloutPolicy = rolloutPolicy;
        }

        public Action Search()
        {
            throw new NotImplementedException();
        }

        public void Simulate(PartiallySpecifiedState state, PomcpNode CurrentRoot, int currentDepth)
        {
            throw new NotImplementedException();
        }

        public double Rollout(PartiallySpecifiedState state, int currentDepth)
        {
            if((Math.Pow(DiscountFactor, (double)currentDepth) < DepthThreshold || DiscountFactor == 0) && currentDepth != 0)
            {
                return 0;
            }
            double CummulativeReward = 0;
            Action RolloutAction = RolloutPolicy.ChooseAction(state);
            PartiallySpecifiedState NextState = state.Apply(RolloutAction, out Formula observation);
            double Reward = GetReward(NextState);
            CummulativeReward += Reward + DiscountFactor * Rollout(NextState, currentDepth + 1);
            return CummulativeReward;
        }

        private double GetReward(PartiallySpecifiedState state)
        {
            if (state.IsGoalState())
            {
                return 100.0;
            }
            return -1.0;
        }
    }
}
