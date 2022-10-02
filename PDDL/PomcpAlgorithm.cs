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
        public double DepthThreshold { get; set; }
        public int SimulationsThreshold { get; set; }
        public Problem Problem { get; set; }
        public ObservationPomcpNode Root { get; set; }
        public IActionSelectPolicy ActionSelectPolicy { get; set; }
        public IRolloutPolicy RolloutPolicy { get; set; }  

        public PomcpAlgorithm(double discountFactor, double depthThreshold, 
                              int simulationsThreshold, Problem problem, ObservationPomcpNode root,
                              IActionSelectPolicy actionSelectPolicy, IRolloutPolicy rolloutPolicy)
        {
            DiscountFactor = discountFactor;
            DepthThreshold = depthThreshold;
            SimulationsThreshold = simulationsThreshold;
            Problem = problem;
            Root = root;
            ActionSelectPolicy = actionSelectPolicy;
            RolloutPolicy = rolloutPolicy;
        }

        public Action Search()
        {
            PartiallySpecifiedState StartState;
            BelifeParticles RootBelifeParticles = Root.ParticleFilter;
            for(int SimulationIndex = 0; SimulationIndex < SimulationsThreshold; SimulationIndex++)
            {
                if (RootBelifeParticles.Size() == 0)
                {
                    StartState = new PartiallySpecifiedState(Problem.GetInitialBelief());
                }
                else
                {
                    StartState = RootBelifeParticles.GetRandomState();
                }
                Simulate(StartState, Root, 0);
            }
            Action BestCurrentAction = ActionSelectPolicy.SelectBestAction(Root);
            return BestCurrentAction;
        }

        public double Simulate(PartiallySpecifiedState state, PomcpNode CurrentRoot, int currentDepth)
        {
            if ((Math.Pow(DiscountFactor, (double)currentDepth) < DepthThreshold || DiscountFactor == 0) && currentDepth != 0)
            {
                return 0;
            }

            if (CurrentRoot.IsLeaf())
            {
                state.GroundAllActions();
                foreach(Action action in state.AvailableActions)
                {
                    ActionPomcpNode actionPomcpNode = new ActionPomcpNode((ObservationPomcpNode)CurrentRoot, action);
                    ((ObservationPomcpNode)CurrentRoot).AddActionPomcpNode(actionPomcpNode);
                }
                CurrentRoot.VisitedCount++;
                return Rollout(state, currentDepth);
            }

            double CummulativeReward = 0;
            Action NextAction = ActionSelectPolicy.SelectBestAction(CurrentRoot);
            ActionPomcpNode NextActionPomcpNode = (ActionPomcpNode)(CurrentRoot.Childs[NextAction.GetHashCode()]);

            // Execute Action on state.
            PartiallySpecifiedState NextState = state.Apply(NextAction, out Formula observation);
            double Reward = GetReward(NextState);
            ObservationPomcpNode NextObservationPomcpNode = new ObservationPomcpNode(NextActionPomcpNode, observation.GetAllPredicates().ToList());
            CummulativeReward += Reward + DiscountFactor * Simulate(NextState, NextObservationPomcpNode, currentDepth + 1);

            // Back propagate.
            ((ObservationPomcpNode)CurrentRoot).ParticleFilter.AddState(state);
            CurrentRoot.VisitedCount++;
            NextActionPomcpNode.VisitedCount++;
            NextActionPomcpNode.Value += (CummulativeReward - NextActionPomcpNode.Value) / NextActionPomcpNode.VisitedCount++;
            return CummulativeReward;
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
