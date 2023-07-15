using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Computer")]
    public class Computer:BaseEntity
    {
        public string BrandId { get; set; }
        [ForeignKey("BrandId")]
        public string ComputerAmyoAsarId { get; set; }
        [ForeignKey("ComputerAmyoAsarId")]
        public string CpuId { get; set; }
        [ForeignKey("CpuId")]
        public string RamId { get; set; }
        [ForeignKey("RamId")]
        public string PhotoPath { get; set; }
        public string Name { get; set; }
        public int  storageSize { get; set; }
        public bool isSSD { get; set; }        
        public string Detail { get; set; }
        public Ram Ram { get; set; }     
        public Cpu Cpu { get; set; }
        public Brand Brand { get; set; }
        public ComputerAmyoAsar ComputerAmyoAsar { get; set; }
       
    }
}
