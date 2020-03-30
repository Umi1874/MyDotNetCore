using System;
using System.IO;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace AppTest
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            var config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appSettings.json",false)
                .AddEnvironmentVariables()
                .Build(); ;

            var serviceCollection = new ServiceCollection();

            ConfigureServices(serviceCollection, config);

            var provider = serviceCollection.BuildServiceProvider();

            var hostService = provider.GetService<HostService>();
            hostService.RunAsync();//统一入口服务

            Console.WriteLine("提示：程序已正常启动运行，按任意键停止运行并关闭程序...");

            Console.ReadLine();
        }

        private static void ConfigureServices(IServiceCollection services, IConfigurationRoot config)
        {
            services.AddLogging(configLogging => //设置日志组件
            {
                configLogging.SetMinimumLevel(LogLevel.Information);
                configLogging.AddConsole();
            });
            services.AddScoped<IConfiguration>(p => config);
            services.AddScoped<HostService>();
        }
    }
}
