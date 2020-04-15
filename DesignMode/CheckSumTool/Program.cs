using System;
using System.Threading.Tasks;

namespace CheckSumTool
{
    public class Program
    {
        private const int Ten = 10;
        public static void Main(string[] args)
        {
            do
            {
                Console.WriteLine("Please Enter Your 10 Nmi Number! And if want to exit please press q");
                var nmi = Console.ReadLine();
                if (nmi.ToLower().Equals("q"))
                {
                    break;
                }
                if (string.IsNullOrWhiteSpace(nmi) || nmi.Length != Ten)
                {
                    Console.WriteLine($"invalid nmi");
                }
                else
                {
                    Console.WriteLine($"Check Sum is {CalculateNmiCheckSum(nmi)}");
                }
            } while (true);
        }

        private static string CalculateNmiCheckSum(string input)
        {
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
