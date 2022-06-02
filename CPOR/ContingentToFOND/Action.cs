using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace ContingentToFOND
{
    public class Action
    {
        private static int IDs = 0;

        public int ID { get; private set; }

        public string Name { get; set; }
        public Formula Preconditions { get; set; }
        public Formula Effects { get; set; }
        public Formula Observe { get; set; }
        public bool ContainsNonDeterministicEffect { get; protected set; }
        public HashSet<Predicate> NonDeterministicEffects { get; private set; }

        private Dictionary<int, List<int>> m_mMapConditionsChoices;

        private Dictionary<Predicate, Formula> m_mRegressions;

        public bool HasConditionalEffects { get; protected set; }

        public Action(string sName)
        {
            Name = sName;
            m_mMapConditionsChoices = new Dictionary<int, List<int>>();
            ID = IDs++;
            NonDeterministicEffects = new HashSet<Predicate>();
        }

        public override string ToString()
        {
            string s = "(:action " + Name + "\n";
            if (Preconditions != null)
                s += " :precondition " + Preconditions + "\n";
            if (Effects != null)
                s += " :effect " + Effects + "\n";
            if (Observe != null)
                s += " :observe " + Observe + "\n";
            s += ")";
            return s;
        }


        public void SetEffects(Formula f)
        {
            Effects = f;
            ContainsNonDeterministicEffect = f.ContainsNonDeterministicEffect();
            HasConditionalEffects = f.ContainsCondition();
        }

        public List<Predicate> GetNonDeterministicEffects()
        {
            if (Effects == null)
                return null;
            return Effects.GetNonDeterministicEffects();
        }


        public List<CompoundFormula> GetConditions()
        {
            List<CompoundFormula> lConditions = new List<CompoundFormula>();
            List<Formula> lObligatory = new List<Formula>();
            SplitEffects(lConditions, lObligatory);
            return lConditions;
        }


        private void SplitEffects(List<CompoundFormula> lConditions, List<Formula> lObligatory)
        {
            if (Effects == null)
                return;
            if (Effects is PredicateFormula)
            {
                lObligatory.Add(Effects);
                return;
            }
            if (Effects is CompoundFormula)
            {
                CompoundFormula cfEffects = (CompoundFormula)Effects;
                if (cfEffects.Operator == "when")
                {
                    lConditions.Add(cfEffects);
                    return;
                }
                if (cfEffects.Operator != "and")
                    throw new NotImplementedException();
                foreach (Formula fSub in cfEffects.Operands)
                {
                    if (fSub is PredicateFormula)
                        lObligatory.Add(fSub);
                    else if (fSub is CompoundFormula)
                    {
                        if (((CompoundFormula)fSub).Operator == "when")
                            lConditions.Add((CompoundFormula)fSub);
                        else
                            lObligatory.Add(fSub);
                    }
                }
            }
        }




        public virtual Action Clone()
        {
            Action aNew = new Action(Name);
            if (Preconditions != null)
                aNew.Preconditions = Preconditions.Clone();
            if (Effects != null)
                aNew.Effects = Effects.Clone();
            if (Observe != null)
                aNew.Observe = Observe.Clone();
            aNew.HasConditionalEffects = HasConditionalEffects;
            aNew.ContainsNonDeterministicEffect = ContainsNonDeterministicEffect;
            aNew.NonDeterministicEffects = new HashSet<Predicate>(NonDeterministicEffects);
            return aNew;
        }










        public override bool Equals(object obj)
        {
            if (obj is Action)
                return Name == ((Action)obj).Name;
            return false;
        }
        public override int GetHashCode()
        {
            return Name.GetHashCode();
        }


        private bool CompareFormulas(Formula f1, Formula f2)
        {
            if (f1 == null && f2 == null)
                return true;
            if (f1 == null)
                return false;
            if (f2 == null)
                return false;
            return f1.Equals(f2);
        }

        public bool CompareTo(Action aOther)
        {
            if (Name != aOther.Name)
                return false;
            if (!CompareFormulas(Preconditions, aOther.Preconditions))
                return false;
            if (!CompareFormulas(Effects, aOther.Effects))
                return false;
            if (!CompareFormulas(Observe, aOther.Observe))
                return false;
            return true;
        }

        public Action RemoveUniversalQuantifiers(List<Constant> lConstants, List<Predicate> lConstantPredicates, Domain d)
        {
            Action aNew = Clone();
            
            if (Preconditions != null)
                aNew.Preconditions = Preconditions.RemoveUniversalQuantifiers(lConstants, lConstantPredicates, d);
            if (aNew.Preconditions is PredicateFormula)
            {
                Predicate p = ((PredicateFormula)aNew.Preconditions).Predicate;
                if (p.Name == Domain.TRUE_PREDICATE)
                    aNew.Preconditions = null;
                if (p.Name == Domain.FALSE_PREDICATE)
                    return null;
            }
            if (Effects != null)
                aNew.Effects = Effects.RemoveUniversalQuantifiers(lConstants, lConstantPredicates, d);
            if (Observe != null)//assuming no universal quanitifiers in observe
                aNew.Observe = Observe;
            return aNew;
        }

 

    }
}
