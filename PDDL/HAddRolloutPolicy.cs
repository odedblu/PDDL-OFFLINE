using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class HAddRolloutPolicy : IRolloutPolicy
    {
        public Action ChooseAction(State s)
        {
            Dictionary<Action, int> ActionsScores = new Dictionary<Action, int>();
            HashSet<Predicate> GoalPredicates = s.Problem.Goal.GetAllPredicates();
            
            s.GroundAllActions();
            foreach(Action action in s.AvailableActions)
            {
                HashSet<Predicate> StatePredicates = new HashSet<Predicate>(s.Predicates);
                if(action.Effects != null) StatePredicates.UnionWith(action.Effects.GetAllPredicates());
                Dictionary<Predicate, int> ActionPredicatesScores = GetGoalPredicatesHaddLevel(GoalPredicates, StatePredicates, s.Problem.Domain);
                int hAddSum;
                try
                {
                    hAddSum = ActionPredicatesScores.Sum(x => x.Value);
                }
                catch (OverflowException ex)
                {
                    hAddSum = int.MaxValue;
                }
                
                ActionsScores.Add(action, hAddSum);
            }

            Action BestAction = null;
            int BestActionScore = int.MaxValue;
            foreach(KeyValuePair<Action,int> kvp in ActionsScores)
            {
                if(kvp.Value < BestActionScore)
                {
                    BestAction = kvp.Key;
                    BestActionScore = kvp.Value;
                }
            }
            if(BestAction == null)
            {
                Random rnd = new Random();
                int selectedIndex = rnd.Next(ActionsScores.Count());
                BestAction = ActionsScores.ElementAt(selectedIndex).Key;
            }
            return BestAction;
        }

        private Dictionary<Predicate,int> GetGoalPredicatesHaddLevel(HashSet<Predicate> GoalPredicates, HashSet<Predicate> StartPredicates, Domain domain)
        {
            Dictionary<Predicate,int> GoalPredicatesHadd = new Dictionary<Predicate,int>();
            List<Action> actions = domain.GroundAllActions(StartPredicates, true);
            int currentLevel = 0;
            foreach (Predicate goalPredicate in GoalPredicates)
            {
                if (StartPredicates.Contains(goalPredicate)) GoalPredicatesHadd.Add(goalPredicate, currentLevel);
            }
            HashSet<Predicate> nextLayerPredicats = GetNextLevelHaddPredicates(StartPredicates, actions);
            while (GoalPredicatesHadd.Count() != GoalPredicates.Count() && nextLayerPredicats.Count() != StartPredicates.Count())
            {
                foreach (Predicate goalPredicate in GoalPredicates)
                {
                    if (GoalPredicatesHadd.ContainsKey(goalPredicate)) continue;
                    if (nextLayerPredicats.Contains(goalPredicate)) GoalPredicatesHadd.Add(goalPredicate, currentLevel + 1);
                }
                StartPredicates = nextLayerPredicats;
                actions = domain.GroundAllActions(StartPredicates, true);
                nextLayerPredicats = GetNextLevelHaddPredicates(StartPredicates, actions);
                currentLevel++;
            }
            foreach (Predicate goalPredicate in GoalPredicates)
            {
                if (!GoalPredicatesHadd.ContainsKey(goalPredicate)) GoalPredicatesHadd.Add(goalPredicate, int.MaxValue);
            }
            return GoalPredicatesHadd;
        }

        private HashSet<Predicate> GetNextLevelHaddPredicates(HashSet<Predicate> StartPredicates, List<Action> AvailableActions)
        {
            HashSet<Predicate> NextLevelPredicates = new HashSet<Predicate>(StartPredicates);
            foreach(Action action in AvailableActions)
            {
                if(IsApplicableAction(StartPredicates, action))
                {
                    HashSet<Predicate> influences = new HashSet<Predicate>();
                    // In case we want observation will also effect the hAdd value.
                    /*
                    HashSet<Predicate> observedPredicates = action.Observe.GetAllPredicates();
                    if (observedPredicates != null) 
                    {
                        influences.UnionWith(observedPredicates);
                        foreach (Predicate predicate in observedPredicates) influences.Add(predicate.Negate());
                    } 
                    */
                    HashSet<Predicate> effectPredicates = new HashSet<Predicate>();
                    if (action.Effects != null)
                    {
                        effectPredicates = action.Effects.GetAllPredicates();
                    }
                    
                    if(effectPredicates != null) influences.UnionWith(effectPredicates);

                    foreach (Predicate influencePredicate in influences)
                    {
                        if (!NextLevelPredicates.Contains(influencePredicate))
                        {
                            NextLevelPredicates.Add(influencePredicate);   
                        }
                    }
                }
            }
            return NextLevelPredicates;
        }

        private bool IsApplicableAction(HashSet<Predicate> KnownPredicates, Action action)
        {
            if (action.Preconditions == null) return true;
            foreach(Predicate preconditionPredicate in action.Preconditions.GetAllPredicates())
            {
                if (!KnownPredicates.Contains(preconditionPredicate))
                {
                    return false;
                }
            }
            return true;
        }

        
    }
}
