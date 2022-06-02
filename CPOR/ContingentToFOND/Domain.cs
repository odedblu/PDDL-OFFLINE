using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace ContingentToFOND
{
    public class Domain
    {
        public string Name { get; protected set; }
        public List<string> Types { get; private set; }
        public List<Action> Actions { get;  set; }
        public List<Constant> Constants { get; protected set; }
        public List<Predicate> Predicates { get; protected set; }
        public List<string> Functions { get; protected set; }
        public List<string> m_lAlwaysKnown { get; protected set; }
        private List<string> m_lAlwaysConstant;
        private List<string> m_lObservable;
        public string Path { get; private set; }
        public bool IsSimple { get; private set; }

        public bool m_bUseOptions = true;
        public bool m_bReplaceNonDeterministicEffectsWithOptions = true;
        public bool UseCosts { get; private set; }

        public const string OPTION = "OPTION_TYPE";
        public const string OPTION_PREDICATE = "option";
        public const string VALUE = "VALUE_TYPE";
        public const string VALUE_PARAMETER = "?V_PARAM";
        public const string TAG = "TAG_TYPE";
        public const string TAG_PARAMETER = "?TAG_PARAM";
        public const string TRUE_VALUE = "V_TRUE";
        public const string FALSE_VALUE = "V_FALSE";
        public const string TRUE_PREDICATE = "P_TRUE";
        public const string FALSE_PREDICATE = "P_FALSE";

        public const int TIME_STEPS = 0;
        public const int MAX_OPTIONS = 2;


        public bool RemoveConflictingConditionalEffects = false;
        private Dictionary<Predicate, Predicate> m_dAuxilaryPredicates;


        public Domain(string sName, string sPath)
        {
            UseCosts = true;
            Name = sName;
            Path = sPath;
            Actions = new List<Action>();
            Constants = new List<Constant>();
            Predicates = new List<Predicate>();
            Types = new List<string>();
            m_lAlwaysKnown = new List<string>();
            m_lAlwaysKnown.Add("increase");
            m_lAlwaysKnown.Add("decrease");
            m_lAlwaysKnown.Add("=");
            m_lAlwaysConstant = new List<string>();
            m_lObservable = new List<string>();
            m_dAuxilaryPredicates = new Dictionary<Predicate, Predicate>();
            Functions = new List<string>();
            IsSimple = true;
        }

        public void AddAction(Action a)
        {
            Actions.Add(a);
            if (a.Effects != null)
            {
                HashSet<Predicate> lConditionalEffects = new HashSet<Predicate>();
                HashSet<Predicate> lNonConditionalEffects = new HashSet<Predicate>();

                a.Effects.GetAllEffectPredicates(lConditionalEffects, lNonConditionalEffects);

                if (lConditionalEffects.Count > 0)
                    IsSimple = false;

                foreach (Predicate p in lConditionalEffects)
                {
                    //m_lAlwaysKnown.Remove(p.Name);
                    m_lAlwaysConstant.Remove(p.Name);
                }
                foreach (Predicate p in lNonConditionalEffects)
                {
                    m_lAlwaysConstant.Remove(p.Name);
                }
                List<Predicate> lNonDetEffects = a.GetNonDeterministicEffects();
                if (lNonDetEffects != null)
                {
                    foreach (Predicate p in lNonDetEffects)
                    {
                        m_lAlwaysKnown.Remove(p.Name);
                    }
                }

            }
            else if (a.Effects is PredicateFormula)
            {
                Predicate p = ((PredicateFormula)a.Effects).Predicate;
                m_lAlwaysConstant.Remove(p.Name);
            }
            if (a.Observe != null)
            {
                foreach(Predicate p in a.Observe.GetAllPredicates())
                    m_lObservable.Add(p.Name);
            }
        }


        public void AddConstant(Constant c)
        {
            Constants.Add(c);
        }
        public void AddPredicate(Predicate p)
        {
            Predicates.Add(p);
            m_lAlwaysKnown.Add(p.Name);
            m_lAlwaysConstant.Add(p.Name);
        }
        public override string ToString()
        {
            string s = "(domain " + Name + "\n";
            s += "(constants " + Parser.ListToString(Constants) + ")\n";
            s += "(predicates " + Parser.ListToString(Predicates) + ")\n";
            s += "(actions " + Parser.ListToString(Actions) + ")\n";
            s += ")";
            return s;
        }

        //not really checking everything - need to check compatible parameters, constants and so forth
        public bool ContainsPredicate(string sName)
        {
            foreach (Predicate p in Predicates)
                if (p.Name == sName)
                    return true;
            return false;
        }

        public Constant GetConstant(string sName)
        {
            foreach(Constant c in Constants)
                if(c.Name == sName)
                    return c;
            return null;
        }

 
       private void WriteFunctions(StreamWriter sw)
        {
            if (Functions.Count > 0)
            {
                sw.Write("(:functions");
                foreach (string sFunction in Functions)
                    sw.Write(" " + sFunction);
                sw.WriteLine(")");

            }
        }
        

        private bool Observable(ParametrizedPredicate pp)
        {
            foreach (Action a in Actions)
            {
                if (a.Observe != null)
                {
                    HashSet<Predicate> lObservables = a.Observe.GetAllPredicates();
                    foreach(Predicate p in lObservables)
                    {
                        if (p.Name == pp.Name)
                            return true;
                    }

                }
            }
            return false;
        }


        private void WriteTypes(StreamWriter sw, bool bUseTags)
        {
            sw.Write("(:types");
            foreach (string sType in Types)
                sw.Write(" " + sType);
            if (bUseTags)
            {
                sw.Write(" " + TAG);
                sw.Write(" " + VALUE);
            }
            /*
            if (m_bUseOptions && HasNonDeterministicActions())
            {
                sw.Write(" " + OPTION);
            }
             * */
            sw.WriteLine(")");
        }

        public bool HasNonDeterministicActions()
        {
            foreach (Action a in Actions)
            {
                if (a.ContainsNonDeterministicEffect)
                    return true;
            }
            return false;
        }

        public int MaxNonDeterministicEffects()
        {
            int cMaxOptions = 0;
            foreach (Action a in Actions)
            {
                if (a.ContainsNonDeterministicEffect)
                {
                    if (a.Effects.GetMaxNonDeterministicOptions() > cMaxOptions)
                        cMaxOptions = a.Effects.GetMaxNonDeterministicOptions();
                }
            }
            return cMaxOptions;
        }


        private Dictionary<string, string> m_dConstantNameToType;
        public Dictionary<string, string> ConstantNameToType {
            get
            {
                if (m_dConstantNameToType == null)
                {
                    m_dConstantNameToType = new Dictionary<string, string>();
                    foreach (Constant c in Constants)
                    {
                        m_dConstantNameToType[c.Name] = c.Type;
                    }
                }
                return m_dConstantNameToType;
            }
        }

        public bool AlwaysKnown(Predicate p)
        {
            return m_lAlwaysKnown.Contains(p.Name);
        }

        public bool Observable(Predicate p)
        {
            return m_lObservable.Contains(p.Name);
        }

        public bool AlwaysConstant(Predicate p)
        {
            return m_lAlwaysConstant.Contains(p.Name);
        }

        public void AddHidden(CompoundFormula cf)
        {
            HashSet<Predicate> lUnknown = new HashSet<Predicate>();
            cf.GetAllPredicates(lUnknown);
            foreach (Predicate p in lUnknown)
                m_lAlwaysKnown.Remove(p.Name);
        }

        public void ComputeAlwaysKnown()
        {
            bool bChanged = true;
            while (bChanged)
            {
                bChanged = false;
                foreach (Action a in Actions)
                {
                    if (a.HasConditionalEffects)
                    {
                        foreach (CompoundFormula cfCondition in a.GetConditions())
                        {
                            HashSet<Predicate> lIfPredicates = new HashSet<Predicate>();
                            cfCondition.Operands[0].GetAllPredicates(lIfPredicates);
                            bool bAllKnown = true;
                            foreach (Predicate p in lIfPredicates)
                            {
                                if (!m_lAlwaysKnown.Contains(p.Name))
                                    bAllKnown = false;
                            }
                            if (!bAllKnown)
                            {
                                HashSet<Predicate> lThenPredicates = new HashSet<Predicate>();
                                cfCondition.Operands[1].GetAllPredicates(lThenPredicates);
                                foreach (Predicate p in lThenPredicates)
                                {
                                    if (m_lAlwaysKnown.Contains(p.Name))
                                    {
                                        bChanged = true;
                                        m_lAlwaysKnown.Remove(p.Name);
                                    }
                                }
                            }
                        }
                    }
                    if (a.Observe != null)
                    {
                        HashSet<Predicate> lPredicates = a.Observe.GetAllPredicates();
                        foreach (Predicate p in lPredicates)
                        {
                            if (m_lAlwaysKnown.Contains(p.Name))
                            {
                                m_lAlwaysKnown.Remove(p.Name);
                            }
                        }
                    }
                }
            }
        }


        public void AddFunction(string sFunctionName)
        {
            Functions.Add(sFunctionName);
        }

        public bool IsFunctionExpression(string s)
        {
            s = s.ToLower();
            return s == "increase" || s == "decrease" || s == "=";
        }

        public bool CompareTo(Domain d)
        {
            foreach (Action a in Actions)
            {
                bool bFound = false;
                foreach (Action aOther in d.Actions)
                {
                    if (a.Name == aOther.Name)
                    {
                        bFound = true;
                        if (!a.CompareTo(aOther))
                            return false;
                        break;
                    }
                }
                if (!bFound)
                    return false;
            }
            return true;
        }

        static bool CompareDomains(string sDomain1, string sDomain2)
        {
            Parser p = new Parser();
            Domain d1 = p.ParseDomain(sDomain1);
            Domain d2 = p.ParseDomain(sDomain2);
            return d1.CompareTo(d2);
        }

        public void RemoveUniversalQuantifiers(List<Predicate> lConstantPredicates)
        {
            List<Action> lFiltered = new List<Action>();
            foreach (Action a in Actions)
            {
                Action aFiltered = a.RemoveUniversalQuantifiers(Constants, lConstantPredicates, this);
                if (aFiltered != null)
                    lFiltered.Add(aFiltered);
                //a.SimplifyConditions();
            }
            Actions = lFiltered;
        }
















        private void WriteKnowledgeAction(StreamWriter sw, Action a)
        {
            Action aK = a.Clone();
            CompoundFormula cfPrecondition = new CompoundFormula("and");
            if (a.Preconditions != null)
                cfPrecondition.AddOperand(aK.Preconditions.GetKnowledgeFormula(m_lAlwaysKnown, false));

            aK.Preconditions = cfPrecondition;

            CompoundFormula cfAnd = new CompoundFormula("and");
            if (a.Effects != null)
            {
                cfAnd.AddOperand(aK.Effects.GetKnowledgeFormula(m_lAlwaysKnown, false));

            }

            if(a.Observe != null)
            {
                Predicate pObserve = ((PredicateFormula)a.Observe).Predicate;
                KnowPredicate kp = new KnowPredicate(pObserve);
                KnowPredicate knp = new KnowPredicate(pObserve.Negate());

                cfPrecondition.AddOperand(kp.Negate());
                cfPrecondition.AddOperand(knp.Negate());

                CompoundFormula cfOneoff = new CompoundFormula("oneof");
                cfOneoff.SimpleAddOperand(kp);
                cfOneoff.SimpleAddOperand(knp);
                cfAnd.AddOperand(cfOneoff);
                aK.Observe = null;
            }
            aK.Effects = cfAnd.Simplify();

            sw.WriteLine(aK);
        }


        private void WriteKnowledgePredicates(StreamWriter sw)
        {
            sw.WriteLine("(:predicates");
            foreach (ParametrizedPredicate pp in Predicates)
            {
                if (AlwaysKnown(pp))
                {
                    sw.Write("(" + pp.Name);//write regular predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                }
                else
                {
                    sw.Write("(K" + pp.Name);//write know predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                    sw.Write("(KN" + pp.Name);//write know not predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                }
            }
            sw.WriteLine(")");
        }


        private void WriteConstants(StreamWriter sw)
        {
            sw.WriteLine("(:constants");
            foreach (Constant c in Constants)
                sw.WriteLine(" " + c.FullString());
            sw.WriteLine(")");
        }


        private void WriteKnowledgeActions(StreamWriter sw)
        {
            foreach (Action a in Actions)
            {
                WriteKnowledgeAction(sw, a);
            }
        }

        public void WriteKnowledgeDomain(Problem p, string sFileName)
        {
            StreamWriter sw = new StreamWriter(sFileName);

            sw.WriteLine("(define (domain K" + Name + ")");
            sw.WriteLine("(:requirements :strips :typing)");
            WriteTypes(sw, false);
            WriteConstants(sw);
            sw.WriteLine();
            WriteKnowledgePredicates(sw);
            sw.WriteLine();
            WriteKnowledgeActions(sw);
            p.WriteReasoningActions(sw);
            //p.WriteReasoningAxioms(sw);
            sw.WriteLine(")");

            sw.Close();
        }

    }
}
