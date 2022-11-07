using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal interface IRolloutPolicy
    {
        Action ChooseAction(State s);
    }
}
