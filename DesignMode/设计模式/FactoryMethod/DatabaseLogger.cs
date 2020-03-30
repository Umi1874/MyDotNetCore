using System;

namespace FactoryMethod
{
    public class DatabaseLogger: ILogger
    {
        public void WriteLog()
        {
            Console.WriteLine("Database Logger");
        }
    }
}