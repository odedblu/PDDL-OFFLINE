using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace PDDL
{
    internal class BelifeParticles
    {
        public Dictionary<State, int> ViewedStates;
        private int BelifeSize;

        public BelifeParticles()
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

        public BelifeParticles Apply(Action a, Formula observationPredicats)
        {
            // Init the return value.
            BelifeParticles NextBelifePatricel = new BelifeParticles();


            // Foreach particle apply the action and update the new belife particle to have the same frequency.
            foreach (KeyValuePair<State, int> stateFrequency in this.ViewedStates)
            {
                State NextState = stateFrequency.Key.Apply(a);
                if(NextState != null)
                {
                    if(a.Observe != null)
                    {

                        if(GetObservationAsList(observationPredicats).All(observedPredicate => observationPredicats.IsTrue(NextState.Predicates, false))){
                            NextBelifePatricel.ViewedStates[NextState] = stateFrequency.Value;
                            NextBelifePatricel.BelifeSize += stateFrequency.Value;
                        }
                    }
                    else
                    {
                        NextBelifePatricel.ViewedStates[NextState] = stateFrequency.Value;
                        NextBelifePatricel.BelifeSize += stateFrequency.Value;
                    }
                }
            }
            return NextBelifePatricel;
        }


        private List<Predicate> GetObservationAsList(Formula observationPredicates)
        {
            List<Predicate> PredicatsObservation = new List<Predicate>();
            if (observationPredicates != null)
            {
                PredicatsObservation = observationPredicates.GetAllPredicates().ToList();
            }
            return PredicatsObservation;
        }

        public bool IsApplicable(Action a)
        {
            if(Size() == 0) return false;
            if (a.Preconditions == null)
                return true;
            bool result = true;
            foreach(State s in ViewedStates.Keys)
            {
                if (a.Preconditions.IsFalse(s.Predicates))
                    return false;
            }
            
            return result;
        }
    }
}
