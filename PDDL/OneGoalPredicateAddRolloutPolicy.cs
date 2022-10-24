using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class GoalPredicateAddRolloutPolicy : IRolloutPolicy
    {
        public Action ChooseAction(PartiallySpecifiedState s)
        {
            Dictionary<Action, int> ActionScores = new Dictionary<Action, int>();
            HashSet<Predicate> GoalPredicates = s.Problem.Goal.GetAllPredicates();
            s.GroundAllActions();
            int MaxActionGoalPredicatesCount = 0;
            foreach (Action action in s.AvailableActions)
            {
                int ActionGoalPredicatesCount = 0;
                if (action.Effects == null) continue;
                HashSet<Predicate> ActionEffects = action.Effects.GetAllPredicates();
                foreach (Predicate GoalPredicate in GoalPredicates)
                {
                    if (ActionEffects.Contains(GoalPredicate)){
                        ActionGoalPredicatesCount++;
                    }
                }
                ActionScores.Add(action, ActionGoalPredicatesCount);
                if(ActionGoalPredicatesCount > MaxActionGoalPredicatesCount)
                {
                    MaxActionGoalPredicatesCount = ActionGoalPredicatesCount;
                }
            }

            
            IEnumerable<Action> PossibleActions = ActionScores.Where(pair => pair.Value == MaxActionGoalPredicatesCount).Select(pair => pair.Key);
            Random random = new Random();
            int BestActionsCount = PossibleActions.Count();
            int SelectedIndex;
            if (BestActionsCount != 0)
            {
                SelectedIndex = random.Next(0, PossibleActions.Count());
                return PossibleActions.ElementAt(SelectedIndex);
            }
            SelectedIndex = random.Next(0, s.AvailableActions.Count());
            return s.AvailableActions.ElementAt(SelectedIndex);
        }
    }
}
