﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CPOR_MA
{
    abstract class Policy
    {
        public abstract Action GetBestAction(State s);
    }
}
