using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models
{
    public class BaseEntity
    {
        public string Id { get; set; }
        public string Ip { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool isActive { get; set; } = true;
    }
}
