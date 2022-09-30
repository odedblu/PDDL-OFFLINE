using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class ActionPomcpNode : PomcpNode
    {

        public Action Action { get; set; }  

        public ActionPomcpNode(Action action)
        {
            Parent = null;
            Childs = new Dictionary<int, PomcpNode>();
            VisitedCount = 0;
            Value = 0;
            Action = action;
        }

        public ActionPomcpNode(ObservationPomcpNode ObservationParentNode, Action action)
        {
            Parent = ObservationParentNode;
            Childs = new Dictionary<int, PomcpNode>();
            VisitedCount = 0;
            Value = 0;
            Action = action;
        }

        public void AddObservationChilds(List<Predicate> Observations)
        {
            ObservationPomcpNode observationPomcpNode = new ObservationPomcpNode(this, Observations);
            int ObservationsHash = GetObservationsHash(Observations);
            Childs.Add(ObservationsHash, observationPomcpNode);
        }

        public int GetObservationsHash(List<Predicate> Observations)
        {
            int resultHash = 0;
            foreach (Predicate predicate in Observations)
            {
                resultHash = resultHash ^ predicate.GetHashCode();
            }
            return resultHash;
        }
    }
}
