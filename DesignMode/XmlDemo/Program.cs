using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace XmlDemo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            DemoModel test = new DemoModel();
            test.crn = "308067969C";
            test.cnfrmDate = null;
            test.pcode = "3066";
            test.id = "3321";
            var rst1s = new List<rst1>();
            rst1s.Add(new rst1()
            {
                cnfrmDate = DateTime.Now.ToShortDateString()
            });
            rst1s.Add(new rst1()
            {
                cnfrmDate = DateTime.Now.ToShortDateString()
            });
            test.rst1s = rst1s;
            var result = SerializeToAseXml(test);
            
            Console.WriteLine(result);
        }

        private static string SerializeToAseXml<T>(T item)
        {
            XmlWriterSettings settings = new XmlWriterSettings();
            //去除xml声明
            settings.OmitXmlDeclaration = true;
            settings.Indent = true;
            settings.Encoding = Encoding.Default;
            using (var stringWriter = new StringWriter())
            using (XmlWriter xmlWriter = XmlWriter.Create(stringWriter, settings))
            {
                var namespaces = new XmlSerializerNamespaces();
                namespaces.Add("", "");
                var responseSerializer = new XmlSerializer(typeof(T));
                responseSerializer.Serialize(xmlWriter, item, namespaces);
                string xml = stringWriter.ToString();
                return xml;
            }
        }
    }
}
