using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class UCBValueActionSelectPolicy : IActionSelectPolicy
    {
        public double C { get; set; }


        public UCBValueActionSelectPolicy(double C)
        {
            this.C = C;
        }

        public Action SelectBestAction(PomcpNode SelectionNode)
        {
            Dictionary<Action, PomcpNode> Childrens = SelectionNode.Childs;
            if (Childrens.Count == 0)
            {
                throw new ArgumentException("Childrens is empty, could not select best action.");
            }
            double MaxUCBValue = Double.MinValue;
            Action BestAction = null;

            foreach (KeyValuePair<Action, PomcpNode> kvp in Childrens)
            {
                PomcpNode Children = kvp.Value;
                double ChildrenUCBScore = Children.Value + C * Math.Sqrt(Math.Log(SelectionNode.VisitedCount) / (double)Children.VisitedCount);
                if (MaxUCBValue < ChildrenUCBScore)
                {
                    MaxUCBValue = ChildrenUCBScore;
                    BestAction = kvp.Key;
                }
            }

            return BestAction;
        }
    }
}
