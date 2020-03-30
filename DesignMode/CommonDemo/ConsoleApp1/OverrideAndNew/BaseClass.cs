namespace ConsoleApp1.OverrideAndNew
{
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