﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class MaxValueActionSelectPolicy : IActionSelectPolicy
    {
        public Action SelectBestAction(PomcpNode SelectionNode, State CurrentState)
        {
            Dictionary<int, PomcpNode> Childrens = SelectionNode.Childs;
            if(Childrens.Count == 0)
            {
                throw new ArgumentException("Childrens is empty, could not select best action.");
            }
            double MaxValue = Double.MinValue;
            Action BestAction = null;
            foreach(KeyValuePair<int , PomcpNode> kvp in Childrens)
            {
                PomcpNode Children = kvp.Value;

                if (!(Children is ActionPomcpNode))
                {
                    throw new ArgumentException("Try to select best action on observation pomcp node.");
                }
                double ChildrenValue = kvp.Value.Value;
                if (MaxValue < ChildrenValue)
                {
                    MaxValue = ChildrenValue;
                    BestAction = ((ActionPomcpNode)Children).Action;
                }
            }

            return BestAction;
        }
    }
}
