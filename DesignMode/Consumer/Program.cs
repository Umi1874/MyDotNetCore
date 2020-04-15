using System;
using System.Threading.Tasks;
using MassTransit;

namespace Consumer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.Title = "MassTransit Server";

            var bus = Bus.Factory.CreateUsingRabbitMq(cfg =>
            {
                cfg.Host(new Uri("rabbitmq://localhost"), "MassTest", hst =>
                {
                    hst.Username("umi1874");
                    hst.Password("youhai123");
                });
            });
            bus.Start();

            bus.ConnectReceiveEndpoint("TestQueneT", ep =>
            {
                ep.Consumer<TestConsumerClient>();
                ep.Consumer<TestConsumerAgent>();
            });

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();

            bus.Stop();
        }
    }

    public class Client
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime Birthdate { get; set; }
        public string Message { get; set; }
    }

    public class TestConsumerClient : IConsumer<Client>
    {
        public async Task Consume(ConsumeContext<Client> context)
        {
            Console.ForegroundColor = ConsoleColor.Red;
            await Console.Out.WriteLineAsync($"Receive message: {context.Message.Id}, {context.Message.Name}, {context.Message.Birthdate.ToString()}, {context.Message.Message}");
            Console.ResetColor();
        }
    }
    public class TestConsumerAgent : IConsumer<Agent>
    {
        public async Task Consume(ConsumeContext<Agent> context)
        {
            Console.ForegroundColor = ConsoleColor.Green;
            await Console.Out.WriteLineAsync($"Receive message: {context.Message.AgentCode}, {context.Message.AgentName}, {context.Message.AgentRole}, {context.Message.Message}");
            Console.ResetColor();
        }
    }

    public class Agent
    {
        public int AgentCode { get; set; }
        public string AgentName { get; set; }
        public string AgentRole { get; set; }
        public string Message { get; set; }
    }
}
