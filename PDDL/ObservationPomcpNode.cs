using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class ObservationPomcpNode : PomcpNode
    {

        public BelifeParticles ParticleFilter;
        public List<Predicate> ObservedPredicates;

        public ObservationPomcpNode()
        {
            Parent = null;
            Childs = new Dictionary<int, PomcpNode>();
            VisitedCount = 0;
            Value = 0;
            ParticleFilter = new BelifeParticles();
            ObservedPredicates = null;
        }

        public ObservationPomcpNode(ActionPomcpNode ActionParentNode, List<Predicate> Observed)
        {
            Parent = ActionParentNode;
            Childs = new Dictionary<int, PomcpNode>();
            VisitedCount = 0;
            Value = 0;
            ParticleFilter = new BelifeParticles();
            ObservedPredicates = Observed;
        }

        public Action GetBestAction(IActionSelectPolicy actionSelectPolicy)
        {
            return actionSelectPolicy.SelectBestAction(this);
        }
    }
}
