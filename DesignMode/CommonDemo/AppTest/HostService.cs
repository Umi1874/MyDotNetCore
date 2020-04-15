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
        private const int Ten = 10;

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
            // checkSum小工具
            string input = "6220200414";
            var result = CalculateNmiCheckSum(input);
            Console.WriteLine(result);

        }

        private string CalculateNmiCheckSum(string input)
        {
            if (string.IsNullOrWhiteSpace(input) || input.Length != Ten)
            {
                throw new ArgumentException("invalid nmi");
            }

            string nmi = input.ToUpper();

            int value = 0;
            bool multiply = true;
            for (int i = nmi.Length; i > 0; i--)
            {
                int charCode = nmi[i - 1];
                if (multiply)
                {
                    charCode = charCode * 2;
                }

                multiply = !multiply;
                while (charCode >= 1)
                {
                    value += charCode % Ten;
                    charCode = charCode / Ten;
                }
            }

            int calculatedCheckSum = (Ten - (value % Ten)) % Ten;
            return calculatedCheckSum.ToString();
        }
    }
}