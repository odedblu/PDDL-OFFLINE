﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace CPOR_MA
{
    public class Domain
    {
        public string Name { get; protected set; }
        public List<string> Types { get; private set; }
        public List<Action> Actions { get; set; }
        public List<Constant> Constants { get; protected set; }
        public List<Predicate> Predicates { get; protected set; }
        public List<Predicate> Observables { get; protected set; }
        public List<string> Functions { get; protected set; }
        public List<string> m_lAlwaysKnown { get; protected set; }
        private List<string> m_lAlwaysConstant;
        private List<string> m_lObservable;
        public List<Constant> Agents;

        public string Path { get; private set; }
        public bool IsSimple { get; private set; }

        public bool m_bUseOptions = true;
        public bool m_bReplaceNonDeterministicEffectsWithOptions = true;
        public bool UseCosts { get; private set; }

        public const string LEVEL_DONE_PREDICATE = "level-done";
        public const string OPTION = "OPTION_TYPE";
        public const string OPTION_PREDICATE = "option";
        public const string VALUE = "VALUE_TYPE";
        public const string VALUE_PARAMETER = "?V_PARAM";
        public const string TAG = "TAG_TYPE";
        public const string TAG_PARAMETER = "?TAG_PARAM";
        public const string TRUE_VALUE = "V_TRUE";
        public const string FALSE_VALUE = "V_FALSE";
        public const string TRUE_PREDICATE_NAME = "P_TRUE";
        public const string FALSE_PREDICATE_NAME = "P_FALSE";
        public const string FUNCTION = "FUNCTION_TYPE";
        public const string AGENT = "AGENT";
        public const string AGENT_PARAMETER = "?AGENT_PARAM";
        public const string GOAL_PREDICATE = "goal";
        public const string TAG_CONSTRAINT_PREDICATE = "TagConstrained";
        public const string ACTION_CONSTRAINT_PREDICATE = "Constraint";


        public const int TIME_STEPS = 0;
        public const int MAX_OPTIONS = 2;

        public static GroundedPredicate TRUE_PREDICATE = new GroundedPredicate(TRUE_PREDICATE_NAME);
        public static GroundedPredicate FALSE_PREDICATE = new GroundedPredicate(FALSE_PREDICATE_NAME);

        public bool RemoveConflictingConditionalEffects = false;
        private Dictionary<Predicate, Predicate> m_dAuxilaryPredicates;

        public bool ContainsNonDeterministicActions { get; private set; }

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
            ContainsNonDeterministicActions = false;
            if (SDRPlanner.MultiAgent)
                Agents = new List<Constant>();

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
                foreach (Predicate p in a.Observe.GetAllPredicates())
                    m_lObservable.Add(p.Name);
            }
            if (a.ContainsNonDeterministicEffect)
                ContainsNonDeterministicActions = true;
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

        // Rewriting domain for a specified agent
        public string SAToString(Constant agt)
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
            foreach (Constant c in Constants)
                if (c.Name == sName)
                    return c;
            return null;
        }


        MemoryStream m_sCachedDomain = null;

        public MemoryStream WriteKnowledgeDomain(Problem p, int ciMishapCount, int cMinMishapCount, bool bMishapType, bool bRequireP)
        {
            if (m_sCachedDomain == null)
            {
                StreamWriter sw = null;
                MemoryStream ms = new MemoryStream(1000);
                sw = new StreamWriter(ms);

                sw.WriteLine("(define (domain K" + Name + ")");
                sw.WriteLine("(:requirements :strips :typing)");
                sw.WriteLine(";;" + SDRPlanner.Translation);
                WriteTypes(sw, false);
                WriteConstants(sw, cMinMishapCount, ciMishapCount);
                sw.WriteLine();
                WriteKnowledgePredicates(sw, cMinMishapCount, ciMishapCount, bRequireP);
                sw.WriteLine();
                WriteKnowledgeActions(sw, cMinMishapCount, ciMishapCount, bMishapType, bRequireP);
                p.WriteReasoningActions(sw, bRequireP);
                //p.WriteReasoningAxioms(sw);
                sw.WriteLine(")");

                sw.Flush();
                m_sCachedDomain = ms;
            }
            return m_sCachedDomain;
        }


        //know whether - no s_0
        public MemoryStream WriteTaggedDomainNoState(Dictionary<string, List<Predicate>> dTags, Problem pCurrent)
        {
            if (HasNonDeterministicActions() && m_bUseOptions)
            {
                Domain dDeterministic = RemoveNonDeterministicEffects();
                return dDeterministic.WriteTaggedDomainNoState(dTags, pCurrent);
            }


            StreamWriter sw = null;
            MemoryStream sm = new MemoryStream(1000);
            sw = new StreamWriter(sm);

            sw.WriteLine("(define (domain K" + Name + ")");



            sw.WriteLine("(:requirements :strips :typing)");

            WriteFunctions(sw);
            WriteTypes(sw, true);
            WriteConstants(sw, dTags);
            sw.WriteLine();
            if (SDRPlanner.SplitConditionalEffects)
            {
                List<Predicate> lAdditionalPredicates = new List<Predicate>();
                List<Action> lAllActions = GetKnowledgeActionsNoState(sw, dTags, lAdditionalPredicates);
                WriteTaggedPredicatesNoState(sw, lAdditionalPredicates);
                foreach (Action aKnowWhether in lAllActions)
                    WriteConditionalAction(sw, aKnowWhether);
                sw.WriteLine();

                //WriteReasoningActionsNoState(sw, dTags, pCurrent);
            }
            else
            {
                WriteTaggedPredicatesNoState(sw, null);
                sw.WriteLine();
                WriteKnowledgeActionsNoState(sw, dTags);
                //WriteReasoningActionsNoState(sw, dTags, pCurrent);
            }


            sw.WriteLine(")");
            sw.Flush();



            return sm;
        }

        public MemoryStream WriteTaggedDomain(Dictionary<string, List<Predicate>> dTags, Problem pCurrent)
        {
            if (HasNonDeterministicActions() && m_bUseOptions)
            {
                Domain dDeterministic = RemoveNonDeterministicEffects();

                return dDeterministic.WriteTaggedDomain(dTags, pCurrent); ;
            }


            StreamWriter sw = null;
            MemoryStream strStream = new MemoryStream(1000);

            //sw = new StreamWriter(sFileName);
            sw = new StreamWriter(strStream);

            sw.WriteLine("(define (domain K" + Name + ")");


            sw.WriteLine("(:requirements :strips :typing)");

            WriteFunctions(sw);
            WriteTypes(sw, true);
            WriteConstants(sw, dTags);
            sw.WriteLine();


            if (SDRPlanner.SplitConditionalEffects)
            {
                List<Predicate> lAdditionalPredicates = new List<Predicate>();
                List<Action> lAllActions = GetKnowledgeActions(sw, dTags, lAdditionalPredicates);
                WriteTaggedPredicates(sw, lAdditionalPredicates);
                foreach (Action aKnowWhether in lAllActions)
                    WriteConditionalAction(sw, aKnowWhether);
                sw.WriteLine();

                WriteReasoningActions(sw, dTags, pCurrent);
            }
            else
            {
                WriteTaggedPredicates(sw, null);
                sw.WriteLine();
                WriteKnowledgeActions(sw, dTags);
                WriteReasoningActions(sw, dTags, pCurrent);
            }




            if (RemoveConflictingConditionalEffects)
                WriteAxiomsActions(sw, dTags);

            sw.WriteLine(")");
            sw.Flush();
            //sw.Close();//shouldn't close the mem stream

            return strStream;
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

        private Domain RemoveNonDeterministicEffects()
        {
            Domain dDeterministic = new Domain(Name, Path);
            dDeterministic.Predicates = new List<Predicate>(Predicates);
            dDeterministic.Constants = new List<Constant>(Constants);
            dDeterministic.Types = new List<string>(Types);
            dDeterministic.Actions = new List<Action>();
            dDeterministic.m_lAlwaysKnown = m_lAlwaysKnown;
            dDeterministic.m_lAlwaysConstant = m_lAlwaysConstant;
            dDeterministic.m_dConstantNameToType = m_dConstantNameToType;
            dDeterministic.Functions = Functions;

            dDeterministic.Types.Add(Domain.OPTION);
            dDeterministic.m_lAlwaysConstant.Add(Domain.OPTION_PREDICATE);
            //dDeterministic.m_lAlwaysKnown.Add(Domain.OPTION_PREDICATE);

            ParametrizedPredicate ppOption = new ParametrizedPredicate(Domain.OPTION_PREDICATE);
            ppOption.AddParameter(new Parameter(OPTION, "?o"));
            dDeterministic.Predicates.Add(ppOption);

            int cOptions = Math.Max(MaxNonDeterministicEffects(), MAX_OPTIONS);
            for (int iOption = 0; iOption < cOptions; iOption++)
            {
                dDeterministic.Constants.Add(new Constant(OPTION, "opt" + iOption));
            }

            if (SDRPlanner.AllowChoosingNonDeterministicOptions)
            {
                Action aChoose = new Action("AdvanceOptions");
                CompoundFormula cfEffects = new CompoundFormula("and");
                for (int iOption = 0; iOption < MAX_OPTIONS; iOption++)
                {
                    GroundedPredicate gpCurrentOption = new GroundedPredicate(Domain.OPTION_PREDICATE);
                    gpCurrentOption.AddConstant(new Constant(Domain.OPTION, "opt" + iOption));
                    GroundedPredicate gpNextOption = new GroundedPredicate(Domain.OPTION_PREDICATE);
                    gpNextOption.AddConstant(new Constant(Domain.OPTION, "opt" + (iOption + 1) % MAX_OPTIONS));
                    CompoundFormula cfWhen = new CompoundFormula("when");
                    cfWhen.AddOperand(gpCurrentOption);
                    CompoundFormula cfAnd = new CompoundFormula("and");
                    cfAnd.AddOperand(gpCurrentOption.Negate());
                    cfAnd.AddOperand(gpNextOption);
                    cfWhen.AddOperand(cfAnd);
                    cfEffects.AddOperand(cfWhen);
                }

                aChoose.Effects = cfEffects;
                dDeterministic.AddAction(aChoose);
            }

            foreach (Action a in Actions)
            {
                if (a.ContainsNonDeterministicEffect)
                {
                    Action aDeterministic = a.ReplaceNonDeterministicEffectsWithOptions(m_lAlwaysKnown, MAX_OPTIONS);
                    dDeterministic.Actions.Add(aDeterministic);
                }
                else
                {
                    dDeterministic.Actions.Add(a);
                }
            }

            return dDeterministic;
        }

        private string GeneratePredicateAxiom(GroundedPredicate gp, string sPrefix, string sAdditionalConstants)
        {
            string sGiven = "(Not-" + sPrefix + gp.Name;
            foreach (Constant p in gp.Constants)
                sGiven += " " + p.Name;
            sGiven += sAdditionalConstants;
            sGiven += ")";
            string sEffect = "(and (not " + sGiven + ")";
            sEffect += " (not ";
            sEffect += "(" + sPrefix + gp.Name;
            foreach (Constant p in gp.Constants)
                sEffect += " " + p.Name;
            sEffect += sAdditionalConstants;
            sEffect += ")))";
            string s = "(when " + sGiven + " " + sEffect + ")";
            return s;
        }

        private void WriteAxiomsAction(StreamWriter sw, Dictionary<string, List<Predicate>> dTags)
        {
            sw.WriteLine("(:action apply-axioms");
            sw.WriteLine("\t:precondition (not (axioms-applied))\n");
            sw.WriteLine("\t:effect (and (axioms-applied)\n");

            HashSet<GroundedPredicate> lGrounded = GroundAllPredicates();
            foreach (GroundedPredicate pp in lGrounded)
            {
                sw.WriteLine("\t\t" + GeneratePredicateAxiom(pp, "", ""));

                if (!AlwaysKnown(pp))
                {
                    sw.WriteLine("\t\t" + GeneratePredicateAxiom(pp, "K", " " + TRUE_VALUE));
                    sw.WriteLine("\t\t" + GeneratePredicateAxiom(pp, "K", " " + FALSE_VALUE));

                    foreach (string sTag in dTags.Keys)
                    {
                        sw.WriteLine("\t\t" + GeneratePredicateAxiom(pp, "KGiven", " " + sTag + " " + TRUE_VALUE));
                        sw.WriteLine("\t\t" + GeneratePredicateAxiom(pp, "KGiven", " " + sTag + " " + FALSE_VALUE));

                    }
                }
            }
            sw.WriteLine("))");
        }


        private void WriteAxiomsActions(StreamWriter sw, Dictionary<string, List<Predicate>> dTags)
        {

            HashSet<GroundedPredicate> lGrounded = GroundAllPredicates();
            foreach (GroundedPredicate gp in lGrounded)
            {
                sw.WriteLine("(:action apply-axioms-" + gp.Name);
                sw.WriteLine("\t:precondition (not (axioms-applied))");
                sw.WriteLine("\t:effect (and ");

                sw.Write("(axioms-applied-" + gp.Name);
                foreach (Constant c in gp.Constants)
                    sw.Write("-" + c.Name);
                sw.WriteLine(")");


                sw.WriteLine("\t\t" + GeneratePredicateAxiom(gp, "", ""));

                if (!AlwaysKnown(gp))
                {
                    sw.WriteLine("\t\t" + GeneratePredicateAxiom(gp, "K", " " + TRUE_VALUE));
                    sw.WriteLine("\t\t" + GeneratePredicateAxiom(gp, "K", " " + FALSE_VALUE));

                    foreach (string sTag in dTags.Keys)
                    {
                        sw.WriteLine("\t\t" + GeneratePredicateAxiom(gp, "KGiven", " " + sTag + " " + TRUE_VALUE));
                        sw.WriteLine("\t\t" + GeneratePredicateAxiom(gp, "KGiven", " " + sTag + " " + FALSE_VALUE));

                    }
                }
                sw.WriteLine("))");
            }
            sw.WriteLine("(:action apply-axioms");
            sw.WriteLine("\t:precondition (and (not (axioms-applied))");
            foreach (GroundedPredicate gp in lGrounded)
            {
                sw.Write("\t\t(axioms-applied-" + gp.Name);
                foreach (Constant c in gp.Constants)
                    sw.Write("-" + c.Name);
                sw.WriteLine(")");
            }
            sw.WriteLine(")");
            sw.WriteLine("\t:effect (and (axioms-applied)");
            foreach (GroundedPredicate gp in lGrounded)
            {
                sw.Write("\t\t(not (axioms-applied-" + gp.Name);
                foreach (Constant c in gp.Constants)
                    sw.Write("-" + c.Name);
                sw.WriteLine("))");
            }
            sw.WriteLine("))");

        }


        private void WriteKnowledgePreconditions(StreamWriter sw, Action pa)
        {
            HashSet<Predicate> lPredicates = new HashSet<Predicate>();
            pa.Preconditions.GetAllPredicates(lPredicates);
            CompoundFormula cfAnd = new CompoundFormula("and");

            foreach (Predicate p in lPredicates)
            {
                if (AlwaysKnown(p))
                {
                    cfAnd.AddOperand(p);
                }
                else
                {
                    cfAnd.AddOperand(new KnowPredicate(p));
                }
            }
            sw.WriteLine(":precondition " + cfAnd);

            /*
            sw.Write(":precondition (and");
            foreach (Formula f in cfAnd.Operands)
                sw.Write(" " + f.ToString());
            foreach (Predicate p in lPredicates)
            {
                if (lKnow == null || lKnow.Contains(p))
                {
                    WriteKnowledgePredicate(sw, p);
                }
            }
            
            sw.WriteLine(")");
             * */

        }

        public void WriteKnowledgePredicate(StreamWriter sw, Predicate p)
        {
            if (!AlwaysKnown(p))
                sw.Write(new KnowPredicate(p).ToString());
        }
        private void WriteKnowledgeEffects(StreamWriter sw, Action pa, List<Predicate> lKnow)
        {
            HashSet<Predicate> lPredicates = new HashSet<Predicate>();
            if (pa.Effects != null)
                pa.Effects.GetAllPredicates(lPredicates);
            if (pa.Observe != null)
                pa.Observe.GetAllPredicates(lPredicates);
            CompoundFormula cfAnd = (CompoundFormula)pa.Effects;
            if (cfAnd != null && cfAnd.Operator != "and")
                throw new NotImplementedException();
            sw.Write(":effect (and");
            if (cfAnd != null)
            {
                foreach (Formula f in cfAnd.Operands)
                    sw.Write(" " + f.ToString());
            }
            foreach (Predicate p in lPredicates)
            {
                if (lKnow == null || lKnow.Contains(p))
                {
                    WriteKnowledgePredicate(sw, p);
                }
            }
            sw.WriteLine(")");
        }

        private void WriteKnowledgeAction(StreamWriter sw, Action a, int cMinMishaps, int cMishaps, bool bMishapType, bool bRequireP)
        {
            Action aK = a.Clone();

            if (a.Preconditions != null)
                aK.Preconditions = aK.Preconditions.GetKnowledgeFormula(m_lAlwaysKnown, false);

            if (a.Effects != null)
            {
                CompoundFormula cfAnd = new CompoundFormula("and");
                cfAnd.AddOperand(aK.Effects.GetKnowledgeFormula(m_lAlwaysKnown, false));
                //if (a.NonDeterministicEffects.Count > 0)
                //    throw new NotImplementedException();

                foreach (Predicate p in a.NonDeterministicEffects)
                {
                    Predicate pKnow = new KnowPredicate(p);
                    cfAnd.AddOperand(pKnow.Negate());
                }
                aK.Effects = cfAnd.Simplify();
            }

            if (a.Observe == null || SDRPlanner.Translation == SDRPlanner.Translations.Conformant)
            {
                if (a.Effects != null)
                {
                    a.Observe = null;
                    sw.WriteLine(aK);
                }
            }
            else
            {
                if (aK.Effects == null)
                    aK.Effects = new CompoundFormula("and");
                aK.Observe = null;
                Predicate pObserve = ((PredicateFormula)a.Observe).Predicate;
                KnowPredicate kp = new KnowPredicate(pObserve);
                KnowPredicate knp = new KnowPredicate(pObserve.Negate());

                CompoundFormula cfPreconditions = new CompoundFormula("and");
                cfPreconditions.AddOperand(kp.Negate());
                cfPreconditions.AddOperand(knp.Negate());
                cfPreconditions.AddOperand(aK.Preconditions);
                aK.Preconditions = cfPreconditions.Simplify();

                //Predicate gpNotK = pObserve.Clone();
                //gpNotK.Name = "NotK" + gpNotK.Name;

                Action aKT = aK.Clone();
                aKT.Name += "T";
                CompoundFormula cfAnd = new CompoundFormula("and");
                cfAnd.AddOperand(aKT.Preconditions);
                if (bRequireP)
                    cfAnd.AddOperand(pObserve);
                //cfAnd.AddOperand(gpNotK);
                //cfAnd.AddOperand(kp.Negate());
                //cfAnd.AddOperand(knp.Negate());
                aKT.Preconditions = cfAnd;
                ( (CompoundFormula) aKT.Effects ).AddOperand(kp);
                //((CompoundFormula)aKT.Effects).AddOperand(gpNotK.Negate());

                if (cMinMishaps > cMishaps && bMishapType)
                {
                    //AddMishapIncrease(aKT, cMinMishaps);
                    List<Action> lActions = AddMishapIncreaseNonConditional(aKT, cMinMishaps);
                    foreach (Action aMishap in lActions)
                        sw.WriteLine(aMishap);
                }
                else
                {
                    sw.WriteLine(aKT);
                }


                Action aKF = aK.Clone();
                aKF.Name += "F";
                cfAnd = new CompoundFormula("and");
                cfAnd.AddOperand(aKF.Preconditions);
                if (bRequireP)
                    cfAnd.AddOperand(pObserve.Negate());
                //cfAnd.AddOperand(kp.Negate());
                //cfAnd.AddOperand(knp.Negate());
                //cfAnd.AddOperand(gpNotK);

                aKF.Preconditions = cfAnd;
                ((CompoundFormula)aKF.Effects).AddOperand(knp);
                //((CompoundFormula)aKF.Effects).AddOperand(gpNotK.Negate());

                if (cMinMishaps > cMishaps && !bMishapType)
                {
                    //AddMishapIncrease(aKT, cMinMishaps);
                    List<Action> lActions = AddMishapIncreaseNonConditional(aKF, cMinMishaps);
                    foreach (Action aMishap in lActions)
                        sw.WriteLine(aMishap);
                }
                else
                {
                    sw.WriteLine(aKF);
                }


            }


        }

        private void AddMishapIncrease(Action a, int cMishaps)
        {
            CompoundFormula cfAnd = new CompoundFormula("and");
            cfAnd.AddOperand(a.Effects);
            for (int i = 0; i < cMishaps; i++)
            {
                CompoundFormula cfWhen = new CompoundFormula("when");
                GroundedPredicate gpBefore = new GroundedPredicate("MishapCount");
                gpBefore.AddConstant(new Constant("mishaps", "m" + i));
                GroundedPredicate gpAfter = new GroundedPredicate("MishapCount");
                gpAfter.AddConstant(new Constant("mishaps", "m" + (i + 1)));
                cfWhen.AddOperand(gpBefore);
                cfWhen.AddOperand(gpAfter);
                cfAnd.AddOperand(cfWhen);
            }
            a.Effects = cfAnd.Simplify();
        }

        private List<Action> AddMishapIncreaseNonConditional(Action a, int cMishaps)
        {
            List<Action> lActions = new List<Action>();
            for (int i = 0; i < cMishaps; i++)
            {
                Action aMishap = a.Clone();
                aMishap.Name += i;
                CompoundFormula cfPre = new CompoundFormula("and");
                cfPre.AddOperand(a.Preconditions);
                CompoundFormula cfEffects = new CompoundFormula("and");
                cfEffects.AddOperand(a.Effects);
                GroundedPredicate gpBefore = new GroundedPredicate("MishapCount");
                gpBefore.AddConstant(new Constant("mishaps", "m" + i));
                cfPre.AddOperand(gpBefore);
                GroundedPredicate gpAfter = new GroundedPredicate("MishapCount");
                gpAfter.AddConstant(new Constant("mishaps", "m" + (i + 1)));
                cfEffects.AddOperand(gpAfter);

                aMishap.Preconditions = cfPre.Simplify();
                aMishap.Effects = cfEffects.Simplify();
                lActions.Add(aMishap);
            }
            return lActions;
        }

        private void WriteAction(StreamWriter sw, Action a)
        {
            if (RemoveConflictingConditionalEffects)
                RemoveConflictingConditionalEffectsFromAction(a);

            sw.WriteLine("(:action " + a.Name);
            if (a is ParametrizedAction)
            {
                ParametrizedAction pa = (ParametrizedAction)a;
                sw.Write(":parameters (");
                foreach (Parameter p in pa.Parameters)
                    sw.Write(" " + p.FullString());
                sw.WriteLine(")");
            }
            if (a.Preconditions != null)
                sw.WriteLine(":precondition " + a.Preconditions);
            sw.WriteLine(":effect " + a.Effects);

            sw.WriteLine(")");
            sw.WriteLine();
        }

        private void WriteSensor(StreamWriter sw, Action a)
        {
            Debug.Assert(a.Observe != null && a.Effects == null);
            sw.WriteLine("(:sensor " + a.Name);
            if (a is ParametrizedAction)
            {
                ParametrizedAction pa = (ParametrizedAction)a;
                sw.Write(":parameters (");
                foreach (Parameter p in pa.Parameters)
                    sw.Write(" " + p.FullString());
                sw.WriteLine(")");
            }
            if (a.Preconditions != null)
                sw.WriteLine(":condition " + a.Preconditions);
            sw.WriteLine(":sensed " + a.Observe);

            sw.WriteLine(")");
            sw.WriteLine();
        }

        public List<Action> GetAllKnowledgeActions(Dictionary<string, List<Predicate>> dTags)
        {
            List<Action> lActions = new List<Action>();
            foreach (Action a in Actions)
            {
                if (a.Effects == null & a.Observe != null)
                {
                    Action aObserveTrue = a.NonConditionalObservationTranslation(dTags, m_lAlwaysKnown, this, true);
                    lActions.Add(aObserveTrue);
                    Action aObserveFalse = a.NonConditionalObservationTranslation(dTags, m_lAlwaysKnown, this, false);
                    lActions.Add(aObserveFalse);
                }

                else
                {
                    Action aKnowledge = a.AddTaggedConditions(dTags, m_lAlwaysKnown);
                    lActions.Add(aKnowledge);
                }
            }
            return lActions;
        }
        /*
        public List<Action> GetAllReasoningActions(Dictionary<string, List<Predicate>> dTags)
        {
            List<Action> lActions = new List<Action>();
            //get merges and tag refutation
            foreach (ParametrizedPredicate pp in Predicates)
            {
                if (!AlwaysKnown(pp))
                {
                    Action aMerge = GenerateMergeAction(pp, dTags);
                    lActions.Add(aMerge);
                    Action aRefute = GenerateRefutationAction(pp, true);
                    lActions.Add(aRefute);
                    aRefute = GenerateRefutationAction(pp, false);
                    lActions.Add(aRefute);
                }
            }
            return lActions;
        }
        */
        private List<Action> GetKnowledgeActionsNoState(StreamWriter sw, Dictionary<string, List<Predicate>> dTags, List<Predicate> lAdditionalPredicates)
        {
            List<Action> lAllActions = new List<Action>();
            lAdditionalPredicates.Add(new GroundedPredicate("NotInAction"));

            foreach (Action a in Actions)
            {
                if (a.Effects == null && a.Observe != null)
                {
                    List<Action> lKnowWhether = a.TagObservationTranslationNoState(dTags, this);
                    lAllActions.AddRange(lKnowWhether);
                }
                else
                {
                    List<Action> lKnowWhether = a.TagCompilationNoState(dTags, this, lAdditionalPredicates);
                    lAllActions.AddRange(lKnowWhether);
                }
            }
            return lAllActions;
        }



        private List<Action> GetKnowledgeActions(StreamWriter sw, Dictionary<string, List<Predicate>> dTags, List<Predicate> lAdditionalPredicates)
        {
            List<Action> lAllActions = new List<Action>();
            lAdditionalPredicates.Add(new GroundedPredicate("NotInAction"));

            foreach (Action a in Actions)
            {
                if (a.Effects == null && a.Observe != null)
                {
                    Action aObserveTrue = a.NonConditionalObservationTranslation(dTags, m_lAlwaysKnown, this, true);
                    Action aObserveFalse = a.NonConditionalObservationTranslation(dTags, m_lAlwaysKnown, this, false);
                    lAllActions.Add(aObserveTrue);
                    lAllActions.Add(aObserveFalse);
                }
                else
                {
                    List<Action> lCompiled = a.KnowCompilationSplitConditions(dTags, m_lAlwaysKnown, lAdditionalPredicates);
                    lAllActions.AddRange(lCompiled);
                }
            }
            return lAllActions;
        }



        private void WriteKnowledgeActionsNoState(StreamWriter sw, Dictionary<string, List<Predicate>> dTags)
        {
            int cTranslatedActions = 0;
            foreach (Action a in Actions)
            {
                if (a.Effects == null && a.Observe != null)
                {
                    List<Action> lCompiled = a.TagObservationTranslationNoState(dTags, this);
                    foreach (Action aKnowWhether in lCompiled)
                        WriteConditionalAction(sw, aKnowWhether);
                }
                else
                {
                    List<Action> lCompiled = a.TagCompilationNoState(dTags, this, null);
                    foreach (Action aCompiled in lCompiled)
                    {
                        //Debug.Write("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b" + "Writing action " + aCompiled.Name + " : " + cTranslatedActions);
                        cTranslatedActions++;
                        WriteConditionalAction(sw, aCompiled);
                    }
                    //Debug.WriteLine("");
                }
            }
        }


        /*
                private void WriteKnowledgeActionsNoState(StreamWriter sw, Dictionary<string, List<Predicate>> dTags)
                {
                    int  cTranslatedActions = 0;
                    int cMaxTranslatedConditionalEffects = 0, cMaxOriginalConditionalEffects = 0;
                    foreach (Action a in Actions)
                    {
                        //if (a.GetConditions().Count > cMaxOriginalConditionalEffects)
                        //    cMaxOriginalConditionalEffects = a.GetConditions().Count;


                        if (a.Effects == null && a.Observe != null)
                        {
                            //Action aKnow = a.KnowObservationTranslation();
                            //WriteConditionalAction(sw, aKnow);
                            BUGBUG;
                            List<Action> lKnowWhether = a.KnowWhetherTagObservationTranslation(dTags, this);
                            foreach (Action aKnowWhether in lKnowWhether)
                                WriteConditionalAction(sw, aKnowWhether);
                        }
                        else
                        {
                            //Action aKnow = a.KnowCompilation(dTags, this);
                            //WriteConditionalAction(sw, aKnow);
                            List<Action> lKnowWhether = a.KnowWhetherTagCompilation(dTags, this);
                            foreach (Action aKnowWhether in lKnowWhether)
                            {
                                cTranslatedActions++;
                                //if (aKnowWhether.GetConditions().Count > cMaxTranslatedConditionalEffects)
                                //    cMaxTranslatedConditionalEffects = aKnowWhether.GetConditions().Count;
                                WriteConditionalAction(sw, aKnowWhether);
                            }
                        }
                    }
                    //Debug.WriteLine("Original: #Actions " + Actions.Count + ", Max conditions " + cMaxOriginalConditionalEffects);
                    //Debug.WriteLine("Translated: #Actions " + cTranslatedActions + ", Max conditions " + cMaxTranslatedConditionalEffects);
                }
        */

        private void WriteKnowledgeActions(StreamWriter sw, Dictionary<string, List<Predicate>> dTags)
        {
            foreach (Action a in Actions)
            {
                //if (a.Name == "act-91g_observe-box_a1_p1-1_b0")
                //    Console.Write("*");
                if (a.ContainsNonDeterministicEffect)
                {
                    if (m_bReplaceNonDeterministicEffectsWithOptions)
                    {
                        Action aDeterministic = a.ReplaceNonDeterministicEffectsWithOptions(m_lAlwaysKnown);
                        Action aKnowledge = aDeterministic.AddTaggedConditions(dTags, m_lAlwaysKnown);
                        WriteConditionalAction(sw, aKnowledge);
                    }
                    else
                    {
                        List<Action> lKnowledgeActions = a.AddTaggedNonDeterministicConditions(dTags, m_lAlwaysKnown);
                        foreach (Action aKnowledge in lKnowledgeActions)
                            WriteConditionalAction(sw, aKnowledge);
                    }
                }

                else if (a.Effects == null && a.Observe != null)
                {
                    Action aObserveTrue = a.NonConditionalObservationTranslation(dTags, m_lAlwaysKnown, this, true);
                    WriteConditionalAction(sw, aObserveTrue);
                    Action aObserveFalse = a.NonConditionalObservationTranslation(dTags, m_lAlwaysKnown, this, false);
                    WriteConditionalAction(sw, aObserveFalse);
                }

                else
                {
                    Action aKnowledge = a.AddTaggedConditions(dTags, this);
                    WriteConditionalAction(sw, aKnowledge);
                }
                /* I can't split the effects like that becuase if KC/t -> KE/t even if C is not true
                if (a.HasConditionalEffects)
                {
                    List<Action> aSplitted = a.SplitTaggedConditions(dTags, m_lAlwaysKnown);
                    foreach (Action aKnowledge in aSplitted)
                        WriteConditionalAction(sw, aKnowledge);
                }
                else
                {
                    Action aKnowledge = a.AddKnowledge(m_lAlwaysKnown);
                    WriteConditionalAction(sw, aKnowledge);
                }
                 * */
            }
        }

        private void WriteReasoningActions(StreamWriter sw, Dictionary<string, List<Predicate>> dTags, Problem pCurrent)
        {
            //write merges and tag refutation
            foreach (Predicate p in Predicates)
            {
                if (p is ParametrizedPredicate)
                {
                    ParametrizedPredicate pp = (ParametrizedPredicate)p;
                    if (!AlwaysKnown(pp))
                    {
                        Action aMerge = GenerateMergeAction(pp, dTags);
                        WriteAction(sw, aMerge);
                        Action aRefute = GenerateRefutationAction(pp, true);
                        WriteAction(sw, aRefute);
                        aRefute = GenerateRefutationAction(pp, false);
                        WriteAction(sw, aRefute);

                        //Action aAssert = GenerateAssertInvalid(pp, pCurrent.Goal);
                        //WriteAction(sw, aAssert);
                    }
                }
            }
        }
        private bool Observable(ParametrizedPredicate pp)
        {
            foreach (Action a in Actions)
            {
                if (a.Observe != null)
                {
                    HashSet<Predicate> lObservables = a.Observe.GetAllPredicates();
                    foreach (Predicate p in lObservables)
                    {
                        if (p.Name == pp.Name)
                            return true;
                    }

                }
            }
            return false;
        }

        private Action GenerateTagMergeAction(ParametrizedPredicate pp, List<string> lIncludedTags, List<string> lExcludedTags, bool bValue)
        {
            string sName = "TagMerge-" + pp.Name;
            foreach (string sTag in lIncludedTags)
                sName += "-" + sTag;
            if (bValue == true)
                sName += "-T";
            else
                sName += "-F";
            ParametrizedAction pa = new ParametrizedAction(sName);
            foreach (Parameter param in pp.Parameters)
                pa.AddParameter(param);
            CompoundFormula cfAnd = new CompoundFormula("and");

            foreach (string sTag in lIncludedTags)
            {
                ParametrizedPredicate ppKGivenT = (ParametrizedPredicate)pp.GenerateGiven(sTag);
                foreach (Parameter p in ppKGivenT.Parameters)
                    if (p.Type == VALUE)
                        p.Name = VALUE_PARAMETER;

                if (bValue == true)
                    cfAnd.AddOperand(ppKGivenT);
                else
                    cfAnd.AddOperand(ppKGivenT.Negate());

                if (sTag != lIncludedTags[0])
                {
                    Predicate pKNotT = Predicate.GenerateKNot(new Constant(TAG, sTag), new Constant(TAG, lIncludedTags[0]));
                    cfAnd.AddOperand(pKNotT.Negate());
                }
            }
            foreach (string sTag in lExcludedTags)
            {
                ParametrizedPredicate ppKGivenT = (ParametrizedPredicate)pp.GenerateGiven(sTag);
                foreach (Parameter p in ppKGivenT.Parameters)
                    if (p.Type == VALUE)
                        p.Name = VALUE_PARAMETER;
                Predicate pKNotT = Predicate.GenerateKNot(new Constant(TAG, sTag), new Constant(TAG, lIncludedTags[0]));
                cfAnd.AddOperand(pKNotT);
            }
            if (SDRPlanner.SplitConditionalEffects)
                cfAnd.AddOperand(new GroundedPredicate("NotInAction"));
            pa.Preconditions = cfAnd;
            cfAnd = new CompoundFormula("and");
            foreach (string sTag in lIncludedTags)
            {
                Predicate ppK = pp.GenerateKnowGiven(sTag, true);
                cfAnd.AddOperand(ppK);
            }

            pa.SetEffects(cfAnd);
            return pa;
        }

        private Action GenerateMergeAction(ParametrizedPredicate pp, Dictionary<string, List<Predicate>> dTags)
        {
            ParametrizedAction pa = new ParametrizedAction("Merge-" + pp.Name);
            foreach (Parameter param in pp.Parameters)
                pa.AddParameter(param);
            Parameter pValue = new Parameter(Domain.VALUE, VALUE_PARAMETER);
            pa.AddParameter(pValue);

            Parameter pAgent = null;
            if (SDRPlanner.MultiAgent)
            {
                pAgent = new Parameter(Domain.AGENT, AGENT_PARAMETER);
                pa.AddParameter(pAgent);
            }

            CompoundFormula cfPreconditions = new CompoundFormula("and");
            /*
            ParametrizedPredicate ppK = new ParametrizedPredicate("K" + pp.Name);
            foreach (Parameter param in pp.Parameters)
                ppK.AddParameter(param);
             */
            KnowPredicate ppK = new KnowPredicate(pp);
            if (SDRPlanner.MultiAgent)
                ppK = new KnowPredicate(pp, new Constant(AGENT, AGENT_PARAMETER));//yach - but we do not truly enforce constant names

            ppK.Parametrized = true;
            cfPreconditions.AddOperand(ppK.Negate());//add ~know p to the preconditions - no point in activating merge when we know p

            if (SDRPlanner.SplitConditionalEffects)
                cfPreconditions.AddOperand(new GroundedPredicate("NotInAction"));

            if(SDRPlanner.MultiAgent && SDRPlanner.ForceObservationBeforeReasoning)
            {
                ParametrizedPredicate ppObserved = new ParametrizedPredicate("Observed");
                ppObserved.AddParameter(new Parameter(AGENT, AGENT_PARAMETER));
                cfPreconditions.AddOperand(ppObserved);
            }

            foreach (string sTag in dTags.Keys)
            {
                CompoundFormula cfOr = new CompoundFormula("or");
                ParametrizedPredicate ppKGivenT = new ParametrizedPredicate("KGiven" + pp.Name);
                ParametrizedPredicate pKNotT = new ParametrizedPredicate("KNot");
                pKNotT.AddParameter(new Constant(TAG, sTag));
                foreach (Parameter param in pp.Parameters)
                    ppKGivenT.AddParameter(param);
                ppKGivenT.AddParameter(new Constant(TAG, sTag));
                if (SDRPlanner.MultiAgent)
                {
                    ppKGivenT.AddParameter(pAgent);
                    pKNotT.AddParameter(pAgent);
                }
                ppKGivenT.AddParameter(pValue);
                cfOr.AddOperand(new PredicateFormula(ppKGivenT));
                cfOr.AddOperand(new PredicateFormula(pKNotT));
                cfPreconditions.AddOperand(cfOr);
            }
            pa.Preconditions = cfPreconditions;

            CompoundFormula cfEffects = new CompoundFormula("and");
            cfEffects.AddOperand(ppK);
            pa.Effects = cfEffects;
            return pa;
        }

        private Action GenerateKnowMergeAction(ParametrizedPredicate pp, Domain d, Dictionary<string, List<Predicate>> dTags, bool bValue, bool bKnowWhether)
        {
            ParametrizedAction pa = null;
            string sName = "";
            if (bKnowWhether)
            {
                sName = "Merge-KW-" + pp.Name;
            }
            else
            {
                sName = "Merge-K-" + pp.Name;
                if (bValue == true)
                    sName += "-T";
                else
                    sName += "-F";
            }
            pa = new ParametrizedAction(sName);
            foreach (Parameter param in pp.Parameters)
                pa.AddParameter(param);
            CompoundFormula cfAnd = new CompoundFormula("and");
            Predicate ppK = null;
            if (bKnowWhether)
            {
                ppK = new KnowWhetherPredicate(pp);
            }
            else
            {
                ppK = new KnowPredicate(pp, bValue, false);
            }
            cfAnd.AddOperand(ppK.Negate());//add ~know p to the preconditions - no point in activating merge when we know p
            foreach (string sTag in dTags.Keys)
            {
                ParametrizedPredicate ppKGivenT = null;
                if (bKnowWhether)
                    ppKGivenT = new ParametrizedPredicate("KWGiven" + pp.Name);
                else
                {
                    ppKGivenT = new ParametrizedPredicate("Given" + pp.Name);
                }
                foreach (Parameter param in pp.Parameters)
                    ppKGivenT.AddParameter(param);
                ppKGivenT.AddParameter(new Constant(TAG, sTag));
                if (!bKnowWhether && bValue == false)
                    cfAnd.AddOperand(ppKGivenT.Negate());
                else
                    cfAnd.AddOperand(ppKGivenT);
            }
            pa.Preconditions = cfAnd;
            cfAnd = new CompoundFormula("and");
            cfAnd.AddOperand(ppK);
            if (!bKnowWhether && !d.AlwaysKnown(pp))
                cfAnd.AddOperand(new KnowWhetherPredicate(pp));
            pa.SetEffects(cfAnd);
            return pa;
        }

        private Action GenerateKnowUnMergeAction(ParametrizedPredicate pp, Dictionary<string, List<Predicate>> dTags, bool bValue, bool bKnowWhether)
        {
            ParametrizedAction pa = null;
            if (bKnowWhether)
                pa = new ParametrizedAction("UnMerge-KW-" + pp.Name);
            else
                pa = new ParametrizedAction("UnMerge-K-" + pp.Name);
            foreach (Parameter param in pp.Parameters)
                pa.AddParameter(param);
            CompoundFormula cfAnd = new CompoundFormula("and");
            Predicate ppK = null;
            if (bKnowWhether)
            {
                ppK = new KnowWhetherPredicate(pp);
            }
            else
            {
                ppK = new KnowPredicate(pp, bValue, false);
            }
            foreach (string sTag in dTags.Keys)
            {
                ParametrizedPredicate ppKGivenT = null;
                if (bKnowWhether)
                    ppKGivenT = new ParametrizedPredicate("KWGiven" + pp.Name);
                else
                    ppKGivenT = new ParametrizedPredicate("Given" + pp.Name);
                foreach (Parameter param in pp.Parameters)
                    ppKGivenT.AddParameter(param);
                ppKGivenT.AddParameter(new Constant(TAG, sTag));
                if (!bKnowWhether && bValue == false)
                {
                    cfAnd.AddOperand(ppKGivenT.Negate());
                }
                else
                    cfAnd.AddOperand(ppKGivenT);
            }
            pa.SetEffects(cfAnd);
            cfAnd = new CompoundFormula("and");
            cfAnd.AddOperand(ppK);
            pa.Preconditions = cfAnd;
            return pa;
        }

        private Action GenerateKnowUnMergeAction(ParametrizedPredicate pp, Dictionary<string, List<Predicate>> dTags, bool bValue)
        {
            string sName = "UnMerge-K-" + pp.Name;
            if (bValue)
                sName += "-T";
            else
                sName += "-F";
            ParametrizedAction pa = new ParametrizedAction(sName);
            foreach (Parameter param in pp.Parameters)
                pa.AddParameter(param);

            CompoundFormula cfAnd = new CompoundFormula("and");
            Predicate ppK = new KnowPredicate(pp, bValue, false);

            foreach (string sTag in dTags.Keys)
            {
                ParametrizedPredicate ppKGivenT = new ParametrizedPredicate("Given" + pp.Name);
                foreach (Parameter param in pp.Parameters)
                    ppKGivenT.AddParameter(param);
                ppKGivenT.AddParameter(new Constant(TAG, sTag));
                if (bValue == false)
                {
                    cfAnd.AddOperand(ppKGivenT.Negate());
                }
                else
                    cfAnd.AddOperand(ppKGivenT);
            }
            pa.SetEffects(cfAnd);
            cfAnd = new CompoundFormula("and");
            cfAnd.AddOperand(ppK);
            pa.Preconditions = cfAnd;
            return pa;
        }

        private Action GenerateRefutationAction(ParametrizedPredicate pp, bool bValue)
        {
            string sName = "Refute";
            if (bValue)
                sName += "T";
            else
                sName += "F";
            sName += "-" + pp.Name;
            ParametrizedAction pa = new ParametrizedAction(sName);
            Parameter pTag = new Parameter(TAG, TAG_PARAMETER);
            foreach (Parameter param in pp.Parameters)
                pa.AddParameter(param);
            pa.AddParameter(pTag);

            Parameter pAgent = null;
            if (SDRPlanner.MultiAgent)
            {
                pAgent = new Parameter(Domain.AGENT, AGENT_PARAMETER);
                pa.AddParameter(pAgent);
            }

            CompoundFormula cfPreconditions = new CompoundFormula("and");
            ParametrizedPredicate ppKGivenT = new ParametrizedPredicate("KGiven" + pp.Name);
            foreach (Parameter param in pp.Parameters)
                ppKGivenT.AddParameter(param);
            ppKGivenT.AddParameter(pTag);

            if (SDRPlanner.MultiAgent)
            {
                ppKGivenT.AddParameter(pAgent);
            }

            if (bValue)
                ppKGivenT.AddParameter(new Constant(Domain.VALUE, Domain.TRUE_VALUE));
            else
                ppKGivenT.AddParameter(new Constant(Domain.VALUE, Domain.FALSE_VALUE));


            if (SDRPlanner.MultiAgent && SDRPlanner.ForceObservationBeforeReasoning)
            {
                ParametrizedPredicate ppObserved = new ParametrizedPredicate("Observed");
                ppObserved.AddParameter(new Parameter(AGENT, AGENT_PARAMETER));
                cfPreconditions.AddOperand(ppObserved);
            }


            ParametrizedPredicate pKNotT = new ParametrizedPredicate("KNot");
            pKNotT.AddParameter(pTag);
            if (SDRPlanner.MultiAgent)
            {
                pKNotT.AddParameter(pAgent);
            }

            cfPreconditions.AddOperand(pKNotT.Negate());//add ~know not t - if we already know that t is false there is no point in running tag refutation

            if (SDRPlanner.SplitConditionalEffects)
                cfPreconditions.AddOperand(new GroundedPredicate("NotInAction"));

            /*
            ParametrizedPredicate ppK = new ParametrizedPredicate("K" + pp.Name);
            foreach (Parameter param in pp.Parameters)
                ppK.AddParameter(param);
            */
            KnowPredicate ppK = new KnowPredicate(pp);
            if (SDRPlanner.MultiAgent)
            {
                if (bValue) //we know that the value is not the one given the tag
                    ppK = new KnowPredicate(pp.Negate(), new Constant(AGENT, AGENT_PARAMETER));//yach - but we do not really enforce constant names
                else
                    ppK = new KnowPredicate(pp, new Constant(AGENT, AGENT_PARAMETER));//yach - but we do not really enforce constant names

            }
            cfPreconditions.AddOperand(ppKGivenT);
            cfPreconditions.AddOperand(ppK);

            if (bValue)
                cfPreconditions.AddOperand(pp.Negate());
            else
                cfPreconditions.AddOperand(pp);

            pa.Preconditions = cfPreconditions;

            CompoundFormula cfEffects = new CompoundFormula("and");
            cfEffects.AddOperand(new PredicateFormula(pKNotT));
            pa.Effects = cfEffects;
            return pa;
        }


        private Action GenerateAssertInvalid(ParametrizedPredicate pp, Formula fGoal)
        {
            string sName = "AssertInvalid";
            sName += "_" + pp.Name;
            ParametrizedAction pa = new ParametrizedAction(sName);
            Parameter pTag = new Parameter(TAG, TAG_PARAMETER);
            foreach (Parameter param in pp.Parameters)
                pa.AddParameter(param);
            pa.AddParameter(pTag);
            CompoundFormula cfAnd = new CompoundFormula("and");
            ParametrizedPredicate ppKGivenT = new ParametrizedPredicate("KGiven" + pp.Name);
            foreach (Parameter param in pp.Parameters)
                ppKGivenT.AddParameter(param);
            ppKGivenT.AddParameter(pTag);
            ppKGivenT.AddParameter(new Parameter(Domain.VALUE, Domain.TRUE_VALUE));
            cfAnd.AddOperand(ppKGivenT);

            ppKGivenT = new ParametrizedPredicate("KGiven" + pp.Name);
            foreach (Parameter param in pp.Parameters)
                ppKGivenT.AddParameter(param);
            ppKGivenT.AddParameter(pTag);
            ppKGivenT.AddParameter(new Parameter(Domain.VALUE, Domain.FALSE_VALUE));
            cfAnd.AddOperand(ppKGivenT);

            pa.Preconditions = cfAnd;

            cfAnd = new CompoundFormula("and");
            cfAnd.AddOperand(fGoal);

            HashSet<Predicate> lAllGoal = fGoal.GetAllPredicates();
            foreach (Predicate p in lAllGoal)
            {
                if (!AlwaysKnown(p))
                    cfAnd.AddOperand(new KnowPredicate(p));
            }

            pa.SetEffects(cfAnd);
            return pa;
        }


        private void WriteKnowledgeActions(StreamWriter sw, int cMinMishaps, int cMishaps, bool bMishapType, bool bRequireP)
        {
            foreach (Action a in Actions)
            {
                List<Action> lNoConditionalEffects = RemoveConditionalEffects(a);

                foreach (Action aNonConditional in lNoConditionalEffects)
                {
                    List<Action> lDeterministic = a.RemoveNonDeterministicEffects();
                    foreach (Action aDet in lDeterministic)
                        WriteKnowledgeAction(sw, aDet, cMinMishaps, cMishaps, bMishapType, bRequireP);
                }

            }
        }

        private List<Action> RemoveConditionalEffects(Action a)
        {
            List<Action> lActions = new List<Action>();
            if (!a.ContainsNonDeterministicEffect || !a.HasConditionalEffects)//  || SDRPlanner.Planner != SDRPlanner.Planners.CPT))
            {
                lActions.Add(a);
                return lActions;
            }
            HashSet<Predicate> lMandatoryEffects = a.GetMandatoryEffects();
            List<CompoundFormula> lConditions = a.GetConditions();

            //if (lConditions.Count > 1)
            //   throw new NotImplementedException();

            foreach (CompoundFormula cfWhen in lConditions)
            {
                Action aWithCondition = a.Clone();
                CompoundFormula cfPreconditions = new CompoundFormula("and");
                cfPreconditions.AddOperand(a.Preconditions);
                cfPreconditions.AddOperand(cfWhen.Operands[0]);
                aWithCondition.Preconditions = cfPreconditions.Simplify();
                CompoundFormula cfEffects = new CompoundFormula("and");
                foreach (Predicate p in lMandatoryEffects)
                    cfEffects.AddOperand(p);
                cfEffects.AddOperand(cfWhen.Operands[1]);
                aWithCondition.Effects = cfEffects;
                lActions.Add(aWithCondition);

                if (lMandatoryEffects.Count > 0)
                {
                    //this is not quite true, because we need to add (not p) to the preconditions, but CPT dislikes negative preconditions
                    Action aWithoutCondition = a.Clone();
                    cfEffects = new CompoundFormula("and");
                    foreach (Predicate p in lMandatoryEffects)
                        cfEffects.AddOperand(p);
                    aWithoutCondition.Effects = cfEffects;
                    lActions.Add(aWithoutCondition);
                }

            }
            return lActions;
        }

        private void RemoveConflictingConditionalEffectsFromAction(Action a)
        {
            CompoundFormula cfPreconditions = null;
            if (a.Preconditions == null)
            {
                cfPreconditions = new CompoundFormula("and");
                a.Preconditions = cfPreconditions;
            }
            else if (a.Preconditions is PredicateFormula)
            {
                cfPreconditions = new CompoundFormula("and");
                cfPreconditions.AddOperand(a.Preconditions);
                a.Preconditions = cfPreconditions;
            }
            else
            {
                cfPreconditions = (CompoundFormula)a.Preconditions;
            }
            cfPreconditions.AddOperand(new GroundedPredicate("axioms-applied"));

            CompoundFormula cfEffects = new CompoundFormula("and");
            cfEffects.AddOperand(new GroundedPredicate("axioms-applied").Negate());
            if (a.Effects is PredicateFormula)
            {
                cfEffects.AddOperand(a.Effects);
                a.SetEffects(cfEffects);
            }
            else
            {
                CompoundFormula cfOldEffects = (CompoundFormula)a.Effects;
                foreach (Formula f in cfOldEffects.Operands)
                {
                    if (f is PredicateFormula)
                        cfEffects.AddOperand(f);
                    else
                        cfEffects.AddOperand(((CompoundFormula)f).ReplaceNegativeEffectsInCondition());

                }
            }
            a.SetEffects(cfEffects);
        }

        private void WriteConditionalAction(StreamWriter sw, Action aKnowledge)
        {
            sw.WriteLine("(:action " + aKnowledge.Name);
            if (aKnowledge is ParametrizedAction)
            {
                ParametrizedAction pa = (ParametrizedAction)aKnowledge;
                sw.Write(":parameters (");
                foreach (Parameter param in pa.Parameters)
                    sw.Write(" " + param.Name + " - " + param.Type);
                sw.WriteLine(")");
            }
            if (RemoveConflictingConditionalEffects)
            {
                RemoveConflictingConditionalEffectsFromAction(aKnowledge);
            }


            if (aKnowledge.Preconditions != null)
                sw.WriteLine(":precondition " + aKnowledge.Preconditions);
            sw.WriteLine(":effect " + aKnowledge.Effects.ToString().Replace("(when", "\n\t(when"));
            sw.WriteLine(")");
        }
        /* using KW predicates
        private void WriteTaggedPredicatesNoState(StreamWriter sw, List<Predicate> lAdditinalPredicates)
        {
            sw.WriteLine("(:predicates");
            foreach (ParametrizedPredicate pp in Predicates)
            {
                /*
                if (pp.Name != Domain.OPTION_PREDICATE)
                {
                    sw.Write("(K" + pp.Name);//write know predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                    sw.WriteLine(")");
                }
                 * *
                if (AlwaysConstant(pp) && AlwaysKnown(pp))
                {
                    sw.Write("(K" + pp.Name);//write know predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                    sw.WriteLine(")");
                }
                if (!AlwaysConstant(pp) || !AlwaysKnown(pp))
                {
                    /*
                    sw.Write("(KGiven" + pp.Name);//write know-given predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                    sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                    sw.WriteLine(")");
                     * *
                    sw.Write("(Given" + pp.Name);//write given predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                    sw.WriteLine(")");
                }
                if (!AlwaysKnown(pp) && pp.Name != Domain.OPTION_PREDICATE)
                {
                    /*
                    sw.Write("(KW" + pp.Name);//write know-whether predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                    *
                    //maybe we can further remove this for constant predicates? Not sure.
                    sw.Write("(KWGiven" + pp.Name);//write know-whether-given predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                    sw.WriteLine(")");
                }
            }

            sw.WriteLine("(KNot " + TAG_PARAMETER + "1 - " + TAG + " " + TAG_PARAMETER + "2 - " + TAG + ")");//for tag refutation

            for (int iTime = 0; iTime < TIME_STEPS; iTime++)
                sw.WriteLine("(time" + iTime + ")");

            if (lAdditinalPredicates != null)
            {
                foreach (Predicate p in lAdditinalPredicates)
                    sw.WriteLine(p);
            }
            sw.WriteLine(")");
        }
*/

        private void WriteTaggedPredicatesNoState(StreamWriter sw, List<Predicate> lAdditionalPredicates)
        {
            sw.WriteLine("(:predicates");
            //if(lAdditionalPredicates == null)
            sw.WriteLine("(NotInAction)");

            if (SDRPlanner.MultiAgent)
            {
                ParametrizedPredicate ppLevelDone = new ParametrizedPredicate(LEVEL_DONE_PREDICATE);
                ppLevelDone.AddParameter(new Parameter(TAG, TAG_PARAMETER));
                ppLevelDone.AddParameter(new Parameter(AGENT, AGENT_PARAMETER));
                lAdditionalPredicates.Add(ppLevelDone);

                foreach (Action a in Actions)
                {
                    ParametrizedPredicate ppActionConstraint = new ParametrizedPredicate(ACTION_CONSTRAINT_PREDICATE + "-" + a.Name);
                    if (a is ParametrizedAction)
                    {
                        foreach (Parameter p in ((ParametrizedAction)a).Parameters)
                        {
                            ppActionConstraint.AddParameter(p);
                        }
                    }
                    ppActionConstraint.AddParameter(new Parameter(TAG, TAG_PARAMETER));
                    lAdditionalPredicates.Add(ppActionConstraint);

                }
                /*
                //also for the goal action
                if (SDRPlanner.SingleGoalCondition)
                {
                    ParametrizedPredicate ppActionConstraint = new ParametrizedPredicate(ACTION_CONSTRAINT_PREDICATE + "-Goal");
                    ppActionConstraint.AddParameter(new Parameter(TAG, TAG_PARAMETER));
                    lAdditionalPredicates.Add(ppActionConstraint);
                }
                */
                ParametrizedPredicate ppConstraint = new ParametrizedPredicate(TAG_CONSTRAINT_PREDICATE);
                ppConstraint.AddParameter(new Parameter(AGENT, AGENT_PARAMETER));
                ppConstraint.AddParameter(new Parameter(TAG, TAG_PARAMETER));
                lAdditionalPredicates.Add(ppConstraint);


            }
            /*
            if (SDRPlanner.SingleGoalCondition)
            {
                sw.WriteLine("(Given" + GOAL_PREDICATE + " " + TAG_PARAMETER + " - " + TAG + ")");
            }
            */

            foreach (ParametrizedPredicate pp in Predicates)
            {
                if (AlwaysConstant(pp) && AlwaysKnown(pp))
                {
                    sw.Write("(" + pp.Name);//write know predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                }
                if (!AlwaysConstant(pp) || !AlwaysKnown(pp))
                {
                    sw.Write("(Given" + pp.Name);//write given predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                    sw.WriteLine(")");
                    if (SDRPlanner.SplitConditionalEffects)
                    {
                        sw.Write("(Given" + pp.Name + "-Add");//write givenp-add predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                        sw.WriteLine(")");
                        sw.Write("(Given" + pp.Name + "-Remove");//write givenp-remove predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                        sw.WriteLine(")");
                    }
                }
            }

            if (SDRPlanner.MultiAgent)
            {
                //two agent implementation - seperate knowledge
                sw.WriteLine("(KANot " + AGENT_PARAMETER + " - " + AGENT + " " + TAG_PARAMETER + "1 - " + TAG + " " + TAG_PARAMETER + "2 - " + TAG + ")");//for distinguishing states
            }

            sw.WriteLine("(KNot " + TAG_PARAMETER + "1 - " + TAG + " " + TAG_PARAMETER + "2 - " + TAG + ")");//for distinguishing states

            for (int iTime = 0; iTime < TIME_STEPS; iTime++)
                sw.WriteLine("(time" + iTime + ")");

            if (lAdditionalPredicates != null)
            {
                foreach (Predicate p in lAdditionalPredicates)
                    sw.WriteLine(p);
            }
            sw.WriteLine(")");
        }


        private void WriteTaggedPredicates(StreamWriter sw, List<Predicate> lAdditinalPredicates)
        {
            sw.WriteLine("(:predicates");
            foreach (ParametrizedPredicate pp in Predicates)
            {
                List<Argument> Params = new List<Argument>();
                //if (p is ParametrizedPredicate)
                    Params = new List<Argument>(((ParametrizedPredicate)pp).Parameters);
                sw.Write("(" + pp.Name);//write regular predicate
                foreach (Parameter param in Params)
                    sw.Write(" " + param.FullString());
                sw.WriteLine(")");


                if (RemoveConflictingConditionalEffects)
                {
                    sw.Write("(Not-" + pp.Name);//write regular predicate
                    foreach (Parameter param in Params)
                        sw.Write(" " + param.FullString());
                    sw.WriteLine(")");
                }

                if (SDRPlanner.SplitConditionalEffects)
                {
                    sw.Write("(" + pp.Name + "-Add");//write regular predicate
                    foreach (Parameter param in Params)
                        sw.Write(" " + param.FullString());
                    sw.WriteLine(")");
                    sw.Write("(" + pp.Name + "-Remove");//write regular predicate
                    foreach (Parameter param in Params)
                        sw.Write(" " + param.FullString());
                    sw.WriteLine(")");
                }

                if (!AlwaysKnown(pp) || (SDRPlanner.MultiAgent && !AlwaysConstant(pp))) //in MA, alwaysknown which are not alwaysconstant require K because we do not know which actions get executed
                {
                    sw.Write("(K" + pp.Name);//write know predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    if (SDRPlanner.MultiAgent)
                        sw.Write(" " + AGENT_PARAMETER + " - " + AGENT);
                    sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                    sw.WriteLine(")");

                    if (RemoveConflictingConditionalEffects)
                    {
                        if (SDRPlanner.MultiAgent)
                            throw new NotImplementedException();
                        sw.Write("(Not-K" + pp.Name);//write regular predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                        sw.WriteLine(")");
                    }

                    if (SDRPlanner.SplitConditionalEffects)
                    {
                        if (SDRPlanner.MultiAgent)
                            throw new NotImplementedException();
                        sw.Write("(K" + pp.Name + "-Add");//write know predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                        sw.WriteLine(")");
                        sw.Write("(K" + pp.Name + "-Remove");//write know predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                        sw.WriteLine(")");
                    }

                    sw.Write("(KGiven" + pp.Name);//write know-given predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                    if (SDRPlanner.MultiAgent)
                        sw.Write(" " + AGENT_PARAMETER + " - " + AGENT);
                    sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                    sw.WriteLine(")");


                    if (RemoveConflictingConditionalEffects)
                    {
                        if (SDRPlanner.MultiAgent)
                            throw new NotImplementedException();
                        sw.Write("(Not-KGiven" + pp.Name);//write regular predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                        sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                        sw.WriteLine(")");
                    }

                    if (SDRPlanner.SplitConditionalEffects)
                    {
                        if (SDRPlanner.MultiAgent)
                            throw new NotImplementedException();
                        sw.Write("(KGiven" + pp.Name + "-Add");//write know-given predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                        sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                        sw.WriteLine(")");
                        sw.Write("(KGiven" + pp.Name + "-Remove");//write know-given predicate
                        foreach (Parameter p in pp.Parameters)
                            sw.Write(" " + p.FullString());
                        sw.Write(" " + TAG_PARAMETER + " - " + TAG);
                        sw.Write(" " + VALUE_PARAMETER + " - " + VALUE);
                        sw.WriteLine(")");
                    }
                }
            }
            if (SDRPlanner.MultiAgent)
            {
                sw.WriteLine("(KNot " + TAG_PARAMETER + " - " + TAG + " " + AGENT_PARAMETER + " - " + AGENT + ")");//for tag refutation
                sw.WriteLine("(Observed " + AGENT_PARAMETER + " - " + AGENT + ")");
            }
            else
                sw.WriteLine("(KNot " + TAG_PARAMETER + " - " + TAG + ")");//for tag refutation

            if (RemoveConflictingConditionalEffects)
            {
                sw.WriteLine("(axioms-applied)");
                HashSet<GroundedPredicate> lGrounded = GroundAllPredicates();
                foreach (GroundedPredicate gp in lGrounded)
                {
                    sw.Write("(axioms-applied-" + gp.Name);
                    foreach (Constant c in gp.Constants)
                        sw.Write("-" + c.Name);
                    sw.WriteLine(")");
                }

            }
            /*
            if (m_bUseOptions)
            {
                sw.WriteLine("(option ?x - " + OPTION + ")");
            }
            */
            for (int iTime = 0; iTime < TIME_STEPS; iTime++)
                sw.WriteLine("(time" + iTime + ")");

            if (lAdditinalPredicates != null)
            {
                foreach (Predicate p in lAdditinalPredicates)
                    sw.WriteLine(p);
            }
            sw.WriteLine(")");
        }

        private void WriteKnowledgePredicates(StreamWriter sw, int cMinMishaps, int cMishaps, bool bRequireP)
        {
            sw.WriteLine("(:predicates");
            foreach (ParametrizedPredicate pp in Predicates)
            {
                if (AlwaysKnown(pp) || bRequireP)
                {
                    sw.Write("(" + pp.Name);//write regular predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                }
                if (!AlwaysKnown(pp))
                {
                    sw.Write("(K" + pp.Name);//write know predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                    sw.Write("(KN" + pp.Name);//write know not predicate
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                    /*
                    sw.Write("(NotK" + pp.Name);//write not know predicate - for planners that ignore negative preconditions
                    foreach (Parameter p in pp.Parameters)
                        sw.Write(" " + p.FullString());
                    sw.WriteLine(")");
                    */
                }
            }
            if (cMinMishaps > cMishaps)
            {
                sw.WriteLine("(MishapCount ?m - mishaps)");
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

        private void WriteConstants(StreamWriter sw, int cMinMishaps, int cMishaps)
        {
            sw.WriteLine("(:constants");
            foreach (Constant c in Constants)
                sw.WriteLine(" " + c.FullString());
            if (cMinMishaps > cMishaps)
            {
                for (int i = 0; i <= cMinMishaps; i++)
                {
                    sw.Write(" m" + i);

                }
                sw.WriteLine(" - mishaps");
            }
            sw.WriteLine(")");
        }

        private void WriteConstants(StreamWriter sw, Dictionary<string, List<Predicate>> dTags)
        {
            sw.WriteLine("(:constants");
            foreach (Constant c in Constants)
                sw.WriteLine(" " + c.FullString());
            foreach (KeyValuePair<string, List<Predicate>> p in dTags)
            {
                sw.Write(" " + p.Key + " - " + TAG + " ;");
                foreach (Predicate pred in p.Value)
                {
                    sw.Write(" " + pred.ToString());
                }
                sw.WriteLine();
            }
            sw.WriteLine(" " + TRUE_VALUE + " - " + VALUE);
            sw.WriteLine(" " + FALSE_VALUE + " - " + VALUE);
            /*
            if (m_bUseOptions && HasNonDeterministicActions())
            {
                int cOptions = MaxNonDeterministicEffects();
                for( int i = 0 ; i < cOptions ; i++ )
                    sw.Write(" " + "opt" + i + " - " + OPTION);
                sw.WriteLine();
            }
             * */
            sw.WriteLine(")");
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

        private Action GetActionByName(string sActionName)
        {
            foreach (Action a in Actions)
            {
                if (a.Name.ToLower() == sActionName.ToLower())
                {
                    return a;
                }
                if (a.Name.ToLower().Replace("_", "-") == sActionName)
                    return a;
            }
            Action aBestMatch = null;
            foreach (Action a in Actions)
            {
                if (sActionName.StartsWith(a.Name.ToLower())) //assuming that this is a splitted conditional effect action. BUGBUG - need better solution for this
                {
                    if (aBestMatch == null || aBestMatch.Name.Length < a.Name.Length)
                        aBestMatch = a;
                }
                if (sActionName.StartsWith(a.Name.ToLower().Replace("_", "-"))) //assuming that this is a splitted conditional effect action. BUGBUG - need better solution for this
                {
                    if (aBestMatch == null || aBestMatch.Name.Length < a.Name.Length)
                        aBestMatch = a;
                }
            }
            return aBestMatch;
        }

        private Dictionary<string, Constant> GetBindings(ParametrizedAction pa, string[] asAction)
        {
            if (pa.Parameters.Count > asAction.Length - 1) // last parameter can be the tag of a KW action
                return null;
            Dictionary<string, Constant> dBindings = new Dictionary<string, Constant>();
            for (int iParameter = 0; iParameter < pa.Parameters.Count; iParameter++)
            {
                dBindings[pa.Parameters[iParameter].Name] = new Constant(pa.Parameters[iParameter].Type, asAction[iParameter + 1]);
            }
            return dBindings;
        }

        public Action GroundActionByName(string[] asAction, IEnumerable<Predicate> lPredicates, bool bContainsNegations)
        {
            string sActionName = asAction[0];
            Action a = GetActionByName(sActionName);
            if (!(a is ParametrizedAction))
                return a;
            ParametrizedAction pa = (ParametrizedAction)a;
            Dictionary<string, Constant> dBindings = GetBindings(pa, asAction);

            Formula fGroundedPreconditions = null;
            if (pa.Preconditions != null)
                fGroundedPreconditions = pa.Preconditions.Ground(dBindings);
            if (pa.Preconditions == null || fGroundedPreconditions.ContainedIn(lPredicates, bContainsNegations))
            {
                string sName = pa.Name;
                foreach (Parameter p in pa.Parameters)
                    sName += "_" + dBindings[p.Name].Name;
                Action aGrounded = new Action(sName);
                aGrounded.Preconditions = fGroundedPreconditions;
                if (pa.Effects != null)
                    aGrounded.SetEffects(pa.Effects.Ground(dBindings));
                if (pa.Observe != null)
                    aGrounded.Observe = pa.Observe.Ground(dBindings);
                return aGrounded;
            }
            return null;
        }

        public Action GroundActionByName(string[] asAction)
        {
            string sActionName = asAction[0];
            Action a = GetActionByName(sActionName);
            if (!(a is ParametrizedAction))
                return a;
            ParametrizedAction pa = (ParametrizedAction)a;
            Dictionary<string, Constant> dBindings = GetBindings(pa, asAction);

            Formula fGroundedPreconditions = null;
            if (pa.Preconditions != null)
                fGroundedPreconditions = pa.Preconditions.Ground(dBindings);
            else if (pa.Effects != null)
                pa.Effects.Ground(dBindings);
            else if (pa.Observe != null)
                pa.Observe.Ground(dBindings);
            string sName = pa.Name;
            foreach (Parameter p in pa.Parameters)
                sName += "_" + dBindings[p.Name].Name;
            Action aGrounded = new Action(sName);
            aGrounded.Preconditions = fGroundedPreconditions;
            if (pa.Effects != null)
                aGrounded.SetEffects(pa.Effects.Ground(dBindings));
            if (pa.Observe != null)
                aGrounded.Observe = pa.Observe.Ground(dBindings);
            return aGrounded;
        }

        public void GroundPredicate(ParametrizedPredicate pp, Dictionary<Parameter, Constant> dBindings, List<Argument> lRemaining, 
            HashSet<GroundedPredicate> lGrounded)
        {
            if (lRemaining.Count == 0)
            {
                GroundedPredicate gp = new GroundedPredicate(pp.Name);
                foreach (Parameter p in pp.Parameters)
                    gp.AddConstant(dBindings[p]);
                lGrounded.Add(gp);
            }
            else
            {
                Argument a = lRemaining[0];
                List<Argument> lNewRemaining = new List<Argument>(lRemaining);
                lNewRemaining.RemoveAt(0);
                if (a is Parameter)
                {
                    Parameter p = (Parameter)a;
                    foreach (Constant c in Constants)
                    {
                        if (p.Type == "" || c.Type == p.Type)
                        {
                            dBindings[p] = c;
                            GroundPredicate(pp, dBindings, lNewRemaining, lGrounded);
                        }
                    }
                }
                else
                {
                    GroundPredicate(pp, dBindings, lNewRemaining, lGrounded);
                }
            }
        }

        public HashSet<GroundedPredicate> GroundAllPredicates()
        {
            HashSet<string> lExcludePredicateNames = new HashSet<string>();
            return GroundAllPredicates(lExcludePredicateNames);
        }

        public HashSet<GroundedPredicate> GroundAllPredicates(HashSet<string> lExcludePredicateNames)
        {
            HashSet<GroundedPredicate> lGrounded = new HashSet<GroundedPredicate>();
            foreach (Predicate p in Predicates)
            {
                if (!lExcludePredicateNames.Contains(p.Name))
                {
                    if (p is ParametrizedPredicate)
                    {
                        ParametrizedPredicate pp = (ParametrizedPredicate)p;
                        GroundPredicate(pp, new Dictionary<Parameter, Constant>(),
                            new List<Argument>(pp.Parameters), lGrounded);
                    }
                    else
                        lGrounded.Add((GroundedPredicate)p);
                }
            }
            return lGrounded;
        }

        public List<Action> GroundAllActions(
            List<Action> lActions, IEnumerable<Predicate> lPredicates, bool bContainsNegations, bool bCheckConsistency)
        {
            List<Action> lGrounded = new List<Action>();
            Dictionary<string, Constant> dBindings = new Dictionary<string, Constant>();
            List<Parameter> lToBind = null;
            List<Constant> lConstants = new List<Constant>();
            foreach (Predicate p in lPredicates)
            {
                if (p is GroundedPredicate)
                {
                    GroundedPredicate gp = (GroundedPredicate)p;
                    foreach (Constant c in gp.Constants)
                    {
                        if (!lConstants.Contains(c))
                        {
                            lConstants.Add(c);
                        }
                    }
                }
            }

            foreach (Action a in lActions)
            {
                if (a is ParametrizedAction)
                {
                    ParametrizedAction pa = (ParametrizedAction)a;
                    lToBind = new List<Parameter>(pa.Parameters);
                    dBindings.Clear();
                    // GroundAction(pa, lConstants, lToBind, dBindings, lGrounded, lPredicates, bContainsNegations, bCheckConsistency);
                    GroundAction(pa, lConstants, lToBind, lGrounded, lPredicates, bContainsNegations, bCheckConsistency);
                }
                else
                {
                    if (a.Preconditions == null || !bCheckConsistency || a.Preconditions.IsTrue(lPredicates, bContainsNegations))
                    {
                        lGrounded.Add(a);
                    }
                }
            }
            return lGrounded;
        }

        public List<Action> GroundAllActions(IEnumerable<Predicate> lPredicates, bool bContainsNegations)
        {
            return GroundAllActions(Actions, lPredicates, bContainsNegations, true);
        }

        public List<Action> GroundAllActions()
        {
            throw new NotImplementedException();
            return GroundAllActions(null);
        }

        public List<Action> GroundAllActions(Problem problem)
        {
            List<Action> lAllGrounded = new List<Action>();
            Dictionary<string, Constant> dBindings = new Dictionary<string, Constant>();
            List<Parameter> lToBind = null;
            List<Constant> lConstants = new List<Constant>();
            HashSet<Predicate> lPredicates = new HashSet<Predicate>();

            foreach (GroundedPredicate p in problem.Known)
                lPredicates.Add(p);
            foreach (CompoundFormula cf in problem.Hidden)
            {
                cf.GetAllPredicates(lPredicates);
            }
            Dictionary<string, HashSet<GroundedPredicate>> dPredicates = new Dictionary<string, HashSet<GroundedPredicate>>();
            foreach (GroundedPredicate gp in lPredicates)
            {
                if (!gp.Negation)
                {
                    if (!dPredicates.ContainsKey(gp.Name))
                        dPredicates[gp.Name] = new HashSet<GroundedPredicate>();
                    dPredicates[gp.Name].Add(gp);
                }
                else
                {
                    // gp = gp.Negation;
                    if (!dPredicates.ContainsKey(gp.Name))
                        dPredicates[gp.Name] = new HashSet<GroundedPredicate>();
                    dPredicates[gp.Name].Add(gp);
                }
            }

            bool bNewPredciatesAdded = true;
            int cIterations = 0;
            while (bNewPredciatesAdded)
            {
                List<Action> lGrounded = new List<Action>();
                Dictionary<string, HashSet<GroundedPredicate>> dNewPredicates = new Dictionary<string, HashSet<GroundedPredicate>>();
                foreach (Action a in Actions)
                {
                    if (a is ParametrizedAction)
                    {
                        ParametrizedAction pa = (ParametrizedAction) a;
                        lToBind = new List<Parameter>(pa.Parameters);
                        dBindings.Clear();
                        
                        bool bNoValidGrounding = false;
                        HashSet<ParametrizedPredicate> lPredicatesToBind = new HashSet<ParametrizedPredicate>();
                        HashSet<Predicate> lOptionalPreconditions = new HashSet<Predicate>();
                        if (pa.Preconditions != null)
                        {
                            foreach (Predicate p in pa.Preconditions.GetAllPredicates())
                            {
                                if (p is ParametrizedPredicate)
                                {
                                    if (!dPredicates.ContainsKey(p.Name) && !p.Negation)
                                        bNoValidGrounding = true;
                                    lPredicatesToBind.Add((ParametrizedPredicate)p);
                                }
                            }
                            lOptionalPreconditions = pa.Preconditions.GetAllOptionalPredicates();
                        }
                        if (pa.Effects != null)
                        {
                            List<CompoundFormula> lConditions = pa.GetConditions();
                            foreach (CompoundFormula cfCondition in lConditions)
                            {
                                foreach (Predicate p in cfCondition.Operands[0].GetAllPredicates())
                                {
                                    if (p is ParametrizedPredicate)
                                    {
                                        if (!dPredicates.ContainsKey(p.Name) && !p.Negation)
                                        {
                                            bNoValidGrounding = true;
                                        }
                                        lPredicatesToBind.Add((ParametrizedPredicate)p);
                                        lOptionalPreconditions.Add(p); // all conditions are optional
                                    }
                                }
                            }
                        }
                        if (!bNoValidGrounding)
                        {
                            Dictionary<ParametrizedPredicate, GroundedPredicate> dPredicateBindings 
                                = new Dictionary<ParametrizedPredicate, GroundedPredicate>();
                            GroundAction(pa, dPredicates, lOptionalPreconditions, lToBind, dBindings, lPredicatesToBind, 
                                dPredicateBindings, lGrounded, dNewPredicates, lPredicates);
                        }
                    }
                    else
                    {
                        lGrounded.Add(a);
                    }
                }

                bNewPredciatesAdded = false;
                foreach (string sKey in dNewPredicates.Keys)
                {
                    if (!dPredicates.ContainsKey(sKey))
                        dPredicates[sKey] = new HashSet<GroundedPredicate>();
                    foreach (GroundedPredicate gp in dNewPredicates[sKey])
                    {
                        if (!dPredicates[sKey].Contains(gp))
                        {
                            dPredicates[sKey].Add(gp);
                            lPredicates.Add(gp);
                            bNewPredciatesAdded = true;
                        }
                    }
                }

                foreach (Action a in lGrounded)
                {
                    if (!lAllGrounded.Contains(a))
                        lAllGrounded.Add(a);
                }
                cIterations++;
            }
            return lAllGrounded;
        }
        
        public List<Action> GroundAllObservationActions(IEnumerable<Predicate> lPredicates, bool bContainsNegations)
        {
            List<Action> lGrounded = new List<Action>();
            Dictionary<string, Constant> dBindings = new Dictionary<string, Constant>();
            HashSet<Predicate> lToBind = null;
            //List<Constant> lConstants = new List<Constant>();
            /* can't use these because the observations do not appear in the preconditions
            foreach (Predicate p in lPredicates)
            {
                if (p is GroundedPredicate)
                {
                    GroundedPredicate gp = (GroundedPredicate)p;
                    foreach (Constant c in gp.Constants)
                        if (!lConstants.Contains(c))
                            lConstants.Add(c);
                }
            }
             * */
            foreach (Action a in Actions)
            {
                if (a.Observe != null)
                {
                    if (a is ParametrizedAction)
                    {
                        /*
                        ParametrizedAction pa = (ParametrizedAction)a;
                        lToBind = new List<Parameter>(pa.Parameters);
                        dBindings.Clear();
                        GroundAction(pa, Constants, lToBind, dBindings, lGrounded, lPredicates, bContainsNegations, true);
                         */
                        ParametrizedAction pa = (ParametrizedAction)a;
                        lToBind = new HashSet<Predicate>();
                        if (pa.Preconditions != null)
                            pa.Preconditions.GetAllPredicates(lToBind);
                        dBindings.Clear();
                        GroundAction(pa, Constants, new List<Predicate>(lToBind), dBindings, lGrounded, lPredicates, bContainsNegations, true);

                    }
                    else
                        lGrounded.Add(a);
                }
            }
            List<Action> lFilteredKnown = new List<Action>();
            foreach (Action a in lGrounded)
            {
                PredicateFormula pf = (PredicateFormula)a.Observe;
                if (!lPredicates.Contains(pf.Predicate) &&
                    !lPredicates.Contains(pf.Predicate.Negate()))
                    lFilteredKnown.Add(a);
            }
            return lFilteredKnown;
        }

        private void GroundAction(ParametrizedAction pa, List<Constant> lConstants,
            List<Parameter> lToBind, Dictionary<string, Constant> dBindings,
            List<Action> lGrounded, IEnumerable<Predicate> lPredicates, bool bContainsNegations, bool bCheckConsistency)
        {
            Formula fGroundedPreconditions = null;
            if (lToBind.Count > 0)
            {
                Parameter p = lToBind.First();
                lToBind.Remove(p);
                foreach (Constant c in lConstants)
                {
                    if (c.Type == p.Type)
                    {
                        dBindings[p.Name] = c;

                        if (pa.Preconditions != null)
                            fGroundedPreconditions = pa.Preconditions.PartiallyGround(dBindings);
                        if (pa.Preconditions == null || !bCheckConsistency || !fGroundedPreconditions.IsFalse(lPredicates, bContainsNegations))
                            GroundAction(pa, lConstants, lToBind, dBindings, lGrounded, lPredicates, bContainsNegations, bCheckConsistency);
                        else
                            Debug.Assert(false);
                    }
                }
                dBindings.Remove(p.Name);
                lToBind.Add(p);
            }
            else
            {
                if (pa.Preconditions != null)
                    fGroundedPreconditions = pa.Preconditions.Ground(dBindings);
                if (pa.Preconditions == null || !bCheckConsistency || fGroundedPreconditions.ContainedIn(lPredicates, bContainsNegations))
                {
                    string sName = pa.Name;
                    foreach (Parameter p in pa.Parameters)
                        sName += "_" + dBindings[p.Name].Name;
                    Action aGrounded = new Action(sName);
                    aGrounded.Preconditions = fGroundedPreconditions;
                    if (pa.Effects != null)
                        aGrounded.SetEffects(pa.Effects.Ground(dBindings));
                    if (pa.Observe != null)
                        aGrounded.Observe = pa.Observe.Ground(dBindings);
                    if ((pa.Preconditions == null || !aGrounded.Preconditions.IsFalse(new List<Predicate>())) &&
                        (aGrounded.Effects == null || !aGrounded.Effects.IsFalse(new List<Predicate>())))
                        lGrounded.Add(aGrounded);
                }
            }
        }

        private void GroundAction(ParametrizedAction pa, List<Constant> lConstants, List<Parameter> lToBind, 
            List<Action> lGrounded, IEnumerable<Predicate> lPredicates, bool bContainsNegations, bool bCheckConsistency)
        {
            Formula fGroundedPreconditions = null;
            List<Predicate> lPre = new List<Predicate>();
            if (pa.Preconditions != null)
                lPre = new List<Predicate>(pa.Preconditions.GetAllPredicates());
            List<Dictionary<string, Constant>> lBindings = FindValidBindings(lToBind, lPre, lPredicates, bContainsNegations);
            foreach (var dBindings in lBindings)
            {
                if (pa.Preconditions != null)
                {
                    fGroundedPreconditions = pa.Preconditions.Ground(dBindings);
                }
                if (pa.Preconditions == null || !bCheckConsistency || 
                    fGroundedPreconditions.ContainedIn(lPredicates, bContainsNegations))
                {
                    string sName = pa.Name;
                    foreach (Parameter p in pa.Parameters)
                        sName += "_" + dBindings[p.Name].Name;
                    Action aGrounded = new Action(sName);
                    aGrounded.Preconditions = fGroundedPreconditions;
                    if (pa.Effects != null)
                        aGrounded.SetEffects(pa.Effects.Ground(dBindings));
                    if (pa.Observe != null)
                        aGrounded.Observe = pa.Observe.Ground(dBindings);
                    if ((pa.Preconditions == null || !aGrounded.Preconditions.IsFalse(new List<Predicate>())) &&
                        (aGrounded.Effects == null || !aGrounded.Effects.IsFalse(new List<Predicate>())))
                        lGrounded.Add(aGrounded);
                }
            }
        }

        private void FindValidBindings(List<Parameter> lToBind, List<Dictionary<string, Constant>> lBindings, Dictionary<string, Constant> dBinding, bool bContainsNegations)
        {
            if (lToBind.Count == 0)
            {
                lBindings.Add(dBinding);
                return;
            }

            Parameter pFirst = lToBind[0];
            List<Parameter> lNewToBind = new List<Parameter>(lToBind);
            lNewToBind.RemoveAt(0);
            foreach (Constant c in Constants)
            {
                if (c.Type == pFirst.Type)
                {
                    Dictionary<string, Constant> dNewBinding = new Dictionary<string, Constant>(dBinding);
                    dNewBinding[pFirst.Name] = c;
                    FindValidBindings(lNewToBind, lBindings, dNewBinding, bContainsNegations);
                }
            }
        }

        private void FindValidBindings(List<Parameter> lToBind, List<Dictionary<string, Constant>> lBindings, Dictionary<string, Constant> dBinding,
            List<Predicate> lPreconditions, IEnumerable<Predicate> lPredicates, bool bContainsNegations)
        {
            if (lToBind.Count == 0 || lPreconditions.Count == 0)
            {
                if (lToBind.Count != 0)
                    FindValidBindings(lToBind, lBindings, dBinding, bContainsNegations);
                else
                    lBindings.Add(dBinding);
                return;
            }



            Predicate p = lPreconditions[0];
            List<Predicate> lReducedPreconditions = new List<Predicate>();
            for (int i = 1; i < lPreconditions.Count; i++)
                lReducedPreconditions.Add(lPreconditions[i]);

            if (p != null && p is ParametrizedPredicate && ((ParametrizedPredicate)p).Parameters.Count() > 0)
            {
                ParametrizedPredicate pCurrent = (ParametrizedPredicate)p;
                //if (pCurrent.Negation && !bContainsNegations)
                //    throw new NotImplementedException();


                List<GroundedPredicate> lMatches = new List<GroundedPredicate>();
                foreach (GroundedPredicate pGrounded in lPredicates)
                {
                    if (pCurrent.Name == pGrounded.Name && pCurrent.Negation == pGrounded.Negation)
                        lMatches.Add(pGrounded);
                }

                foreach (GroundedPredicate gpMatch in lMatches)
                {
                    Dictionary<string, Constant> dNewBinding = pCurrent.Match(gpMatch, dBinding);
                    if (dNewBinding != null)
                    {
                        foreach (var v in dBinding)
                            dNewBinding[v.Key] = v.Value;
                        List<Parameter> lNewToBind = new List<Parameter>();
                        foreach (Parameter param in lToBind)
                        {
                            bool bExists = false;
                            foreach (string s in dNewBinding.Keys)
                                if (param.Name == s)
                                    bExists = true;
                            if (!bExists)
                                lNewToBind.Add(param);
                        }
                        FindValidBindings(lNewToBind, lBindings, dNewBinding, lReducedPreconditions, lPredicates, bContainsNegations);
                    }

                }

            }
            else
            {
                FindValidBindings(lToBind, lBindings, dBinding, lReducedPreconditions, lPredicates, bContainsNegations);

            }
        }

        private List<Dictionary<string, Constant>> FindValidBindings(List<Parameter> lToBind, List<Predicate> lPreconditions, IEnumerable<Predicate> lPredicates, bool bContainsNegations)
        {
            List<Dictionary<string, Constant>> lBindings = new List<Dictionary<string, Constant>>();
            Dictionary<string, Constant> dBinding = new Dictionary<string, Constant>();

            Predicate pAt = null;
            for (int i = 0; i < lPreconditions.Count; i++)
            {
                if (lPreconditions[i].Name == "at")
                {
                    pAt = lPreconditions[i];
                    lPreconditions[i] = lPreconditions[0];
                    lPreconditions[0] = pAt;
                    break;
                }
            }

            FindValidBindings(lToBind, lBindings, dBinding, lPreconditions, lPredicates, bContainsNegations);
            return lBindings;
        }

        private void GroundAction(ParametrizedAction pa, List<Constant> lConstants,
            List<Predicate> lToBind, Dictionary<string, Constant> dBindings,
            List<Action> lGrounded, IEnumerable<Predicate> lPredicates, bool bContainsNegations, bool bCheckConsistency)
        {
            if (lToBind.Count > 0)
            {
                ParametrizedPredicate p = (ParametrizedPredicate)lToBind.First();
                lToBind.Remove(p);
                foreach (GroundedPredicate pExists in lPredicates)
                {
                    Dictionary<string, Constant> dNewBindings = p.Match(pExists, dBindings);
                    if (dNewBindings != null)
                    {
                        foreach (KeyValuePair<string, Constant> pair in dNewBindings)
                        {
                            dBindings[pair.Key] = pair.Value;
                        }
                        GroundAction(pa, lConstants, lToBind, dBindings, lGrounded, lPredicates, bContainsNegations, bCheckConsistency);
                        foreach (KeyValuePair<string, Constant> pair in dNewBindings)
                        {
                            dBindings.Remove(pair.Key);
                        }
                    }
                }
                lToBind.Add(p);
            }
            else
            {
                List<Parameter> lUnboundedParameters = new List<Parameter>();
                foreach (Parameter p in pa.Parameters)
                {
                    if (!dBindings.ContainsKey(p.Name))
                        lUnboundedParameters.Add(p);
                }
                GroundAction(pa, lConstants, lUnboundedParameters, dBindings, lGrounded, lPredicates, bContainsNegations, bCheckConsistency);
            }

        }

        private void GroundAction( ParametrizedAction pa, Dictionary<string, HashSet<GroundedPredicate>> dPredicates, 
            HashSet<Predicate> lOptionalPreconditions, List<Parameter> lToBind, Dictionary<string, Constant> dBindings, 
            HashSet<ParametrizedPredicate> lPredicatesToBind, 
            Dictionary<ParametrizedPredicate, GroundedPredicate> dPredicateBindings,
            List<Action> lGrounded, Dictionary<string, HashSet<GroundedPredicate>> dNewPredicates,
            HashSet<Predicate> lGroundedPredicates )
        {
            if (lPredicatesToBind.Count > 0)
            {
                ParametrizedPredicate ppCurrent = lPredicatesToBind.First();
                GroundedPredicate gpGrounded = ppCurrent.Ground(dBindings);

                if (gpGrounded == null)
                {
                    HashSet<GroundedPredicate> lCandidates = dPredicates[ppCurrent.Name];
                    foreach (GroundedPredicate gpCandidate in lCandidates)
                    {
                        //if (pa.Name.Contains("smell") && gpCandidate.Name == "Givenat" 
                        // /*&& gpCandidate.ToString().Contains("1-4") */&& gpCandidate.ToString().Contains("2-4"))
                        //    Console.WriteLine("*");
                        Dictionary<string, Constant> dNewBindings = gpCandidate.Bind(ppCurrent);
                        if (ConsistentBindings(dBindings, dNewBindings))
                        {
                            foreach (KeyValuePair<string, Constant> p in dBindings)
                                dNewBindings[p.Key] = p.Value;
                            HashSet<ParametrizedPredicate> lNewPredicatesToBind = new HashSet<ParametrizedPredicate>(lPredicatesToBind);
                            lNewPredicatesToBind.Remove(ppCurrent);
                            Dictionary<ParametrizedPredicate, GroundedPredicate> dNewPredicateBindings = 
                                new Dictionary<ParametrizedPredicate, GroundedPredicate>(dPredicateBindings);
                            dNewPredicateBindings[ppCurrent] = gpCandidate;

                            GroundAction(pa, dPredicates, lOptionalPreconditions, lToBind, dNewBindings, lNewPredicatesToBind, 
                                dNewPredicateBindings, lGrounded, dNewPredicates, lGroundedPredicates);
                        }
                    }
                }
                else
                {
                    // BUGBUG here - not doing correctly disjunctions - checking conjunction instead...
                    if (gpGrounded.Negation || dPredicates[ppCurrent.Name].Contains(gpGrounded) || lOptionalPreconditions.Contains(ppCurrent))
                    {
                        HashSet<ParametrizedPredicate> lNewPredicatesToBind = new HashSet<ParametrizedPredicate>(lPredicatesToBind);
                        lNewPredicatesToBind.Remove(ppCurrent);
                        GroundAction(pa, dPredicates, lOptionalPreconditions, lToBind, dBindings, lNewPredicatesToBind, dPredicateBindings, lGrounded, dNewPredicates, lGroundedPredicates);
                    }
                }
            }
            else
            {
                Formula fGroundedPreconditions = null;
                if (pa.Preconditions != null)
                {
                    fGroundedPreconditions = pa.Preconditions.Ground(dBindings);
                }
                string sName = pa.Name;
                foreach (Parameter p in pa.Parameters)
                    sName += "_" + dBindings[p.Name].Name;
                Action aGrounded = new Action(sName);
                aGrounded.Preconditions = fGroundedPreconditions;
                bool bInvalidEffects = false;
                if (pa.Effects != null)
                {
                    aGrounded.SetEffects(pa.Effects.Ground(dBindings));
                    HashSet<Predicate> lApplicableEffects = aGrounded.GetApplicableEffects(lGroundedPredicates, false).GetAllPredicates();
                    //foreach (GroundedPredicate gp in aGrounded.Effects.GetAllPredicates())
                    foreach (GroundedPredicate gp in lApplicableEffects)
                    {
                        if (gp == Domain.FALSE_PREDICATE)
                            bInvalidEffects = true;
                        if (!gp.Negation)
                        {
                            if (!dNewPredicates.ContainsKey(gp.Name))
                                dNewPredicates[gp.Name] = new HashSet<GroundedPredicate>();
                            dNewPredicates[gp.Name].Add(gp);
                        }
                    }
                }
                if (!bInvalidEffects)
                {

                    if (pa.Observe != null)
                        aGrounded.Observe = pa.Observe.Ground(dBindings);
                    lGrounded.Add(aGrounded);
                }
            }
        }

        private bool ConsistentBindings(Dictionary<string, Constant> d1, Dictionary<string, Constant> d2)
        {
            if (d2 == null)
                return false;
            foreach (string sKey in d1.Keys)
            {
                if (d2.ContainsKey(sKey))
                {
                    if (!d1[sKey].Equals(d2[sKey]))
                        return false;
                }
            }
            return true;
        }


        private void GroundAction(ParametrizedAction pa,
            List<Parameter> lToBind, Dictionary<string, Constant> dBindings,
            List<Action> lGrounded, Problem problem)
        {
            if (lToBind.Count > 0)
            {
                Parameter p = lToBind.Last();
                lToBind.Remove(p);
                foreach (Constant c in Constants)
                {
                    if (c.Type == p.Type)
                    {
                        dBindings[p.Name] = c;
                        GroundAction(pa, lToBind, dBindings, lGrounded, problem);
                    }
                }
                dBindings.Remove(p.Name);
                lToBind.Add(p);
            }
            else
            {
                Formula fGroundedPreconditions = null;
                if (pa.Preconditions != null)
                {
                    fGroundedPreconditions = pa.Preconditions.Ground(dBindings);
                    if (problem != null && !CheckValidConstantPreconditions(fGroundedPreconditions, problem))
                    {
                        return;
                    }
                }
                string sName = pa.Name;
                foreach (Parameter p in pa.Parameters)
                    sName += " " + dBindings[p.Name].Name;
                Action aGrounded = new Action(sName);
                aGrounded.Preconditions = fGroundedPreconditions;
                if (pa.Effects != null)
                    aGrounded.SetEffects(pa.Effects.Ground(dBindings));
                if (pa.Observe != null)
                    aGrounded.Observe = pa.Observe.Ground(dBindings);
                lGrounded.Add(aGrounded);

            }
        }

        private bool CheckValidConstantPreconditions(Formula fGroundedPreconditions, Problem problem)
        {
            if (fGroundedPreconditions is CompoundFormula)
            {
                foreach (Formula fSub in ((CompoundFormula)fGroundedPreconditions).Operands)
                {
                    if (!CheckValidConstantPreconditions(fSub, problem))
                        return false;
                }
                return true;
            }
            else
            {
                PredicateFormula pf = (PredicateFormula)fGroundedPreconditions;
                if (m_lAlwaysConstant.Contains(pf.Predicate.Name) && m_lAlwaysKnown.Contains(pf.Predicate.Name))
                {
                    if (!pf.IsTrue(problem.Known))
                        return false;
                }
                return true;
            }
        }



        private Dictionary<string, string> m_dConstantNameToType;
        public Dictionary<string, string> ConstantNameToType
        {
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


        private void WritePredicates(StreamWriter sw)
        {
            sw.WriteLine("(:predicates");
            foreach (ParametrizedPredicate pp in Predicates)
            {
                sw.Write("(" + pp.Name);//write regular predicate
                foreach (Parameter p in pp.Parameters)
                    sw.Write(" " + p.FullString());
                sw.WriteLine(")");
            }
            sw.WriteLine(")");
        }
        private void WriteKReplannerActions(StreamWriter sw)
        {
            foreach (Action a in Actions)
            {
                if (a.Observe == null)
                    WriteAction(sw, a);
                else
                    WriteSensor(sw, a);
            }
        }

        public void WriteKReplannerDomain(string sFileName)
        {
            StreamWriter sw = new StreamWriter(sFileName);
            sw.WriteLine("(define (domain " + Name + ")");
            sw.WriteLine("(:requirements :strips :typing)");
            WriteTypes(sw, false);
            WriteConstants(sw);
            sw.WriteLine();
            WritePredicates(sw);
            sw.WriteLine();
            WriteKReplannerActions(sw);
            sw.WriteLine(")");
            sw.Close();
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

        public CompoundFormula GetOptionsStatement()
        {
            CompoundFormula cfOneof = new CompoundFormula("oneof");
            int cOptions = Math.Max(MAX_OPTIONS, MaxNonDeterministicEffects());
            for (int iOption = 0; iOption < cOptions; iOption++)
            {
                GroundedPredicate gpCurrentOption = new GroundedPredicate(Domain.OPTION_PREDICATE);
                gpCurrentOption.AddConstant(new Constant(OPTION, "opt" + iOption));
                cfOneof.AddOperand(gpCurrentOption);
            }
            return cfOneof;

        }

        public bool IsObservationAction(string sActionName)
        {
            Action a = GetActionByName(sActionName);
            return a.Observe != null;
        }

        public MemoryStream WriteSimpleDomain(string sFileName)
        {
            MemoryStream msDomain = new MemoryStream();
            StreamWriter sw = new StreamWriter(msDomain);
            sw.WriteLine("(define (domain K" + Name + ")");
            sw.WriteLine("(:requirements :strips :typing)");
            WriteTypes(sw, false);
            WriteConstants(sw);
            sw.WriteLine();
            WritePredicates(sw);
            sw.WriteLine();
            WriteActions(sw, false);
            sw.WriteLine(")");
            sw.Flush();

            if (SDRPlanner.UseFilesForPlanners)
            {
                bool bDone = false;
                while (!bDone)
                {
                    try
                    {
                        msDomain.Position = 0;
                        StreamReader sr = new StreamReader(msDomain);
                        StreamWriter swFile = new StreamWriter(sFileName);
                        swFile.Write(sr.ReadToEnd());
                        swFile.Close();
                        bDone = true;
                    }
                    catch (Exception e) { }
                }
            }
            return msDomain;

        }

        private void WriteActions(StreamWriter sw, bool bWriteObservationActions)
        {
            foreach (Action a in Actions)
            {
                if (bWriteObservationActions || a.Observe == null)
                {
                    List<Action> lNonConditional = RemoveConditionalEffects(a);
                    foreach (Action aNonConditional in lNonConditional)
                    {
                        List<Action> lDeterministic = aNonConditional.RemoveNonDeterministicEffects();
                        foreach (Action aDet in lDeterministic)
                            WriteAction(sw, aDet);
                    }
                }
            }
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

        public Dictionary<Predicate, HashSet<Predicate>> IdentifyInvariants(List<Action> lActions)
        {
            Dictionary<Predicate, HashSet<Predicate>> dCandidateMutex = new Dictionary<Predicate, HashSet<Predicate>>();
            Dictionary<Predicate, HashSet<Predicate>> dMutex = new Dictionary<Predicate, HashSet<Predicate>>();
            Dictionary<Predicate, HashSet<Predicate>> dNotMutex = new Dictionary<Predicate, HashSet<Predicate>>();
            foreach (Action a in lActions)
            {
                HashSet<Predicate> lPreconditions = a.Preconditions.GetAllPredicates();
                HashSet<Predicate> lEffects = a.GetMandatoryEffects();
                foreach (Predicate p in lEffects)
                {
                    if (p.Negation == false)
                    {
                        foreach (Predicate pTag in lEffects)
                        {
                            if (!pTag.Equals(p) && pTag.Negation == false)
                            {
                                if (!dNotMutex.ContainsKey(p))
                                    dNotMutex[p] = new HashSet<Predicate>();
                                dNotMutex[p].Add(pTag);
                                if (!dNotMutex.ContainsKey(pTag))
                                    dNotMutex[pTag] = new HashSet<Predicate>();
                                dNotMutex[p].Add(p);
                            }
                        }
                    }
                }
                foreach (Predicate p in lPreconditions)
                {
                    Predicate pNegate = p.Negate();
                    if (lEffects.Contains(pNegate))
                    {
                        HashSet<Predicate> lCandidates = new HashSet<Predicate>();
                        foreach (Predicate pTag in lEffects)
                        {
                            //if (pTag.Name == p.Name && pTag.Negation == p.Negation && !pTag.Equals(p))
                            if (p.Similarity(pTag) > 0)
                            {
                                lCandidates.Add(pTag);
                                //if (p.ToString() == "(in-stack B2 S0)" || pTag.ToString() == "(clear B0 S0)")
                                //    Console.Write("*");

                            }
                        }
                        if (!dCandidateMutex.ContainsKey(p))
                            dCandidateMutex[p] = lCandidates;
                        else
                            dCandidateMutex[p].UnionWith(lCandidates);
                    }

                }

            }
            foreach (Action a in lActions)
            {
                List<Predicate> lEffects = new List<Predicate>(a.GetMandatoryEffects());
                for (int i = 0; i < lEffects.Count; i++)
                {
                    for (int j = i + 1; j < lEffects.Count; j++)
                    {
                        if (dCandidateMutex.ContainsKey(lEffects[i]))
                            dCandidateMutex[lEffects[i]].Remove(lEffects[j]);
                        if (dCandidateMutex.ContainsKey(lEffects[j]))
                            dCandidateMutex[lEffects[j]].Remove(lEffects[i]);
                    }
                }

            }
            foreach (Predicate p in dCandidateMutex.Keys)
            {
                dMutex[p] = new HashSet<Predicate>();
                foreach (Predicate pTag in dCandidateMutex[p])
                {
                    if (dCandidateMutex[pTag].Contains(p))
                        dMutex[p].Add(pTag);
                }

            }
            List<HashSet<Predicate>> lMutexClosure = new List<HashSet<Predicate>>();
            foreach (Predicate p in dMutex.Keys)
            {
                foreach (Predicate pMutex in dMutex[p])
                {
                    HashSet<Predicate> hsMutex = new HashSet<Predicate>();
                    hsMutex.Add(p);
                    hsMutex.Add(pMutex);
                    Dictionary<Argument, HashSet<Predicate>> dInvariants = FindInvariantGroups(p, hsMutex);

                    foreach (KeyValuePair<Argument, HashSet<Predicate>> pair in dInvariants)
                    {
                        if (pair.Value.Count > 1)
                        {
                            HashSet<Predicate> hsClosure = new HashSet<Predicate>(pair.Value);
                            IdentifyMutexClosure(p, pair.Key, pMutex, dMutex, dNotMutex, hsClosure);
                            //                            if (p.Name == "in-stack" || pMutex.Name == "in-stack")
                            //                                Console.Write("*");
                            lMutexClosure.Add(hsClosure);
                        }
                    }
                }
            }
            /*
            foreach (Predicate p in dMutex.Keys)
            {
                HashSet<Predicate> hsMutex = dMutex[p];
                Dictionary<Argument, HashSet<Predicate>> dInvariants = FindInvariantGroups(p, hsMutex);

                foreach (KeyValuePair<Argument, HashSet<Predicate>> pair in dInvariants)
                {
                    HashSet<Predicate> hsClosure = new HashSet<Predicate>(pair.Value);
                    hsClosure.Add(p);
                    foreach (Predicate pTag in pair.Value)
                    {
                        IdentifyMutexClosure(p, pair.Key, pTag, dMutex, hsClosure);
                    }
                    lMutexClosure.Add(hsClosure);
                }
            }
            */
            Dictionary<Predicate, HashSet<Predicate>> dMutexClosure = new Dictionary<Predicate, HashSet<Predicate>>();
            foreach (HashSet<Predicate> hsClosure in lMutexClosure)
            {
                List<Predicate> lClosure = new List<Predicate>(hsClosure);
                for (int i = 0; i < lClosure.Count; i++)
                {
                    if (!dMutexClosure.ContainsKey(lClosure[i]))
                        dMutexClosure[lClosure[i]] = new HashSet<Predicate>();
                    for (int j = i + 1; j < hsClosure.Count; j++)
                    {
                        if (!dMutexClosure.ContainsKey(lClosure[j]))
                            dMutexClosure[lClosure[j]] = new HashSet<Predicate>();
                        dMutexClosure[lClosure[i]].Add(lClosure[j]);
                        dMutexClosure[lClosure[j]].Add(lClosure[i]);
                    }
                }
            }

            return dMutexClosure;
        }


        public class Pair<T>
        {
            public T T1 { get; private set; }
            public T T2 { get; private set; }
            private int m_iHash;
            public Pair(T t1, T t2)
            {
                T1 = t1;
                T2 = t2;
                m_iHash = 0;
            }
            public override bool Equals(object obj)
            {
                if (obj is Pair<T>)
                {
                    Pair<T> p = (Pair<T>)obj;
                    return T1.Equals(p.T1) && T2.Equals(p.T2) || T1.Equals(p.T2) && T2.Equals(p.T1);
                }
                return false;
            }
            public override int GetHashCode()
            {
                if (m_iHash == 0)
                    m_iHash = T1.GetHashCode() + T2.GetHashCode();
                return m_iHash;
            }
        }

        public Dictionary<Predicate, HashSet<Predicate>> IdentifyInvariantsGraphplan(List<Action> lActions)
        {

            HashSet<Pair<Action>> hsActionMutex = new HashSet<Pair<Action>>();
            HashSet<Pair<Predicate>> hsPropositionMutex = new HashSet<Pair<Predicate>>();
            Dictionary<Predicate, HashSet<Action>> dMapEffectsToActions = new Dictionary<Predicate, HashSet<Action>>();
            for (int iAction = 0; iAction < lActions.Count; iAction++)
            {
                Action a = lActions[iAction];
                HashSet<Predicate> lPreconditions = a.Preconditions.GetAllPredicates();
                HashSet<Predicate> lEffects = a.GetMandatoryEffects();
                for (int iOtherAction = iAction + 1; iOtherAction < lActions.Count; iOtherAction++)
                {
                    Action aOther = lActions[iOtherAction];
                    HashSet<Predicate> lOtherPreconditions = aOther.Preconditions.GetAllPredicates();
                    HashSet<Predicate> lOtherEffects = aOther.GetMandatoryEffects();
                    bool bMutex = false;
                    foreach (Predicate p in lPreconditions)
                    {
                        Predicate pNegate = p.Negate();
                        if (lOtherPreconditions.Contains(pNegate))
                        {
                            bMutex = true;
                            break;
                        }
                    }
                    if (!bMutex)
                    {
                        foreach (Predicate p in lEffects)
                        {
                            Predicate pNegate = p.Negate();
                            if (lOtherPreconditions.Contains(pNegate) || lOtherEffects.Contains(pNegate))
                            {
                                bMutex = true;
                                break;
                            }
                        }
                    }
                    if (!bMutex)
                    {
                        foreach (Predicate p in lOtherEffects)
                        {
                            Predicate pNegate = p.Negate();
                            if (lPreconditions.Contains(pNegate))
                            {
                                bMutex = true;
                                break;
                            }
                        }
                    }
                    if (bMutex)
                        hsActionMutex.Add(new Pair<Action>(a, aOther));
                }
            }
            return null;
        }

        private HashSet<Argument> FindInvariants(Predicate p, HashSet<Predicate> hsMutex)
        {
            HashSet<Argument> hsInvariants = new HashSet<Argument>();
            if (p is GroundedPredicate)
            {
                GroundedPredicate gpGrounded = (GroundedPredicate)p;
                for (int i = 0; i < gpGrounded.Constants.Count; i++)
                {
                    Constant c = gpGrounded.Constants[i];
                    bool bInAll = true;
                    foreach (GroundedPredicate gp in hsMutex)
                    {
                        if (!gp.Constants[i].Equals(c))
                        {
                            bInAll = false;
                            break;
                        }
                    }
                    if (bInAll)
                        hsInvariants.Add(c);
                }
            }
            return hsInvariants;
        }

        private Dictionary<Argument, HashSet<Predicate>> FindInvariantGroups(Predicate p, HashSet<Predicate> hsMutex)
        {
            Dictionary<Argument, HashSet<Predicate>> dInvariantGroups = new Dictionary<Argument, HashSet<Predicate>>();
            if (p is GroundedPredicate)
            {
                GroundedPredicate gpGrounded = (GroundedPredicate)p;
                for (int i = 0; i < gpGrounded.Constants.Count; i++)
                {
                    HashSet<Predicate> hsInvariants = new HashSet<Predicate>();
                    Constant c = gpGrounded.Constants[i];
                    foreach (GroundedPredicate gp in hsMutex)
                    {
                        if (gp.Name == p.Name)
                        {
                            if (gp.Constants[i].Equals(c))
                            {
                                hsInvariants.Add(gp);
                            }
                        }
                        else
                        {
                            if (gp.Constants.Contains(c))
                            {
                                hsInvariants.Add(gp);
                            }

                        }
                    }
                    if (hsInvariants.Count > 0)
                        dInvariantGroups[c] = hsInvariants;
                }
            }
            return dInvariantGroups;
        }

        private void IdentifyMutexClosure(Predicate pOrg, Argument aInvariant, Predicate pCurrent, Dictionary<Predicate, HashSet<Predicate>> dMutex, Dictionary<Predicate, HashSet<Predicate>> dNotMutex, HashSet<Predicate> hsClosure)
        {
            HashSet<Predicate> hsCandidates = dMutex[pCurrent];
            foreach (Predicate p in hsCandidates)
            {
                if (!hsClosure.Contains(p))
                {
                    if (pOrg.SameInvariant(p, aInvariant))
                    {
                        bool bValid = true;
                        foreach (Predicate pTag in hsClosure)
                            if (dNotMutex.ContainsKey(p) && dNotMutex[p].Contains(pTag))
                                bValid = false;
                        if (bValid)
                        {
                            hsClosure.Add(p);
                            IdentifyMutexClosure(pOrg, aInvariant, p, dMutex, dNotMutex, hsClosure);
                        }
                    }

                }
            }

        }


        private List<List<string>> GetSASVariables(string sPath, string sDomainFileName, string sProblemFileName)
        {
            Process p = new Process();
            p.StartInfo.WorkingDirectory = sPath;
            //p.StartInfo.FileName = Program.BASE_PATH + @"\PDDL\Planners\ff.exe";
            p.StartInfo.FileName = @"C:\Program Files\Python\Python.exe";
            p.StartInfo.Arguments = @"D:\Research\projects\PDDL\Planners\FD\translate\translate.py";
            p.StartInfo.Arguments += " " + sDomainFileName + " " + sProblemFileName;
            //p.StartInfo.WorkingDirectory = @"D:\Research\projects\PDDL\Planners\FD\translate";
            p.StartInfo.WorkingDirectory = sPath;
            p.StartInfo.UseShellExecute = false;

            p.Start();
            p.WaitForExit();

            List<List<string>> lVariables = new List<List<string>>();
            StreamReader srSAS = new StreamReader(sPath + "\\output.sas");
            while (!srSAS.EndOfStream)
            {
                string sLine = srSAS.ReadLine().Trim();
                if (sLine == "begin_variable")
                {
                    bool bVarEnded = false;
                    List<string> lAtoms = new List<string>();
                    while (!srSAS.EndOfStream && !bVarEnded)
                    {
                        string sAtomLine = srSAS.ReadLine().Trim();
                        if (sAtomLine.StartsWith("Atom"))
                        {
                            lAtoms.Add(sAtomLine.Replace("Atom ", ""));

                        }
                        if (sAtomLine == "end_variable")
                            bVarEnded = true;
                    }
                    lVariables.Add(lAtoms);
                }

            }

            return lVariables;

        }
        public Dictionary<GroundedPredicate, HashSet<GroundedPredicate>> IdentifyMutexSAS(string sPath, string sDomainFileName, string sProblemFileName)
        {
            Dictionary<GroundedPredicate, HashSet<GroundedPredicate>> dMutex = new Dictionary<GroundedPredicate, HashSet<GroundedPredicate>>();
            List<List<string>> lVariables = GetSASVariables(sPath, sDomainFileName, sProblemFileName);
            foreach (List<string> lVariableAtoms in lVariables)
            {
                List<GroundedPredicate> lPredicates = new List<GroundedPredicate>();
                foreach (string sAtom in lVariableAtoms)
                {
                    string[] aAtom = sAtom.Split(new char[] { '(', ',', ')', ' ' }, StringSplitOptions.RemoveEmptyEntries);
                    Predicate pAtom = null;
                    List<Constant> lConstants = new List<Constant>();
                    foreach (Predicate p in Predicates)
                    {
                        if (p.Name == aAtom[0])
                        {
                            pAtom = p;
                        }
                    }
                    for (int i = 1; i < aAtom.Length; i++)
                    {
                        foreach (Constant c in Constants)
                        {
                            if (c.Name == aAtom[i])
                                lConstants.Add(c);
                        }
                    }
                    GroundedPredicate gp = null;
                    if (pAtom is GroundedPredicate)
                        gp = (GroundedPredicate)pAtom;
                    else
                    {
                        gp = new GroundedPredicate(pAtom.Name);
                        foreach (Constant c in lConstants)
                            gp.AddConstant(c);
                    }
                    lPredicates.Add(gp);
                    dMutex[gp] = new HashSet<GroundedPredicate>();
                }
                foreach (GroundedPredicate gp in lPredicates)
                {
                    foreach (GroundedPredicate gpOther in lPredicates)
                    {
                        if (gp != gpOther)
                            dMutex[gp].Add(gpOther);
                    }

                }
            }
            return dMutex;
        }

        public HashSet<GroundedPredicate> ComputeFalseInitialFacts(Dictionary<string, List<Predicate>> dTags)
        {
            HashSet<string> lExclude = new HashSet<string>();
            foreach (Predicate p in Predicates)
            {
                if (AlwaysKnown(p))
                    lExclude.Add(p.Name);
            }
            HashSet<GroundedPredicate> hsNegatives = GroundAllPredicates(lExclude);
            foreach (List<Predicate> l in dTags.Values)
            {
                foreach (GroundedPredicate gp in l)
                {
                    hsNegatives.Remove(gp);
                    hsNegatives.Remove((GroundedPredicate)gp.Negate());
                }
            }
            return hsNegatives;
        }


        public void AddObservables(Formula f)
        {
            HashSet<Predicate> lPredicates = f.GetAllPredicates();
            foreach (Predicate p in lPredicates)
            {
                bool bExists = false;
                foreach (Predicate pExisting in Observables)
                    if (pExisting.Name == p.Name)
                        bExists = true;
                if (!bExists)
                {
                    ParametrizedPredicate pp = new ParametrizedPredicate(p.Name);
                    int cConstants = 0;
                    foreach (Argument a in ((ParametrizedPredicate)p).Parameters)
                    {
                        if (a is Parameter)
                            pp.AddParameter(a);
                        else
                        {
                            Parameter param = new Parameter(a.Type, "?param" + cConstants);
                            cConstants++;
                            pp.AddParameter(param);
                        }
                    }
                    Observables.Add(pp);
                }
            }
        }

    }
}
