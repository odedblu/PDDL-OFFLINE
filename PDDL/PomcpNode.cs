using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal abstract class PomcpNode
    {
        public PomcpNode Parent;
        public List<PomcpNode> Childs;
        public int VisitedCount;
        public double Value;
        public BelifeParticles ParticleFilter;


        public int ChildrenSize()
        {
            return Childs.Count;
        }

        public bool IsLeaf()
        {
            return ChildrenSize() == 0;
        }

        public abstract

        
    }
}
