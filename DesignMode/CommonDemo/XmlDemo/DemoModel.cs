using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace XmlDemo
{
    public class DemoModel
    {
        private string transactionIDField;
        public string crn { get; set; }
        public string cnfrmDate { get; set; }
        public string pcode { get; set; }

        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string id
        {
            get { return this.transactionIDField; }
            set { this.transactionIDField = value; }
        }

        [XmlElement("Attach")]
        public List<rst1> rst1s { get; set; }
    }
}
