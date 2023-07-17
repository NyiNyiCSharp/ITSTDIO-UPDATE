using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Cart")]
    public class Cart : BaseEntity
    {
        public string UserId { get; set; }
        [ForeignKey("UserId")]
        public string ItemId { get; set; }
        [ForeignKey("ItemId")]
        public string ItemName { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public int TotalPrice { get; set; }
        public int TotalQuantity { get; set; }

    }
}
