using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class BelifeParticle
    {
        private Dictionary<State, int> ViewedStates;
        private int BelifeSize;

        public BelifeParticle()
        {
            this.ViewedStates = new Dictionary<State, int>();
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
        /// <param name="s"> State to add to belife particle. </param>
        public void AddState(State s)
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
        public State GetRandomState()
        {
            double cummlativeProbability = 0;
            List<Tuple<double, State>> StateProbabilities = new List<Tuple<double, State>>();
            foreach (KeyValuePair<State, int> stateFrequency in this.ViewedStates)
            {
                // do something with entry.Value or entry.Key
                double StateProbability = (double)stateFrequency.Value / (double)this.BelifeSize;
                StateProbabilities.Add(new Tuple<double, State>(cummlativeProbability + StateProbability, stateFrequency.Key));
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
