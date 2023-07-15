using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models.ViewModels
{
    public class ItemViewModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public string Detail { get; set; }
        public int Price { get; set; }
        public string ComputerId { get; set; }
        public string ComputerName { get; set; }
        public string AccessoriesId { get; set; }
        public string AccessoriesName { get; set; }
        public int BrandId { get; set; }
        public int BrandName { get; set; }
        public int AccessoriesTypeId { get; set; }
        public int AccessoriesTypeName { get; set; }
        public string ComputerAmyoAsarId { get; set; }
        public string ComputerAmyoAsarName { get; set; }
        public IFormFile Photo { get; set; } // Property to hold the uploaded photo file
        public string PhotoPath { get; set; } // Property to hold the path to the photo

    }
}
