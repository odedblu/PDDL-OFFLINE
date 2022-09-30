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
            Dictionary<int, PomcpNode> Childrens = SelectionNode.Childs;
            if(Childrens.Count == 0)
            {
                throw new ArgumentException("Childrens is empty, could not select best action.");
            }
            double MaxAvarageValue = Double.MinValue;
            Action BestAction = null;
            foreach(KeyValuePair<int , PomcpNode> kvp in Childrens)
            {
                PomcpNode Children = kvp.Value;

                if (!(Children is ActionPomcpNode))
                {
                    throw new ArgumentException("Try to select best action on observation pomcp node.");
                }
                double ChildrenAvarageValue = (double)kvp.Value.Value / (double)kvp.Value.VisitedCount;
                if (MaxAvarageValue < ChildrenAvarageValue)
                {
                    MaxAvarageValue = ChildrenAvarageValue;
                    BestAction = ((ActionPomcpNode)Children).Action;
                }
            }

            return BestAction;
        }
    }
}
