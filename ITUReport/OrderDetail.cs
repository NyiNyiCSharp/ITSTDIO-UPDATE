using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITUReport
{
    public class OrderDetail
    {
        public DateTime Date { get; set; }
        public string ItemName { get; set; }
        public int TotalPrice { get; set; }
        public string Price { get; set; }
        public string Quantity { get; set; }
    }
}
