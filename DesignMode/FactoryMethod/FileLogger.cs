using System;
using System.Collections.Generic;
using System.Text;

namespace FactoryMethod
{
    public class FileLogger :ILogger
    {
        public void WriteLog()
        {
            Console.WriteLine("File Log");
        }
    }
}
