using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Purchase")]
    public class Purchase:BaseEntity
    {
       
        public string ItemId { get; set; }
        [ForeignKey("ItemId")]
        public int Quantity { get; set; }

        public int BuyPrice { get; set; }

        public int SalePrice { get; set; }
        public Item Item { get; set; }

    }
}
