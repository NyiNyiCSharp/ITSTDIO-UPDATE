using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("OrderFromCart")]
    public class Order:BaseEntity
    {
        public string PhotoPath { get; set; }
        public string UserId { get; set; }
        [ForeignKey("UserId")]
        public string UserName { get; set; }
        public string ItemName { get; set; }
        public string Quantity { get; set; }
        public string Address { get; set; }
        public int PhoneNumber { get; set; }
        public int TotalPrice { get; set; }
        
        public string Price { get; set; }
       
    }
}
