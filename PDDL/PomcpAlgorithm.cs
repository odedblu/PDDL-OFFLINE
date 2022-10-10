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
        public IActionSelectPolicy FinalActionSelectPolicy { get; set; }
        public IRolloutPolicy RolloutPolicy { get; set; }  

        public PomcpAlgorithm(double discountFactor, double depthThreshold, 
                              int simulationsThreshold, Problem problem, ObservationPomcpNode root, 
                              IActionSelectPolicy finalActionSelectPolicy, IActionSelectPolicy actionSelectPolicy, IRolloutPolicy rolloutPolicy)
        {
            DiscountFactor = discountFactor;
            DepthThreshold = depthThreshold;
            SimulationsThreshold = simulationsThreshold;
            Problem = problem;
            Root = root;
            ActionSelectPolicy = actionSelectPolicy;
            FinalActionSelectPolicy = finalActionSelectPolicy;
            RolloutPolicy = rolloutPolicy;
        }

        public Action Search()
        {
            BelifeParticles RootBelifeParticles = Root.ParticleFilter;
            PartiallySpecifiedState StartState;
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
            Action BestCurrentAction = FinalActionSelectPolicy.SelectBestAction(Root);
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
            // Handle actions without observation.
            List<Predicate> PredicatsObservation = new List<Predicate>();
            if(observation != null)
            {
                PredicatsObservation = observation.GetAllPredicates().ToList();
            }
            ObservationPomcpNode NextObservationPomcpNode = NextActionPomcpNode.AddObservationChilds(PredicatsObservation);
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

        public List<Action> FindPlan(PartiallySpecifiedState StartState)
        {
            List<Action> Plan = new List<Action>();
            PartiallySpecifiedState CurrentState = StartState.Clone();
            while (!CurrentState.IsGoalState())
            {
                Action NextAction = Search();
                CurrentState = CurrentState.Apply(NextAction, out Formula observation);
                Plan.Add(NextAction);
                List<Predicate> PredicatsObservation = new List<Predicate>();
                if (observation != null)
                {
                    PredicatsObservation = observation.GetAllPredicates().ToList();
                }
                PomcpNode NextActionPomcpNode = Root.Childs[NextAction.GetHashCode()];
                PomcpNode NewObservationPomcpNode = NextActionPomcpNode.Childs[((ActionPomcpNode)NextActionPomcpNode).GetObservationsHash(PredicatsObservation)];
                Root = (ObservationPomcpNode)NewObservationPomcpNode;
            }
            return Plan;
        }
    }
}
