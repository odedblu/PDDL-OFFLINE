using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace ContingentToFOND
{
    public class Problem
    {
        public string Name { get; private set; }
        public Formula Goal { get; set; }
        public Domain Domain{ get; private set;}
        private HashSet<Predicate> m_lKnown;
        private List<CompoundFormula> m_lHidden;
        public IEnumerable<CompoundFormula> Hidden { get { return m_lHidden; } }
        public IEnumerable<Predicate> Known { get { return m_lKnown; } }
        public List<Action> ReasoningActions { get; private set; }
        public string MetricStatement { get; private set; }
        private HashSet<Predicate> m_lInitiallyUnknown;

        private Dictionary<GroundedPredicate, int> m_dMapPredicateToIndex;
        private List<GroundedPredicate> m_lIndexToPredicate;

        private Dictionary<GroundedPredicate,HashSet<GroundedPredicate>> m_dRelevantPredicates;


        public Problem(string sName, Domain d)
        {
            Domain = d;
            m_lKnown = new HashSet<Predicate>();
            m_lHidden = new List<CompoundFormula>();
            Name = sName;
            Goal = null;
            ReasoningActions = new List<Action>();
            m_dRelevantPredicates = new Dictionary<GroundedPredicate, HashSet<GroundedPredicate>>();
            m_lInitiallyUnknown = new HashSet<Predicate>();
            m_dMapPredicateToIndex = new Dictionary<GroundedPredicate, int>();
            m_lIndexToPredicate = new List<GroundedPredicate>();
        }

        public void AddKnown(Predicate p)
        {
            m_lKnown.Add(p);
        }
        public bool InitiallyUnknown(Predicate p)
        {
            return m_lInitiallyUnknown.Contains(p.Canonical());
        }
        public void AddHidden(CompoundFormula cf)
        {
            Domain.AddHidden(cf);

            HashSet<Predicate> hs = cf.GetAllPredicates();
            foreach (GroundedPredicate gp in hs)
            {
                m_lInitiallyUnknown.Add(gp.Canonical());
                GroundedPredicate gpCanonical = (GroundedPredicate)gp.Canonical();
                if (!m_dRelevantPredicates.ContainsKey(gpCanonical))
                    m_dRelevantPredicates[gpCanonical] = new HashSet<GroundedPredicate>();
                foreach (GroundedPredicate gpOther in hs)
                {
                    GroundedPredicate gpOtherCanonical = (GroundedPredicate)gpOther.Canonical();
                    if (gpOtherCanonical != gpCanonical)
                        m_dRelevantPredicates[gpCanonical].Add(gpOtherCanonical);
                }
                
            }

            m_lHidden.Add(cf);
        }
        public override string ToString()
        {
            string s = "(problem " + Name + "\n";
            s += "(domain " + Domain.Name + ")\n";
            s += "(init ";
            //s += "(known " + Parser.ListToString(m_lKnown) + ")\n";
            s += "(hidden " + Parser.ListToString(m_lHidden) + "))\n";
            s += ")";
            return s;
        }

 
 

        public void AddReasoningActions()
        {
            ReasoningActions = new List<Action>();
            foreach (CompoundFormula cf in m_lHidden)
            {
                if (cf.Operator == "oneof")
                {
                    foreach (Formula f in cf.Operands)
                    {
                        if (cf.Operands.Count > 2)
                        {
                            CompoundFormula cfNegativeEffects = new CompoundFormula("and");
                            CompoundFormula cfPositiveEffects = new CompoundFormula("or");
                            foreach (Formula fOther in cf.Operands)
                            {
                                if (!fOther.Equals(f))
                                {
                                    cfNegativeEffects.AddOperand(f.Negate());
                                }
                                AddReasoningAction(f, cfNegativeEffects);
                            }
                        }
                        else
                        {
                            AddReasoningAction(cf.Operands[0], cf.Operands[1].Negate());
                            AddReasoningAction(cf.Operands[1], cf.Operands[0].Negate());
                        }
                    }
                }
                else
                    throw new NotImplementedException("Not implementing or for now");
            }
        }

         private void AddReasoningAction(Formula fPreconditions, Formula fEffect)
        {
            Action a = new Action("Reasoning" + ReasoningActions.Count);
            a.Preconditions = fPreconditions;
            a.SetEffects( fEffect);
            ReasoningActions.Add(a);
        }
       public void WriteReasoningActions(StreamWriter sw)
        {
            int cActions = 0;
            foreach (CompoundFormula cfHidden in m_lHidden)
            {
                string sComment = ";;" + cfHidden.ToString().Substring(1);
                sw.WriteLine(sComment);
                cActions = WriteReasoningActions(sw, cfHidden, cActions);
            }
        }

        public void WriteReasoningAxioms(StreamWriter sw)
        {
            int cActions = 0;
            foreach (CompoundFormula cfHidden in m_lHidden)
            {
                cActions = WriteReasoningAxioms(sw, cfHidden, cActions);
            }
        }

        private void WriteResoningAction(StreamWriter sw, HashSet<Predicate> lPreconditions, HashSet<Predicate> lEffects, int iNumber)
        {
            sw.WriteLine("(:action R" + iNumber);
            sw.Write(":precondition (and");
            foreach (Predicate pPrecondition in lPreconditions)
            {
                sw.Write(pPrecondition);
            }
            sw.WriteLine(")");
            sw.Write(":effect (and");
            foreach (Predicate pEffect in lEffects)
            {
                sw.Write(pEffect);
            }
            sw.WriteLine(")");
            sw.WriteLine(")");
        }

        private void WriteResoningAxiom(StreamWriter sw, HashSet<Predicate> lPreconditions, HashSet<Predicate> lEffects, int iNumber)
        {
            sw.WriteLine("(:axiom");
            sw.Write(":context (and");
            foreach (Predicate pPrecondition in lPreconditions)
            {
                sw.Write(pPrecondition);
            }
            sw.WriteLine(")");
            sw.Write(":implies (and");
            foreach (KnowPredicate pEffect in lEffects)
            {
                sw.Write(pEffect);
            }
            sw.WriteLine(")");
            sw.WriteLine(")");
        }

        private void AddReasoningAction(HashSet<Predicate> lPreconditions, HashSet<Predicate> lEffects, Dictionary<List<Predicate>, List<Predicate>> dActions)
        {
            List<Predicate> lKnowPreconditions = new List<Predicate>();
            foreach (GroundedPredicate p in lPreconditions)
            {
                KnowPredicate pKnow = new KnowPredicate(p);
                lKnowPreconditions.Add(pKnow);
                lKnowPreconditions.Add(p);
            }
            List<Predicate> lKnowEffects = new List<Predicate>();
            foreach (GroundedPredicate p in lEffects)
            {
                KnowPredicate pKnow = new KnowPredicate(p);
                lKnowEffects.Add(pKnow);
            }
            if (dActions.ContainsKey(lKnowPreconditions))
            {
                if (dActions.Comparer.Equals(lKnowEffects, dActions[lKnowPreconditions]))
                    return;
                throw new NotImplementedException();
            }
            dActions[lKnowPreconditions] = lKnowEffects;
        }

        private void AddReasoningAction(List<GroundedPredicate> lAssignment, List<KnowPredicate> lKnown, List<Predicate> lEffects, Dictionary<List<Predicate>, List<Predicate>> dActions)
        {
            List<Predicate> lPreconditions = new List<Predicate>(lAssignment);
            lPreconditions.AddRange(lKnown);
            
            List<Predicate> lKnowEffects = new List<Predicate>();
            foreach (GroundedPredicate p in lEffects)
            {
                KnowPredicate pKnow = new KnowPredicate(p);
                lKnowEffects.Add(pKnow);
            }
            if (dActions.ContainsKey(lPreconditions))
            {
                if (dActions.Comparer.Equals(lKnowEffects, dActions[lPreconditions]))
                    return;
                throw new NotImplementedException();
            }
            dActions[lPreconditions] = lKnowEffects;
        }

        private void AddReasoningActions(Formula fUnknown, HashSet<Predicate> lUnassigned, HashSet<Predicate> lAssigned, Dictionary<List<Predicate>, List<Predicate>> dActions)
        {
            if (fUnknown is PredicateFormula)
            {
                HashSet<Predicate> lEffects = new HashSet<Predicate>();
                Predicate pEffect = ((PredicateFormula)fUnknown).Predicate;
                if (pEffect.Name != Domain.TRUE_PREDICATE)
                {
                    lEffects.Add(pEffect);
                    AddReasoningAction(lAssigned, lEffects, dActions);
                }
                return;
            }
            CompoundFormula cfUnknown = (CompoundFormula)fUnknown;
            if (cfUnknown.Operator == "and")
            {
                bool bAllKnown = true;
                foreach (Formula f in cfUnknown.Operands)
                    if (f is CompoundFormula)
                        bAllKnown = false;
                if (bAllKnown)
                {
                    AddReasoningAction(lAssigned, lUnassigned, dActions);
                    return;
                }
            }
            Formula fReduced = null;
            foreach (Predicate p in lUnassigned)
            {
                HashSet<Predicate> lUnassignedReduced = new HashSet<Predicate>(lUnassigned);
                lUnassignedReduced.Remove(p);
                lAssigned.Add(p);
                fReduced = cfUnknown.Reduce(lAssigned);
                AddReasoningActions(fReduced, lUnassignedReduced, lAssigned, dActions);
                lAssigned.Remove(p);
                lAssigned.Add(p.Negate());
                fReduced = cfUnknown.Reduce(lAssigned);
                AddReasoningActions(fReduced, lUnassignedReduced, lAssigned, dActions);
                lAssigned.Remove(p.Negate());
            }
        }
        
        private int WriteReasoningActions(StreamWriter sw, CompoundFormula cfHidden, int cActions)
        {
            HashSet<Predicate> lPredicates = new HashSet<Predicate>();
            cfHidden.GetAllPredicates(lPredicates);
            Dictionary<HashSet<Predicate>, HashSet<Predicate>> dActions = new Dictionary<HashSet<Predicate>, HashSet<Predicate>>();
            if (cfHidden.IsSimpleFormula())
            {
                SimpleAddReasoningActions(cfHidden, lPredicates, dActions);
            }
            else
            {
                throw new NotImplementedException("Supporting only simple formulas in the intial state");
            }
            foreach (KeyValuePair<HashSet<Predicate>, HashSet<Predicate>> pair in dActions)
            {
                HashSet<Predicate> lRemoveNotK = new HashSet<Predicate>(pair.Value);
                WriteResoningAction(sw, pair.Key, lRemoveNotK, cActions);
                cActions++;
            }
            return cActions;
        }

        private int WriteReasoningAxioms(StreamWriter sw, CompoundFormula cfHidden, int cActions)
        {
            HashSet<Predicate> lPredicates = new HashSet<Predicate>();
            cfHidden.GetAllPredicates(lPredicates);
            Dictionary<HashSet<Predicate>, HashSet<Predicate>> dActions = new Dictionary<HashSet<Predicate>, HashSet<Predicate>>();
            if (cfHidden.IsSimpleFormula())
            {
                SimpleAddReasoningActions(cfHidden, lPredicates, dActions);
            }
            else
            {
                throw new NotImplementedException();
            }
            foreach (KeyValuePair<HashSet<Predicate>, HashSet<Predicate>> p in dActions)
            {
                
                WriteResoningAxiom(sw, p.Key, p.Value, cActions);
                cActions++;
            }
            return cActions;
        }


        private void SimpleAddReasoningActions(CompoundFormula cf, HashSet<Predicate> lPredicates, Dictionary<HashSet<Predicate>, HashSet<Predicate>> dActions)
        {
            HashSet<Predicate> lPreconditions = null;
            HashSet<Predicate> lEffects = null;
            if (cf.Operator == "oneof")
            {
                foreach (Predicate p in lPredicates)
                {
                    //Kp and p -> K everything else is false
                    lPreconditions = new HashSet<Predicate>();
                    lPreconditions.Add(new KnowPredicate(p));
                    lEffects = new HashSet<Predicate>();
                    foreach (Predicate pOther in lPredicates)
                    {
                        if (pOther != p)
                        {
                            lEffects.Add(new KnowPredicate(pOther.Negate()));
                            lPreconditions.Add((new KnowPredicate(pOther)).Negate());
                            lPreconditions.Add((new KnowPredicate(pOther.Negate())).Negate());
                        }
                    }
                    dActions[lPreconditions] = lEffects;

                    //K everything but p is false -> Kp
                    lPreconditions = new HashSet<Predicate>();
                    foreach (Predicate pOther in lPredicates)
                        if (pOther != p)
                            lPreconditions.Add(new KnowPredicate(pOther.Negate()));
                    lEffects = new HashSet<Predicate>();
                    lEffects.Add(new KnowPredicate(p));

                    lPreconditions.Add((new KnowPredicate(p)).Negate());
                    lPreconditions.Add((new KnowPredicate(p.Negate()).Negate()));


                    if (!lEffects.IsSubsetOf(lPreconditions))
                        dActions[lPreconditions] = lEffects;


                }
            }
            else if (cf.Operator == "or")
            {
                foreach (Predicate p in lPredicates)
                {
                    //K everything but p and everything is false -> Kp
                    lPreconditions = new HashSet<Predicate>();
                    foreach (Predicate pOther in lPredicates)
                    {
                        if (pOther != p)
                        {
                            lPreconditions.Add(new KnowPredicate(pOther.Negate()));
                        }
                    }
                    lEffects = new HashSet<Predicate>();
                    lEffects.Add(new KnowPredicate(p));

                    lPreconditions.Add((new KnowPredicate(p)).Negate());
                    lPreconditions.Add((new KnowPredicate(p.Negate()).Negate()));

                    if (!lEffects.IsSubsetOf(lPreconditions))
                        dActions[lPreconditions] = lEffects;
                }
            }
            else if (cf.Operator == "and")
            {
                throw new NotImplementedException("I don't think that we can get here");
            }
        }

        public void AddMetric(string sMetricStatement)
        {
            MetricStatement = sMetricStatement;
        }

        public void RemoveUniversalQuantifiers()
        {
            Goal = Goal.RemoveUniversalQuantifiers(Domain.Constants, null, null);
        }

        public HashSet<GroundedPredicate> GetRelevantPredicates(GroundedPredicate gp)
        {
            if(m_dRelevantPredicates.ContainsKey(gp))
                return m_dRelevantPredicates[gp];
            return new HashSet<GroundedPredicate>();
        }

        public bool IsRelevantFor(GroundedPredicate gp, GroundedPredicate gpRelevant)
        {
            if (!m_dRelevantPredicates.ContainsKey((GroundedPredicate)gp.Canonical()))
                return false;
            return m_dRelevantPredicates[gp].Contains((GroundedPredicate)gpRelevant.Canonical());
        }


        public void ComputeRelevanceClosure()
        {
            bool bDone = false;
            while (!bDone)
            {
                bDone = true;
                foreach (GroundedPredicate gp in m_dRelevantPredicates.Keys)
                {
                    HashSet<Predicate> hsCurrentRelevant = new HashSet<Predicate>(m_dRelevantPredicates[gp]);
                    foreach (GroundedPredicate gpRelevant in hsCurrentRelevant)
                    {
                        foreach (GroundedPredicate gpOther in m_dRelevantPredicates[gpRelevant])
                        {
                            if(!gpOther.Equals(gp))
                                if (m_dRelevantPredicates[gp].Add(gpOther))
                                    bDone = false;
                        }
                    }

                }
            }
        }






        public int GetPredicateIndex(GroundedPredicate gp)
        {
            if (!m_dMapPredicateToIndex.ContainsKey(gp))
            {
                m_dMapPredicateToIndex[gp] = m_lIndexToPredicate.Count;
                m_lIndexToPredicate.Add(gp);
            }
            return m_dMapPredicateToIndex[gp];
        }
        public GroundedPredicate GetPredicateByIndex(int idx)
        {
            return m_lIndexToPredicate[idx];
        }











        public void WriteKnowledgeProblem(string sFileName)
        {
            StreamWriter sw = new StreamWriter(sFileName);
            sw.WriteLine("(define (problem K" + Name + ")");
            sw.WriteLine("(:domain K" + Domain.Name + ")");
            sw.WriteLine("(:init"); //ff doesn't like the and (and");


            foreach (GroundedPredicate gp in Known)
            {
                if (gp.Name == "Choice")
                    continue;
                if (Domain.AlwaysKnown(gp))
                    sw.WriteLine(gp);
                else
                {
                    Predicate kp = new KnowPredicate(gp);
                    sw.WriteLine(kp);
                }

            }
            HashSet<Predicate> lHidden = new HashSet<Predicate>();
            foreach (CompoundFormula cf in m_lHidden)
                cf.GetAllPredicates(lHidden);
            

            sw.WriteLine(")");

            HashSet<Predicate> lGoalPredicates = Goal.GetAllPredicates();


            CompoundFormula cfGoal = new CompoundFormula("and");
            foreach (Predicate p in lGoalPredicates)
            {
                if (Domain.AlwaysKnown(p))
                    cfGoal.AddOperand(p);
                else
                    cfGoal.AddOperand(new KnowPredicate(p));
            }


            sw.WriteLine("(:goal " + cfGoal.Simplify() + ")");

            sw.WriteLine(")");
            sw.Close();
        }


    }
}
