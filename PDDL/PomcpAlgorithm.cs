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

        public Tuple<PartiallySpecifiedState,Action> Search()
        {
            BelifeParticles RootBelifeParticles = Root.ParticleFilter;
            PartiallySpecifiedState StartState = null;
            Action BestCurrentAction = null;
            Tuple<PartiallySpecifiedState, Action> SearchResult;
            for (int SimulationIndex = 0; SimulationIndex < SimulationsThreshold; SimulationIndex++)
            {
                /*
                foreach (KeyValuePair<int, PomcpNode> ActionChilds in Root.Childs)
                {
                    ActionPomcpNode actionPomcpNode = (ActionPomcpNode)ActionChilds.Value;
                    if(StartState != null && actionPomcpNode.Value > 0)
                    {
                        BestCurrentAction = FinalActionSelectPolicy.SelectBestAction(Root);
                        return SearchResult = new Tuple<PartiallySpecifiedState, Action>(StartState, BestCurrentAction);
                    }
                }
                */
                if (SimulationIndex % 1000 == 0 && SimulationIndex != 0)
                {
                    Console.WriteLine(SimulationIndex);
                    /*foreach (KeyValuePair<int, PomcpNode>  ActionChilds in Root.Childs)
                    {
                        ActionPomcpNode actionPomcpNode = (ActionPomcpNode)ActionChilds.Value;
                        Console.WriteLine(actionPomcpNode.Action);
                        Console.WriteLine(Math.Round(actionPomcpNode.Value, 2));
                        Console.WriteLine("------------------");
                    }*/
                }
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
            BestCurrentAction = FinalActionSelectPolicy.SelectBestAction(Root);
            SearchResult = new Tuple<PartiallySpecifiedState, Action>(StartState, BestCurrentAction);
            return SearchResult;
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
                    if (state.IsApplicable(action))
                    {
                        ActionPomcpNode actionPomcpNode = new ActionPomcpNode((ObservationPomcpNode)CurrentRoot, action);
                        ((ObservationPomcpNode)CurrentRoot).AddActionPomcpNode(actionPomcpNode);
                    }
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
            if(NextState != null)
            {
                CummulativeReward += Reward + DiscountFactor * Simulate(NextState, NextObservationPomcpNode, currentDepth + 1);
            }
            else
            {
                CummulativeReward += Reward;
            }
            

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
            Action RolloutAction = RolloutPolicy.ChooseAction(state);
            PartiallySpecifiedState NextState = state.Apply(RolloutAction, out Formula observation);
            double Reward = GetReward(NextState);
            return Reward + DiscountFactor * Rollout(NextState, currentDepth + 1);
        }

        private double GetReward(PartiallySpecifiedState state)
        {
            if (state == null) return Double.MinValue;
            if (state.IsGoalState())
            {
                return 100.0;
            }
            return -1.0;
        }

        public List<Action> FindPlan()
        {
            List<Action> Plan = new List<Action>();
            PartiallySpecifiedState CurrentState = null;
            while (CurrentState == null || !CurrentState.IsGoalState())
            {
                Tuple<PartiallySpecifiedState, Action> SearchResult = Search();
                CurrentState = SearchResult.Item1;  
                Action NextAction = SearchResult.Item2;
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
