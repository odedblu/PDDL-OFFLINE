using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class RewardFunctions
    {
        public static double GeneralReward(State state, Problem p)
        {
            //if (state == null) return Double.MinValue;
            if (state != null && p.IsGoalState(state))
            {
                return 10.0;
            }
            else
            {
                if (state == null) return -100.0;
            }
            return -1.0;
        }
    }
}
