using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Cpu")]
    public class Cpu:BaseEntity
    {
        public string Name { get; set; }

    }
}
