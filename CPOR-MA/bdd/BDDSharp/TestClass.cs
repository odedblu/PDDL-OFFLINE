using System;

namespace UCLouvain.BDDSharp
{
    class TestClass
    {
        static void Main(string[] args)
        {
            System.Console.WriteLine(args.Length);
            var manager = new BDDManager(3);
        }
    }
}