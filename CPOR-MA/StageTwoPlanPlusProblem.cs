using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace CPOR_MA
{
    public class StageTwoPlanPlusProblem
    {
        public Problem problem;
        public ConditionalPlanTreeNode conditionalPlanTreeNode;
        public bool result;        

        public StageTwoPlanPlusProblem(Problem prob, ConditionalPlanTreeNode cctn, bool res)
        {
            problem = prob;
            conditionalPlanTreeNode = cctn;
            result = res;
        }
    }
}

