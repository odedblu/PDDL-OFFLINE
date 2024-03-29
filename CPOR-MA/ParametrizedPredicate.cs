﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CPOR_MA
{
    public class ParametrizedPredicate : Predicate
    {
        public IEnumerable<Argument> Parameters
        {
            get
            { return m_lParameters; }
        }
        private List<Argument> m_lParameters;
        public bool Parameterized { get; private set; }
        public ParametrizedPredicate(string sName)
            : base(sName)
        {
            m_lParameters = new List<Argument>();
            Parameterized = false;
        }
        public ParametrizedPredicate(string sName, bool bNegate)
           : base(sName)
        {
            m_lParameters = new List<Argument>();
            Parameterized = false;
            Negation = bNegate;
        }
        public ParametrizedPredicate(ParametrizedPredicate pp)
            : base(pp.Name)
        {
            m_lParameters = new List<Argument>(pp.m_lParameters);
            Parameterized = pp.Parameterized;
        }
        protected override string GetString()
        {
            string s = "";
            if (Negation)
                s = "(not ";
            s += "(" + Name + " " + Parser.ListToString(m_lParameters) + ")";
            if (Negation)
                s += ")";
            return s;
        }

        public string getPredicate()
        {
            string s = "";
            if (Negation)
                s = "(not ";
            s += "(" + Name + " "; 
            foreach(Argument str in m_lParameters)
            {
                s = s + str + " - " + str.Type + " ";
            }
            s = s + ")";
            if (Negation)
                s += ")";
            return s;
        }

        public List<string> getPredicateType()
        {
            List<string> list = new List<string>();
            foreach (Argument str in m_lParameters)
            {
                if (str.Type.Equals("agent"))
                    list.Add(str.ToString());
            }
            return list;
        }

        public void AddParameter(Argument a)
        {
            if (a is Parameter)
                Parameterized = true;
            m_lParameters.Add(a);

        }

        public override bool Equals(object obj)
        {
            if (obj is ParametrizedPredicate)
            {
                ParametrizedPredicate pp = (ParametrizedPredicate)obj;
                if (pp.Name != Name)
                    return false;
                if (m_lParameters.Count != pp.m_lParameters.Count)
                    return false;

                for (int iParameter = 0; iParameter < m_lParameters.Count; iParameter++)
                    if (!m_lParameters[iParameter].Equals(pp.m_lParameters[iParameter]))
                        return false;
                return Negation == pp.Negation;
            }
            return false;
        }

        public override bool ConsistentWith(Predicate pState)
        {
            //TODO
            throw new NotImplementedException();
        }

        public override Predicate Negate()
        {
            ParametrizedPredicate pNegate = new ParametrizedPredicate(Name);
            pNegate.Negation = !Negation;
            pNegate.m_lParameters = new List<Argument>(m_lParameters);
            return pNegate;
        }

        public GroundedPredicate Ground(Dictionary<string, Constant> dBindings)
        {
            GroundedPredicate gpred = GroundedPredicateFactory.Get(Name, m_lParameters, dBindings, Negation);
            if (gpred != null)
            {
                return gpred;
            }
            gpred = new GroundedPredicate(Name, Negation);
            foreach (Argument a in Parameters)
            {
                if (a is Parameter)
                {
                    if (!dBindings.ContainsKey(a.Name))
                        return null;
                    gpred.AddConstant(dBindings[a.Name]);
                }
                else
                    gpred.AddConstant((Constant)a);
            }
            GroundedPredicateFactory.Add(Name, m_lParameters, dBindings, gpred, Negation);
            return gpred;
        }

        public Predicate PartiallyGround(Dictionary<string, Constant> dBindings)
        {
            GroundedPredicate gpred = new GroundedPredicate(Name, Negation);
            ParametrizedPredicate ppred = new ParametrizedPredicate(Name, Negation);
            bool bAllGrounded = true;
            foreach (Argument a in Parameters)
            {
                if (a is Parameter)
                {
                    if (!dBindings.ContainsKey(a.Name))
                    {
                        ppred.AddParameter(a);
                        bAllGrounded = false;
                    }
                    else
                    {
                        ppred.AddParameter(dBindings[a.Name]);
                        gpred.AddConstant(dBindings[a.Name]);
                    }
                }
                else
                {
                    gpred.AddConstant((Constant)a);
                    ppred.AddParameter(a);
                }
            }
            if (bAllGrounded)
            {
                if (gpred.Name == "=")
                {
                    bool bSame = gpred.Constants[0].Equals(gpred.Constants[1]);
                    if (bSame && !Negation || !bSame && Negation)
                        return Domain.TRUE_PREDICATE;
                    else
                        return Domain.FALSE_PREDICATE;
                }
                return gpred;
            }
            else
                return ppred;
        }

        public Dictionary<string, Constant> Match(GroundedPredicate pOther, Dictionary<string, Constant> dBindings)
        {
            if (pOther.Name != Name)
                return null;
            if (pOther.Negation != Negation)
                return null;
            if (pOther.Constants.Count != m_lParameters.Count)
                return null;
            int i = 0;
            Dictionary<string, Constant> dNewBindings = new Dictionary<string, Constant>();
            for (i = 0; i < pOther.Constants.Count; i++)
            {
                Argument a = m_lParameters[i];
                if (a is Constant)
                {
                    if (pOther.Constants[i].Name != a.Name)
                        return null;
                }
                else if (a is Parameter)
                {
                    if (dBindings.ContainsKey(a.Name))
                    {
                        if (!pOther.Constants[i].Equals(dBindings[a.Name]))
                            return null;
                    }
                    else
                        dNewBindings[a.Name] = pOther.Constants[i];
                }
            }
            return dNewBindings;
        }

        public override bool IsContainedIn(List<Predicate> lPredicates)
        {
            throw new NotImplementedException();
        }

        public override Predicate GenerateKnowGiven(string sTag, bool bKnowWhether)
        {
            if (bKnowWhether)
                throw new NotImplementedException("There should no longer be any Know Whether prediate");
            ParametrizedPredicate pKGiven = null;
            if (bKnowWhether)
                pKGiven = new ParametrizedPredicate("KWGiven" + Name);
            else
                pKGiven = new ParametrizedPredicate("KGiven" + Name);
            foreach (Argument a in Parameters)
            {
                pKGiven.AddParameter(a);
            }
            pKGiven.AddParameter(new Parameter(Domain.TAG, sTag));
            if (!bKnowWhether)
            {
                if (Negation)
                    pKGiven.AddParameter(new Parameter(Domain.VALUE, Domain.FALSE_VALUE));
                else
                    pKGiven.AddParameter(new Parameter(Domain.VALUE, Domain.TRUE_VALUE));
            }
            return pKGiven;
        }
        public override Predicate GenerateKnowGiven(string sTag, Argument cAgent)
        {
            ParametrizedPredicate pKGiven = null;
            pKGiven = new ParametrizedPredicate("KGiven" + Name);
            foreach (Argument a in Parameters)
            {
                pKGiven.AddParameter(a);
            }
            pKGiven.AddParameter(new Parameter(Domain.TAG, sTag));
            pKGiven.AddParameter(cAgent);
            if (Negation)
                pKGiven.AddParameter(new Parameter(Domain.VALUE, Domain.FALSE_VALUE));
            else
                pKGiven.AddParameter(new Parameter(Domain.VALUE, Domain.TRUE_VALUE));

            return pKGiven;
        }
        /*
        public override Predicate GenerateKnowWhetherGiven(string sTag, Argument cAgent)
        {
            ParametrizedPredicate pKGiven = null;
            pKGiven = new ParametrizedPredicate("KWGiven" + Name);
            foreach (Argument a in Parameters)
            {
                pKGiven.AddParameter(a);
            }
            pKGiven.AddParameter(new Parameter(Domain.TAG, sTag));
            pKGiven.AddParameter(cAgent);

            return pKGiven;
        }
        */
        public override Predicate GenerateGiven(string sTag)
        {
            ParametrizedPredicate pGiven = new ParametrizedPredicate("Given" + Name);
            foreach (Argument a in Parameters)
            {
                pGiven.AddParameter(a);
            }
            pGiven.AddParameter(new Parameter(Domain.TAG, sTag));
            if (Negation)
                return pGiven.Negate();
            return pGiven;
        }

        public override Predicate ToTag()
        {
            ParametrizedPredicate ppNew = new ParametrizedPredicate(this);
            if (Negation)
                ppNew.Name = ppNew.Name + "-Remove";
            else
                ppNew.Name = ppNew.Name + "-Add";
            ppNew.Negation = false;

            return ppNew;
        }

        public override int Similarity(Predicate p)
        {
            throw new NotImplementedException();
        }

        public override bool SameInvariant(Predicate p, Argument aInvariant)
        {
            throw new NotImplementedException();
        }

        protected override int ComputeHashCode()
        {
            int iSum = 0;
            foreach (Argument a in Parameters)
            {
                iSum += a.GetHashCode();
                iSum *= 100;
            }
            iSum += m_iName;
            return iSum;
        }

        public override Predicate Clone()
        {
            return new ParametrizedPredicate(this);
        }
    }
}
