using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class PomcpNode
    {
        public PomcpNode Parent;
        public List<PomcpNode> Childs;
        public int VisitedCount;
        public double Value;
        public BelifeParticle ParticleFilter;

        public PomcpNode(PomcpNode parent, List<PomcpNode> childs, int visitedCount, double value, BelifeParticle particleFilter)
        {
            Parent = parent;
            Childs = childs;
            VisitedCount = visitedCount;
            Value = value;
            ParticleFilter = particleFilter;
        }

        public PomcpNode(bool IsAction)
        {
            Parent = null;
            Childs = new List<PomcpNode>();
            VisitedCount = 0;
            Value = 0;
            if (IsAction)
            {
                ParticleFilter = null;
            }
            else
            {
                ParticleFilter = new BelifeParticle();
            }
        }

        public int ChildrenSize()
        {
            return Childs.Count;
        }

        public bool IsLeaf()
        {
            return ChildrenSize() == 0;
        }

        
    }
}
