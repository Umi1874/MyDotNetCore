using System;
using System.Threading.Tasks;
using Consumer;
using MassTransit;

namespace Sender
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.Title = "MassTransit Client";

            var bus = Bus.Factory.CreateUsingRabbitMq(cfg =>
            {
                var host = cfg.Host(new Uri("rabbitmq://localhost"), "MassTest", hst =>
                 {
                     hst.Username("umi1874");
                     hst.Password("youhai123");
                 });
            });

            var uri = new Uri("queue:TestQueneT");
            var message = Console.ReadLine();

            while (message != null)
            {
                Task.Run(() => SendCommand(bus, uri, message)).Wait();
                message = Console.ReadLine();
            }

            Console.ReadKey();
        }

        private static async void SendCommand(ISendEndpointProvider bus, Uri sendToUri, string message)
        {
            var endPoint = await bus.GetSendEndpoint(sendToUri);
            if (message.Contains("233"))
            {
                var command = new Agent()
                {
                    AgentCode = 100001,
                    AgentName = "Umi",
                    AgentRole = "UmiAdmin",
                    Message = message
                };
                await endPoint.Send(command);
                Console.WriteLine($"You Sended : Id = {command.AgentCode}, Name = {command.AgentName}, Message = {command.Message}");
            }
            else
            {
                var command = new Client()
                {
                    Id = 100001,
                    Name = "Umi",
                    Birthdate = DateTime.Now.AddYears(-18),
                    Message = message
                };
                await endPoint.Send(command);
                Console.WriteLine($"You Sended : Id = {command.Id}, Name = {command.Name}, Message = {command.Message}");
            }
        }
    }

}
