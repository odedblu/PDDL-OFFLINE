using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class ActionPomcpNode : PomcpNode
    {
        public ActionPomcpNode()
        {
            Parent = null;
            Childs = new List<PomcpNode>();
            VisitedCount = 0;
            Value = 0;
        }

        public ActionPomcpNode(ObservationPomcpNode ObservationParentNode)
        {
            Parent = ObservationParentNode;
            Childs = new List<PomcpNode>();
            VisitedCount = 0;
            Value = 0;
        }
    }
}
