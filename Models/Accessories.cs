using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Accessories")]
    public class Accessories:BaseEntity
    {
        public string PhotoPath { get; set; }
        public string BrandId { get; set; }
        [ForeignKey("BrandId")]
        public string AccessoriesTypeId { get; set; }
        [ForeignKey("AccessoriesTypeId")]
        public string Name { get; set; }
        public string Detail { get; set; }             
        public AccessoriesType accessoriesType{ get; set; }
        public Brand brand { get; set; }
    }
}
