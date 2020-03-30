using System;
using ConsoleApp1.OverrideAndNew;

namespace ConsoleApp1
{
    public class Program
    {
        public static void Main(string[] args)
        {
            /**
             * 重写与隐藏
             */
            OverrideBase ob = new OverrideBase();
            NewBase nb = new NewBase();

            Console.WriteLine(ob.ToString() + ":" + ob.GetString());
            Console.WriteLine(nb.ToString() + ":" + nb.GetString());

            Console.WriteLine();

            BaseClass obc = ob as BaseClass;
            BaseClass nbc = nb as BaseClass;

            Console.WriteLine(obc.ToString() + ":" + obc.GetString());
            Console.WriteLine(nbc.ToString() + ":" + nbc.GetString());

            Console.ReadKey();

            /*
             * String Builder
             */
        }
    }
}
