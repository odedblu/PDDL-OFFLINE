using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class MaxAvarageValueActionSelectPolicy : IActionSelectPolicy
    {
        public Action SelectBestAction(PomcpNode SelectionNode)
        {
            Dictionary<Action, PomcpNode> Childrens = SelectionNode.Childs;
            if(Childrens.Count == 0)
            {
                throw new ArgumentException("Childrens is empty, could not select best action.");
            }
            double MaxAvarageValue = Double.MinValue;
            Action BestAction = null;

            foreach(KeyValuePair<Action , PomcpNode> kvp in Childrens)
            {
                double ChildrenAvarageValue = (double)kvp.Value.Value / (double)kvp.Value.VisitedCount;
                if (MaxAvarageValue < ChildrenAvarageValue)
                {
                    MaxAvarageValue = ChildrenAvarageValue;
                    BestAction = kvp.Key;
                }
            }

            return BestAction;
        }
    }
}
