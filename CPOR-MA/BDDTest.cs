using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UCLouvain.BDDSharp;

namespace CPOR_MA
{
    class BDDTest
    {
        public static void BDDTest1()
        {
            /*
            var manager = new BDDManager(3);
            var n1 = manager.Create(2, manager.Zero, manager.One);
            var n2 = manager.Create(2, manager.Zero, manager.Zero);
            var n3 = manager.Create(2, manager.Zero, manager.One);
            var n4 = manager.Create(2, manager.Zero, manager.One);

            var n31 = manager.Create(1, n1, n2);
            var n41 = manager.Create(1, n3, n4);
            var n5 = manager.Create(0, n31, n41);
            
            var res = manager.Reduce(n5);            

            foreach (BDDNode n in res.Nodes)
                Console.WriteLine(n);
            */
            var manager = new BDDManager(140);
            var n1 = manager.Create(102, manager.Zero, manager.Zero);
            var n2 = manager.Create(102, manager.Zero, manager.One);
            var n3 = manager.Create(102, manager.Zero, manager.Zero);
            var n4 = manager.Create(7, manager.One, manager.Zero);

            var n12 = manager.Create(6, n2, n1);
            var n34 = manager.Create(6, n4, n3);
            var n1234 = manager.Create(5, manager.One, n12);

            var res = manager.Reduce(n1234);

            foreach (BDDNode n in res.Nodes)
                Console.WriteLine(n);
        }

        public static void BDDTest2()
        {
            var manager = new BDDManager(10);
            var n1 = manager.Create(1, manager.One, manager.Zero);
            var n2 = manager.Create(1, manager.One, manager.Zero);
            var n3 = manager.Create(1, manager.One, manager.Zero);
            var n4 = manager.Create(1, manager.One, manager.Zero);

            var n12 = manager.Create(2, n2, n1);
            var n34 = manager.Create(2, n4, n3);
            var n1234 = manager.Create(0, n34, n12);

            var res = manager.Reduce(n1234);

            foreach (BDDNode n in res.Nodes)
                Console.WriteLine(n);
        }

        public static void BDDTest3()
        {
            var manager = new BDDManager(3);
            var n1 = manager.Create(1, manager.Zero, manager.One);
            var n2 = manager.Create(1, manager.Zero, manager.One);
            var n3 = manager.Create(1, manager.Zero, manager.One);
            var n4 = manager.Create(1, manager.Zero, manager.One);

            var n12 = manager.Create(2, n2, n1);
            var n34 = manager.Create(2, n4, n3);
            var n1234 = manager.Create(0, n34, n12);

            var res = manager.Reduce(n1234);

            foreach (BDDNode n in res.Nodes)
                Console.WriteLine(n);
        }

        public static void BDDTest4()
        {
            var manager = new BDDManager(3);
            var n1 = manager.Create(1, manager.Zero, manager.One);
            var n2 = manager.Create(1, manager.Zero, manager.Zero);
            var n3 = manager.Create(1, manager.Zero, manager.One);
            var n4 = manager.Create(1, manager.Zero, manager.One);

            var n12 = manager.Create(2, n2, n1);
            var n34 = manager.Create(2, n4, n3);
            var n1234 = manager.Create(0, n34, n12);

            var res = manager.Reduce(n12);

            foreach (BDDNode n in res.Nodes)
                Console.WriteLine(n);
        }


    }
}
