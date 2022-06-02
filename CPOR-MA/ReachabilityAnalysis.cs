using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CPOR_MA
{
    class ReachabilityAnalysis
    {
        private Domain dom;
        private Problem prob;
        public ReachabilityAnalysis(Domain d, Problem p)
        {
            this.dom = d;
            this.prob = p;
        }
        public void reachabilityAnalysis()
        {
            Console.WriteLine(dom);
        }
    }
}
