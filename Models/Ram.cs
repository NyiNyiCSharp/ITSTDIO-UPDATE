using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Ram")]
    public class Ram:BaseEntity
    {
        public string Name { get; set; }

    }
}
