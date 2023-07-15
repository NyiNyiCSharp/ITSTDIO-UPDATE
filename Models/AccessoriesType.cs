using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace ITSTDIO_UPDATE_.Models
{
    [Table("AccessoriesType")]
    public class AccessoriesType:BaseEntity
    {
        public string Name { get; set; }
    }
}
