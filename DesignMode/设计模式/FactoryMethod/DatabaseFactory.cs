namespace FactoryMethod
{
    public class DatabaseFactory : ILoggerFactory
    {
        public ILogger CreateLogger()
        {
            ILogger logger = new DatabaseLogger();
            return logger;
        }
    }
}