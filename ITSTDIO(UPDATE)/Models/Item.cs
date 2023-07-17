using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Item")]
    public class Item:BaseEntity
    {             
        public string ComputerId { get; set; }
        [ForeignKey("ComputerId")]
        public string AccessoriesId { get; set; }
        [ForeignKey("AccessoriesId")]
        public string BrandId { get; set; }
        [ForeignKey("BrandId")]
        public string AccessoriesTypeId { get; set; }
        [ForeignKey("AccessoriesTypeId")]
        public string ComputerAmyoAsarId { get; set; }
        [ForeignKey("ComputerAmyoAsarId")]      
        public string Name { get; set; }
        public int Quantity { get; set; }
        public string Detail { get; set; }
        public int Price { get; set; }
        public string PhotoPath { get; set; }
        public Computer computer { get; set; }
        public Accessories Accessories  { get; set; }
       
    }
}
