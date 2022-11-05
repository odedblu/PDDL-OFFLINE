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
        public Action ChooseAction(PartiallySpecifiedState s)
        {
            Dictionary<Predicate, int> GoalPredicatesScores = new Dictionary<Predicate, int>();
            HashSet<Predicate> GoalPredicates = s.Problem.Goal.GetAllPredicates();
            s.GroundAllActions();
            foreach(Action action in s.AvailableActions)
            {
                HashSet<Predicate> startPredicates = new HashSet<Predicate>(s.Observed).UnionWith(action.Effects.GetAllPredicates());
                Dictionary<Predicate, int> ActionPredicatesScores = GetGoalPredicatesHaddLevel(GoalPredicates, , s.Problem.Domain);

            }
            




            throw new NotImplementedException(); // Remove when done implementing this rollout policy.
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
                    if(nextLayerPredicats.Contains(goalPredicate)) GoalPredicatesHadd.Add(goalPredicate, currentLevel + 1);
                }
                StartPredicates = nextLayerPredicats;
                actions = domain.GroundAllActions(StartPredicates, true);
                nextLayerPredicats = GetNextLevelHaddPredicates(StartPredicates, actions);
                currentLevel++;
            }
            foreach (Predicate goalPredicate in GoalPredicates)
            {
                if (GoalPredicatesHadd.ContainsKey(goalPredicate)) GoalPredicatesHadd.Add(goalPredicate, int.MaxValue);
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
                    HashSet<Predicate> observedPredicates = action.Observe.GetAllPredicates();
                    if (observedPredicates != null) 
                    {
                        influences.UnionWith(observedPredicates);
                        foreach (Predicate predicate in observedPredicates) influences.Add(predicate.Negate());
                    } 
                    HashSet<Predicate> effectPredicates = action.Effects.GetAllPredicates();
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
