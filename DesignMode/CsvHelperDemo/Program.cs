using System;
using System.Globalization;
using System.IO;
using System.Linq;
using CsvHelper;
using CsvHelper.Configuration;

namespace CsvHelperDemo
{
    class Program
    {
        static void Main(string[] args)
        {

            /* using (var reader = new StreamReader("C:\\CCes\\Payment\\2020-03-22.csv"))
             using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
             {
                 // csv.Configuration.RegisterClassMap<WeChatPayDtoMap>();
                 csv.Configuration.MissingFieldFound = null;
                 // var records = csv.GetRecords<WeChatPayDto>().ToList();

                 var record = new WeChatPayDto();
                 var records = csv.EnumerateRecords(record);

                 if (!records.Any())
                 {
                     Console.WriteLine("empty file");
                 }

                 foreach (var x in records)
                 {
                     Console.WriteLine($"{x.ClientId}-{x.Amount}-{x.PaymentDate}-{x.TransactionReferenceNumber}");
                 }

                 var s = records.Where(x => x.ClientId.StartsWith("1")).ToList();
             }

             Console.WriteLine();*/
            var result = File.ReadAllLines(@"C:\CCes\Payment\36110320.DAT");
            DateTimeFormatInfo dtFormat = new DateTimeFormatInfo();
            dtFormat.ShortDatePattern = "dd/MM/yyyy";
            for (int i = 0; i < result.Length; i++)
            {
                var dto = result[i];
                if ((dto.StartsWith("1") || dto.StartsWith("5")) && i != 0)
                {
                    var t1 = dto.Substring(13, 20);
                    var t2 = $"{dto.Substring(1, 2)}/{dto.Substring(3, 2)}/20{dto.Substring(5, 2)}";
                    DateTime dt = Convert.ToDateTime(t2, dtFormat);
                    var t3 = decimal.Parse(dto.Substring(75, 9).Replace("0", " ").Trim().Replace(" ", "0")) / 100;
                    var t4 = dto.Substring(84, 23).Trim();
                    var t5 = dto.Substring(64, 8);
                    Console.WriteLine(t1);
                    Console.WriteLine(dt);
                    Console.WriteLine(t3);
                    Console.WriteLine(t4);
                    Console.WriteLine(t5);
                }
            }

        }

        public class WeChatPayDto
        {
            public string ClientId { get; set; }

            public string Amount { get; set; }

            public string PaymentDate { get; set; }

            public string TransactionReferenceNumber { get; set; }
        }

        public sealed class WeChatPayDtoMap : ClassMap<WeChatPayDto>
        {
            public WeChatPayDtoMap()
            {
                Map(m => m.ClientId).Name("Client ID");
                Map(m => m.Amount).Name("Paid Amount in AUD");
                Map(m => m.PaymentDate).Name("Payment Date");
                Map(m => m.TransactionReferenceNumber).Name("Transaction Reference Number");
            }
        }
    }
}
