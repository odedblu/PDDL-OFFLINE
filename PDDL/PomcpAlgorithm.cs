using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
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

        public void Search(bool verbose=false)
        {
            if (verbose) Console.WriteLine("Simulating...");
            for (int SimulationIndex = 0; SimulationIndex < SimulationsThreshold; SimulationIndex++)
            {
                if (verbose && SimulationIndex % 100 == 0)
                {
                    int progress = (int)((double)SimulationIndex / SimulationsThreshold * 100);
                    PrintProgressBar(progress);
                }
                Simulate(Root);
            }
            if (verbose) {
                Console.WriteLine("Done simulations.");
                PrintActionLayer(Root);
            } 
        }

        

        public void Simulate(ObservationPomcpNode Node)
        {
            // Init 
            int CurrentDepth = 0;
            State SampledState;
            // Check if node is the start root.
            if (Node.ParticleFilter.Size() == 0)
            {
                SampledState = Node.PartiallySpecifiedState.m_bsInitialBelief.ChooseState(true);
            }
            else
            {
                // Sample a fully observable state from the pomcp node's particle filter.
                SampledState = Node.ParticleFilter.GetRandomState();
            }
            SampledState.GroundAllActions();
            // Running through the tree, until getting to a leaf pomcp node.
            ObservationPomcpNode Current = Node;
            State CurrentState = SampledState;
            while (!Current.IsLeaf())
            {
                // Select next action to preform inside the tree.
                Action NextAction = ActionSelectPolicy.SelectBestAction(Current, CurrentState);


                // Get the observation's predicates of this action.
                Formula observation = null;
                if (NextAction.Observe != null && NextAction.Observe.IsTrue(CurrentState.Predicates))
                {
                    observation = NextAction.Observe;
                }
                else if(NextAction.Observe != null)
                {
                    observation = NextAction.Observe.Negate();
                }
                List<Predicate> PredicatsObservation = new List<Predicate>();
                if (observation != null)
                {
                    PredicatsObservation = observation.GetAllPredicates().ToList();
                }

                // Get Next pomcp observation node inside the tree.
                Current = GetNextObservationNode(Current,NextAction,PredicatsObservation);
                CurrentDepth += 1;

                // Apply action on CurrentState.
                CurrentState = CurrentState.Apply(NextAction);
                CurrentState.GroundAllActions();

                // Add the next state to the Observation pomcp node's particle filter.
                Current.ParticleFilter.AddState(CurrentState);
            }

            // Expand node.
            ExpandNode(Current);

            // Finished run inside the tree, now do rollout.
            double Reward = Rollout(CurrentState, CurrentDepth);
            double CummulativeReward = Reward;

            // Start back propogation phase.
            while (Current != Node)
            {
                // Increase the action pomcp node's visited count.
                Current.Parent.VisitedCount++;
                // Increase the observation pomcp node's visited count.
                Current.VisitedCount++; 
                Current.Parent.Value += (CummulativeReward - Current.Parent.Value) / Current.Parent.VisitedCount;

                // Set the currents to their predicessors.
                Current = Current.Parent.Parent as ObservationPomcpNode; // Set the current to be the previous observation pomcp node.
                CurrentState = CurrentState.m_sPredecessor;
                CummulativeReward = GetReward(CurrentState) + DiscountFactor * CummulativeReward;
            }
            Current.VisitedCount++;
        }

        // Get the next observation pomcp node by action and observation.
        private ObservationPomcpNode GetNextObservationNode(ObservationPomcpNode Node, Action a, List<Predicate> ObservedPredicates)
        {
            ActionPomcpNode NextActionNode = Node.Childs[a.GetHashCode()] as ActionPomcpNode;
            ObservationPomcpNode NextObservationNode = NextActionNode.Childs[ActionPomcpNode.GetObservationsHash(ObservedPredicates)] as ObservationPomcpNode;
            return NextObservationNode;
        }

        private void ExpandNode(ObservationPomcpNode Node)
        {
            Node.VisitedCount++;
            PartiallySpecifiedState NodePartialyState = Node.PartiallySpecifiedState;
            if (NodePartialyState.AvailableActions.Count == 0) NodePartialyState.GroundAllActions();
            foreach (Action action in NodePartialyState.AvailableActions)
            {
                if (NodePartialyState.IsApplicable(action))
                {
                    // Create the action node.
                    ActionPomcpNode actionPomcpNode = new ActionPomcpNode(Node, action);

                    // Add the action node to the Node childs.
                    Node.AddActionPomcpNode(actionPomcpNode);

                    Formula observation;
                    if (action.Observe != null)
                    {
                        // Create all observation nodes for this action node.
                        PartiallySpecifiedState bsNew = new PartiallySpecifiedState(Node.PartiallySpecifiedState, action);
                        PartiallySpecifiedState TrueChild = bsNew.Clone();
                        PartiallySpecifiedState FalseChild = bsNew.Clone();
                        TrueChild.GeneratingObservation = action.Observe;
                        FalseChild.GeneratingObservation = action.Observe.Negate();
                        TrueChild.AddObserved(action.Observe);
                        FalseChild.AddObserved(action.Observe.Negate());
                        // Add the observations nodes to action pomcp node's childs.
                        actionPomcpNode.AddObservationChilds(TrueChild.GeneratingObservation.GetAllPredicates().ToList(), TrueChild);
                        actionPomcpNode.AddObservationChilds(FalseChild.GeneratingObservation.GetAllPredicates().ToList(), FalseChild);
                    }
                    else
                    {
                        List<Predicate> PredicatsObservation = new List<Predicate>();
                        PartiallySpecifiedState NextState = Node.PartiallySpecifiedState.Apply(action, out observation);
                        actionPomcpNode.AddObservationChilds(PredicatsObservation, NextState);
                    }

                }
            }
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
            if (Reward > 0) return Reward;
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
            PartiallySpecifiedState CurrentState = Root.PartiallySpecifiedState.Clone();
            Console.WriteLine(CurrentState.UnderlyingEnvironmentState);
            if(verbose) Console.WriteLine(string.Join(",", CurrentState.Observed.Where(predicate => !predicate.Negation)));
            CurrentState.GroundAllActions();
            //while (!CurrentState.IsGoalState())
            while (!Problem.IsGoalState(CurrentState.UnderlyingEnvironmentState))
            {
                Search(verbose);
                Action bestValidAction = null;
                double bestScore = Double.MinValue;
                ActionPomcpNode bestActionNode = null;
                foreach (PomcpNode pn in Root.Childs.Values)
                {

                    ActionPomcpNode actionNode = pn as ActionPomcpNode;
                    
                    if (actionNode.Value > bestScore)
                    {
                        bestValidAction = actionNode.Action;
                        bestScore = actionNode.Value;
                        bestActionNode = actionNode;
                    }

                }
                Formula observation = null;
                if (bestValidAction.Observe != null && bestValidAction.Observe.IsTrue(CurrentState.UnderlyingEnvironmentState.Predicates))
                {
                    observation = bestValidAction.Observe;
                }
                else if (bestValidAction.Observe != null)
                {
                    observation = bestValidAction.Observe.Negate();
                }
                List<Predicate> PredicatsObservation = new List<Predicate>();
                if (observation != null)
                {
                    PredicatsObservation = observation.GetAllPredicates().ToList();
                }

                Plan.Add(bestValidAction);
                Formula UnusedObservation;
                CurrentState = CurrentState.Apply(bestValidAction, out UnusedObservation);
                CurrentState.GroundAllActions();

                ObservationPomcpNode NextObservationPomcpNode = GetNextObservationNode(Root, bestValidAction, PredicatsObservation);
                UnrelevantPomcpNodeDestructor(Root, bestValidAction, PredicatsObservation); // Remove all action childs that not relevant.
                Root = NextObservationPomcpNode;
                Root.PartiallySpecifiedState = CurrentState.Clone();

                if (verbose)
                {
                    Console.WriteLine($"Selected action: {bestValidAction.Name}");
                    Console.WriteLine($"New Underline state is: {string.Join(",", CurrentState.UnderlyingEnvironmentState.Predicates.Where(predicate => !predicate.Negation))}");
                    Console.WriteLine($"New state is: {string.Join(",", CurrentState.Observed.Where(predicate => !predicate.Negation))}");
                }
            }

            return Plan;
        }

        private void UnrelevantPomcpNodeDestructor(ObservationPomcpNode Node, Action bestValidAction, List<Predicate> PredicatsObservation)
        {
            List<int> toRemoveChilds = new List<int>();
            foreach(KeyValuePair<int, PomcpNode> kvp in Node.Childs)
            {
                if(kvp.Key != bestValidAction.GetHashCode())
                {
                    toRemoveChilds.Add(kvp.Key);
                }
            }
            foreach(int key in toRemoveChilds)
            {
                Node.Childs.Remove(key);
            }
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
        private void PrintActionLayer(PomcpNode RootNode)
        {
            foreach(PomcpNode child in Root.Childs.Values)
            {
                ActionPomcpNode actionChild = child as ActionPomcpNode;
                Console.WriteLine($"Action: {actionChild.Action.Name}, Value: {actionChild.Value}, Visits: {actionChild.VisitedCount}.");
            }
        }

        private static void PrintProgressBar(int progress)
        {
            Console.Write("\r[");
            for (int j = 0; j < 50; j++)
            {
                if (j < progress / 2)
                {
                    Console.Write("=");
                }
                else
                {
                    Console.Write(" ");
                }
            }
            Console.Write("] {0}%", progress);
        }
    }
}
