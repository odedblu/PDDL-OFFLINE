using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class BelifeParticles
    {
        private Dictionary<PartiallySpecifiedState, int> ViewedStates;
        private int BelifeSize;

        public BelifeParticles()
        {
            this.ViewedStates = new Dictionary<PartiallySpecifiedState, int>();
            this.BelifeSize = 0;
        }


        /// <summary>
        /// Get the size of the belife particle.
        /// </summary>
        /// <returns> Size of the belife particle. </returns>
        public int Size()
        {
            return this.BelifeSize;
        }


        /// <summary>
        /// Add state to the belife particle.
        /// </summary>
        /// <param name="s"> PartiallySpecifiedState to add to belife particle. </param>
        public void AddState(PartiallySpecifiedState s)
        {
            if (this.ViewedStates.ContainsKey(s))
            {
                this.ViewedStates[s]++;
            }
            else
            {
                this.ViewedStates[s] = 1;
            }
            this.BelifeSize++;
        }


        /// <summary>
        /// Get random state from the belife particle, if the belife particle is empty, return null.
        /// </summary>
        /// <returns> Chosen state from the belife particle. </returns>
        public PartiallySpecifiedState GetRandomState()
        {
            double cummlativeProbability = 0;
            List<Tuple<double, PartiallySpecifiedState>> StateProbabilities = new List<Tuple<double, PartiallySpecifiedState>>();
            foreach (KeyValuePair<PartiallySpecifiedState, int> stateFrequency in this.ViewedStates)
            {
                double StateProbability = (double)stateFrequency.Value / (double)this.BelifeSize;
                StateProbabilities.Add(new Tuple<double, PartiallySpecifiedState>(cummlativeProbability + StateProbability, stateFrequency.Key));
                cummlativeProbability += StateProbability;
            }
            Random random = new Random();
            double RandomRoll = random.NextDouble();
            foreach (var StateProbability in StateProbabilities)
            {
                if (StateProbability.Item1 > RandomRoll)
                    return StateProbability.Item2;
            }
            return null;
        }

    }
}
