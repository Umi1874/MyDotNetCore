namespace FactoryMethod
{
    public class FileLoggerFactory : ILoggerFactory
    {
        public ILogger CreateLogger()
        {
            ILogger logger = new FileLogger();
            return logger;
        }
    }
}