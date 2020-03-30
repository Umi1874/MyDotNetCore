using System;

namespace ConsoleApp1
{
    public class Program
    {
        public static void Main(string[] args)
        {
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
        }
    }

    public class BaseClass
    {
        public virtual string GetString()
        {
            return "我是基类";
        }
    }

    public class OverrideBase : BaseClass
    {
        public override string GetString()
        {
            return "我重写了基类";
        }
    }

    public class NewBase : BaseClass
    {
        public new virtual string GetString()
        {
            return "我隐藏了基类";
        }
    }
}
