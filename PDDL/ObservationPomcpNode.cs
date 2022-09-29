using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class ObservationPomcpNode : PomcpNode
    {
        public ObservationPomcpNode()
        {
            Parent = null;
            Childs = new List<PomcpNode>();
            VisitedCount = 0;
            Value = 0;
            ParticleFilter = new BelifeParticles();
        }
    }
}
