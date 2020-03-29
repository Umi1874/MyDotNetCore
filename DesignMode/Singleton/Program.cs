using System;

namespace Singleton
{
    class Program
    {
        static void Main(string[] args)
        {
            var balancer = LoadBalancer.GetLoadBalancer();
            var balancer1 = LoadBalancer.GetLoadBalancer();
            var balancer2 = LoadBalancer.GetLoadBalancer();

            if (balancer == balancer1 && balancer == balancer2 && balancer1 == balancer2)
            {
                Console.WriteLine("It's Singleton");
            }

            balancer.AddServer(new CustomerServer()
            {
                Name = "Server 1"
            });

            balancer.AddServer(new CustomerServer()
            {
                Name = "Server 2"
            });

            balancer.AddServer(new CustomerServer()
            {
                Name = "Server 3"
            });

            for (int i = 0; i < 10; i++)
            {
                CustomerServer server = balancer.GetServer();
                Console.WriteLine("Req balance to " + server.Name);
            }

            Console.ReadKey();
        }
    }
}
