using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("Brand")]
    public class Brand:BaseEntity
    {    
        public string Name { get; set; }

    }
}
