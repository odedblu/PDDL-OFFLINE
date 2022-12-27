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

        public HashSet<Action> ProblemActions { get; set; }

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
            ProblemActions = new HashSet<Action>();
        }

        public Tuple<State, Action> Search(bool verbose=false)
        {
            BelifeParticles RootBelifeParticles = Root.ParticleFilter;
            State StartState = null;
            Action BestCurrentAction = null;
            Tuple<State, Action> SearchResult;
            if (verbose) Console.WriteLine("Simulating...");
            for (int SimulationIndex = 0; SimulationIndex < SimulationsThreshold; SimulationIndex++)
            {
                if (SimulationIndex % 1000 == 0 && SimulationIndex != 0 && verbose)
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
                    StartState = new State(Problem.GetInitialBelief().ChooseState(true));
                }
                else
                {
                    StartState = RootBelifeParticles.GetRandomState();
                }
                Simulate(Root, 0);
            }
            if (verbose) {
                Console.WriteLine("Done simulations.");
                PrintActionLayer(Root);
            } 
            BestCurrentAction = FinalActionSelectPolicy.SelectBestAction(Root, StartState);
            SearchResult = new Tuple<State, Action>(StartState, BestCurrentAction);
            return SearchResult;
        }

        public double Simulate(PomcpNode CurrentRoot, int currentDepth)
        {
            PartiallySpecifiedState RootPartialyState = (CurrentRoot as ObservationPomcpNode).PartiallySpecifiedState;
            State SampleStateFromBelife = RootPartialyState.m_bsInitialBelief.ChooseState(true);
            if ((Math.Pow(DiscountFactor, (double)currentDepth) < DepthThreshold || DiscountFactor == 0) && currentDepth != 0)
            {
                return 0;
            }

            if(RootPartialyState.AvailableActions is null || RootPartialyState.AvailableActions.Count == 0) RootPartialyState.GroundAllActions();
            foreach(Action action in RootPartialyState.AvailableActions)
            {
                if (((ObservationPomcpNode)CurrentRoot).PartiallySpecifiedState.IsApplicable(action))
                {
                    ActionPomcpNode actionPomcpNode = new ActionPomcpNode((ObservationPomcpNode)CurrentRoot, action);
                    ((ObservationPomcpNode)CurrentRoot).AddActionPomcpNode(actionPomcpNode);
                }
            }
            if (CurrentRoot.IsLeaf())
            { 
                CurrentRoot.VisitedCount++;
                SampleStateFromBelife.GroundAllActions();
                return Rollout(SampleStateFromBelife, currentDepth);
            }
           

            double CummulativeReward = 0;
            State currentObservedState = RootPartialyState.GetCurrentState();
            currentObservedState.GroundAllActions();
            Action NextAction = ActionSelectPolicy.SelectBestAction(CurrentRoot, currentObservedState);
            ActionPomcpNode NextActionPomcpNode = (ActionPomcpNode)(CurrentRoot.Childs[NextAction.GetHashCode()]);

            // Execute Action on state.   
            ObservationPomcpNode currentObservationRoot = CurrentRoot as ObservationPomcpNode;
            Formula observation = null;
            PartiallySpecifiedState NextState = currentObservationRoot.PartiallySpecifiedState.Apply(NextAction, out observation);
            double Reward = GetReward(NextState.UnderlyingEnvironmentState);
            // Handle actions without observation.
            List<Predicate> PredicatsObservation = new List<Predicate>();
            if(observation != null)
            {
                PredicatsObservation = observation.GetAllPredicates().ToList();
            }
            ObservationPomcpNode NextObservationPomcpNode = NextActionPomcpNode.AddObservationChilds(PredicatsObservation, NextState);
            if(NextState != null)
            {
                CummulativeReward += Reward + DiscountFactor * Simulate(NextObservationPomcpNode, currentDepth + 1);
            }
            else
            {
                CummulativeReward += Reward;
            }
            

            // Back propagate.
            if(CurrentRoot.Parent != null) currentObservationRoot.ParticleFilter.AddState(NextState.GetCurrentState());
            CurrentRoot.VisitedCount++;
            NextActionPomcpNode.VisitedCount++;
            NextActionPomcpNode.Value += (CummulativeReward - NextActionPomcpNode.Value) / NextActionPomcpNode.VisitedCount++;
            return CummulativeReward;
        }

        public double Rollout(State state, int currentDepth)
        {
            if((Math.Pow(DiscountFactor, (double)currentDepth) < DepthThreshold || DiscountFactor == 0) && currentDepth != 0)
            {
                return 0;
            }
            Action RolloutAction = RolloutPolicy.ChooseAction(state);
            State NextState = state.Apply(RolloutAction);
            double Reward = GetReward(NextState);
            return Reward + DiscountFactor * Rollout(NextState, currentDepth + 1);
        }

        private double GetReward(State state)
        {
            //if (state == null) return Double.MinValue;
            if (state != null && Problem.IsGoalState(state))
            {
                return 10.0;
            }
            else
            {
                if (state == null) return -100.0;
            }
            return -1.0;
        }
       
        public List<Action> FindPlan(bool verbose=false)
        {
            List<Action> Plan = new List<Action>();
            // State CurrentState = Problem.GetInitialBelief().ChooseState(true);
            PartiallySpecifiedState CurrentState = Root.PartiallySpecifiedState;
            if(verbose) Console.WriteLine(string.Join(",", CurrentState.Observed.Where(predicate => !predicate.Negation)));
            CurrentState.GroundAllActions();
            while (!CurrentState.IsGoalState())
            {
                Search(verbose);
                Action bestValidAction = null;
                double bestScore = Double.MinValue;
                ActionPomcpNode bestActionNode = null;
                foreach (PomcpNode pn in Root.Childs.Values)
                {

                    ActionPomcpNode actionNode = pn as ActionPomcpNode;
                    
                    if (actionNode.Value > bestScore && CurrentState.AvailableActions.Contains(actionNode.Action))
                    {
                        bestValidAction = actionNode.Action;
                        bestScore = actionNode.Value;
                        bestActionNode = actionNode;
                    }

                }
                Formula observation;
                CurrentState = CurrentState.Apply(bestValidAction, out observation);
                List<Predicate> PredicatsObservation = new List<Predicate>();
                if (observation != null)
                {
                    PredicatsObservation = observation.GetAllPredicates().ToList();
                }
                
                CurrentState.GroundAllActions();
                Plan.Add(bestValidAction);
                if (verbose) 
                {
                    Console.WriteLine($"Selected action: {bestValidAction.Name}");
                    Console.WriteLine($"New Underline state is: {string.Join(",", CurrentState.UnderlyingEnvironmentState.Predicates.Where(predicate => !predicate.Negation))}");
                    Console.WriteLine($"New state is: {string.Join(",", CurrentState.Observed.Where(predicate => !predicate.Negation))}");
                }

                ObservationPomcpNode NextObservationPomcpNode = bestActionNode.Childs[bestActionNode.GetObservationsHash(PredicatsObservation)] as ObservationPomcpNode;
                Root = NextObservationPomcpNode;
            }

            return Plan;
        }


        private void PrintActionLayer(PomcpNode RootNode)
        {
            foreach(PomcpNode child in Root.Childs.Values)
            {
                ActionPomcpNode actionChild = child as ActionPomcpNode;
                Console.WriteLine($"Action: {actionChild.Action.Name}, Value: {actionChild.Value}, Visits: {actionChild.VisitedCount}.");
            }
        }
    }
}
