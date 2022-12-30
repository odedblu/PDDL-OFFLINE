using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class HAddRolloutPolicy : IRolloutPolicy
    {
        public Dictionary<HashSet<Predicate>, List<Action>> DomainAvailableActionsCache { get; set; }
        public Dictionary<Tuple<int, int>, HashSet<Predicate>> NextLevelHAddCache { get; set; }

        public Dictionary<State, HashSet<Action>> StateResultCache { get; set; }
        public HAddRolloutPolicy()
        {
            DomainAvailableActionsCache = new Dictionary<HashSet<Predicate>, List<Action>>(HashSet<Predicate>.CreateSetComparer());
            NextLevelHAddCache = new Dictionary<Tuple<int, int>, HashSet<Predicate>>();
            StateResultCache = new Dictionary<State, HashSet<Action>>();
        }

        public Action ChooseAction(State s)
        {
            HashSet<Action> bestActions = new HashSet<Action>();
            if (!StateResultCache.ContainsKey(s))
            {
                Dictionary<Action, int> ActionsScores = new Dictionary<Action, int>();
                HashSet<Predicate> GoalPredicates = s.Problem.Goal.GetAllPredicates();

                s.GroundAllActions();
                foreach (Action action in s.AvailableActions)
                {
                    HashSet<Predicate> StatePredicates = new HashSet<Predicate>(s.Predicates);
                    if (action.Effects != null) StatePredicates.UnionWith(action.Effects.GetAllPredicates());
                    /*if (action.Observe != null) 
                    {
                        StatePredicates.UnionWith(action.Observe.GetAllPredicates());
                        StatePredicates.UnionWith(action.Observe.Negate().GetAllPredicates());
                    }*/
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
                int BestActionScore = int.MaxValue;
                foreach (KeyValuePair<Action, int> kvp in ActionsScores)
                {
                    if (kvp.Value < BestActionScore)
                    {
                        BestActionScore = kvp.Value;
                    }
                }
                foreach (KeyValuePair<Action, int> kvp in ActionsScores)
                {
                    if (kvp.Value == BestActionScore)
                    {
                        bestActions.Add(kvp.Key);
                    }
                }
                StateResultCache[s] = bestActions;
            }
            else
            {
                bestActions = StateResultCache[s];
            }

            Random rnd = new Random();
            Action BestAction = null;

            if (bestActions.Count == 0)
            {
                int selectedIndex = rnd.Next(s.AvailableActions.Count());
                BestAction = s.AvailableActions.ElementAt(selectedIndex);
            }
            else
            {
                int selectedIndex = rnd.Next(bestActions.Count());
                BestAction = bestActions.ElementAt(selectedIndex);
            }
            return BestAction;
        }

        private Dictionary<Predicate,int> GetGoalPredicatesHaddLevel(HashSet<Predicate> GoalPredicates, HashSet<Predicate> StartPredicates, Domain domain)
        {
            Dictionary<Predicate,int> GoalPredicatesHadd = new Dictionary<Predicate,int>();
            List<Action> actions = GetCachedAvailableActions(domain, StartPredicates);
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
                actions = GetCachedAvailableActions(domain, StartPredicates);
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
            Tuple<int, int> CacheKey = new Tuple<int, int>(GetEnumarbleHashCode(StartPredicates), GetEnumarbleHashCode(AvailableActions));
            if(NextLevelHAddCache.ContainsKey(CacheKey)) return NextLevelHAddCache[CacheKey];
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
            NextLevelHAddCache[CacheKey] = NextLevelPredicates;
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

        private List<Action> GetCachedAvailableActions(Domain domain, HashSet<Predicate> availablePredicates)
        {
            if (DomainAvailableActionsCache.ContainsKey(availablePredicates)) { 
                return DomainAvailableActionsCache[availablePredicates]; 
            }
            else
            {
                List<Action> availableActions = domain.GroundAllActions(availablePredicates, false);
                DomainAvailableActionsCache.Add(availablePredicates, availableActions);
                return availableActions;
            }
        }

        private int GetEnumarbleHashCode<T>(IEnumerable<T> values)
        {
            int hash = 19;
            foreach (var subObject in values)
            {
                hash = hash * 31 + subObject.GetHashCode();
            }
            return hash;
        }
    }
}
