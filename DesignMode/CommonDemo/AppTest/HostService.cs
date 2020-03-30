using System;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace AppTest
{
    public class HostService
    {
        private readonly IConfiguration _config;
        private readonly ILogger<HostService> _logger;

        public HostService(IConfiguration config, ILogger<HostService> logger)
        {
            _config = config;
            _logger = logger;
        }

        public void RunAsync()
        {
            Task.Run((Action)Execute);
        }

        /// <summary>
        /// 控制台核心执行入口方法
        /// </summary>
        private void Execute()
        {
            //TODO 业务逻辑代码，如下模拟
            Stopwatch stopwatch = Stopwatch.StartNew();
            for (int i = 1; i <= 100; i++)
            {
                Console.WriteLine("test WriteLine:" + i);
                Thread.Sleep(100);
            }

            stopwatch.Stop();

            _logger.LogInformation("Logging - Execute Elapsed Times:{}ms", stopwatch.ElapsedMilliseconds);
        }
    }
}