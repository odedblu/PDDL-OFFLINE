using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ContingentToFOND
{
    public class ConditionalPlanTreeNode
    {
        public int ID { get; set; }
        public Action Action { get; set; }
        public ConditionalPlanTreeNode SingleChild { get; set; }
        public ConditionalPlanTreeNode FalseObservationChild { get; set; }
        public ConditionalPlanTreeNode TrueObservationChild { get; set; }

        private static int CountNodes = 0;

        public ConditionalPlanTreeNode()
        {
            ID = CountNodes++;
        }

        private string ToString(string sIndent)
        {
            if (Action == null)
                return ")goal";
            string s = sIndent + ID + ") " + Action.Name + "\n";
            if (SingleChild != null)
                s += SingleChild.ToString(sIndent);
            else
            {
                s += "branching...\n";
                if (FalseObservationChild != null)
                    s += FalseObservationChild.ToString(sIndent + "\t");
                else
                    s += "Can't be false";
                s += "\n";
                if (TrueObservationChild != null)
                    s += TrueObservationChild.ToString(sIndent + "\t");
                else
                    s += "Can't be true";
            }
            return s;
        }


        public override string ToString()
        {
            return ToString("");
        }
    }
}
