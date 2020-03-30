using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Net.NetworkInformation;
using System.Text;

namespace Singleton
{
    public class LoadBalancer
    {
        private static LoadBalancer instance = null;
        private IList<CustomerServer> serverList = null;
        private static readonly object syncLocker = new object();

        private LoadBalancer()
        {
            serverList = new List<CustomerServer>();
        }

        /*        public static LoadBalancer GetLoadBalancer()
                {
                    if (instance == null)
                    {
                        lock (syncLocker)
                        {
                            if (instance == null)
                            {
                                instance = new LoadBalancer();
                            }
                        }
                    }

                    return instance;
                }*/

        public static LoadBalancer GetLoadBalancer()
        {
            return Nested.instance;
        }

        class Nested
        {
            static Nested() { }
            internal static readonly LoadBalancer instance = new LoadBalancer();
        }
        public void AddServer(CustomerServer server)
        {
            serverList.Add(server);
        }

        public void RemoveServer(string serverName)
        {
            foreach (var server in serverList)
            {
                if (server.Name.Equals(serverName))
                {
                    serverList.Remove(server);
                    break;
                }
            }
        }

        private Random rand = new Random();
        public CustomerServer GetServer()
        {
            int index = rand.Next(serverList.Count);

            return serverList[index];
        }
    }
}
