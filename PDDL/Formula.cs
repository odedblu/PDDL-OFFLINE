﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PDDL
{
    public abstract class Formula
    {
        public int Size { get; protected set; }
        public int ID { get; private set; }
        public static int FormulaCount { get; private set; }

        public Formula()
        {
            ID = FormulaCount++;
        }

        public abstract bool IsTrue(IEnumerable<Predicate> lKnown, bool bContainsNegations);
        public abstract bool IsFalse(IEnumerable<Predicate> lKnown, bool bContainsNegations);


        public bool IsTrue(IEnumerable<Predicate> lKnown)
        {
            return IsTrue(lKnown, true);
        }
        public bool IsFalse(IEnumerable<Predicate> lKnown)
        {
            return IsFalse(lKnown, true);
        }
        public abstract Formula Ground(Dictionary<string, Constant> dBindings);
        public abstract Formula PartiallyGround(Dictionary<string, Constant> dBindings);
        public abstract Formula Negate();
        public abstract void GetAllPredicates(HashSet<Predicate> lPredicates);
        public abstract void GetAllEffectPredicates(HashSet<Predicate> lConditionalPredicates, HashSet<Predicate> lNonConditionalPredicates);
        public abstract Formula ToCNF();

        public HashSet<Predicate> GetAllPredicates()
        {
            HashSet<Predicate> lPredicates = new HashSet<Predicate>();
            GetAllPredicates(lPredicates);
            return lPredicates;
        }

        public abstract bool ContainsCondition();

        public abstract Formula Clone();

        public abstract bool ContainedIn(IEnumerable<Predicate> lPredicates, bool bContainsNegations);
        public abstract Formula Replace(Formula fOrg, Formula fNew);
        public abstract Formula Replace(Dictionary<Formula,Formula> dTranslations);
        public abstract Formula Simplify();

        public abstract Formula Regress(Action a, IEnumerable<Predicate> lObserved);
        public abstract Formula Regress(Action a);

        public abstract Formula Reduce(IEnumerable<Predicate> lKnown);

        public override int GetHashCode()
        {
            return ToString().GetHashCode();
        }

        public abstract bool ContainsNonDeterministicEffect();

        public abstract int GetMaxNonDeterministicOptions();

        public virtual HashSet<Predicate> GetAllOptionalPredicates()
        {
            HashSet<Predicate> lPredicates = new HashSet<Predicate>();
            GetAllOptionalPredicates(lPredicates);
            return lPredicates;
        }
        public abstract void GetAllOptionalPredicates(HashSet<Predicate> lPredicates);

        public abstract Formula CreateRegression(Predicate Predicate, int iChoice);

        public abstract Formula GenerateGiven(string sTag, List<string> lAlwaysKnown);

        public abstract Formula ReplaceNegativeEffectsInCondition();

        public abstract Formula RemoveImpossibleOptions(IEnumerable<Predicate> lObserved);

        public abstract Formula ApplyKnown(IEnumerable<Predicate> lKnown);

        public abstract List<Predicate> GetNonDeterministicEffects();

        public abstract Formula RemoveUniversalQuantifiers(List<Constant> lConstants, List<Predicate> lConstantPredicates, Domain d);

        public abstract Formula GetKnowledgeFormula(List<string> lAlwaysKnown, bool bKnowWhether);

        public abstract Formula ReduceConditions(IEnumerable<Predicate> lKnown);

        public abstract Formula RemoveNegations();

        public abstract bool IsFunction();
    }
}
