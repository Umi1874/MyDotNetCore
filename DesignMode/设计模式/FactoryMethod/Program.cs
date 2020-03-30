using System;

namespace FactoryMethod
{
    class Program
    {
        static void Main(string[] args)
        {
            ILoggerFactory factory = new FileLoggerFactory();
            if (factory == null)
            {
                return;
            }

            ILogger logger = factory.CreateLogger();
            logger.WriteLog();
        }
    }
}
