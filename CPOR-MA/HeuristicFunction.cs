﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CPOR_MA
{
    abstract class HeuristicFunction
    {
        public abstract double h(State s);
        public abstract Dictionary<State,Action> GetNextStates(State s);
    }
}
