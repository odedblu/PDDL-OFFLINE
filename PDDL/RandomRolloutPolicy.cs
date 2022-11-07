using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class RandomRolloutPolicy : IRolloutPolicy
    {
        public Action ChooseAction(State s)
        {
            Random random = new Random();
            s.GroundAllActions();
            List<Action> PossibleActions = s.AvailableActions;
            int SelectedIndex = random.Next(PossibleActions.Count);
            return PossibleActions[SelectedIndex];
        }
    }
}
