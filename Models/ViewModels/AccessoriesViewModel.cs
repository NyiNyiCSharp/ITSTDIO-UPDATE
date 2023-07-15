using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models.ViewModels
{
    public class AccessoriesViewModel
    {
        public IFormFile Photo { get; set; } // Property to hold the uploaded photo file
        public string PhotoPath { get; set; } 
        public string Detail { get; set; }
        public string Id { get; set; }
        public string Name { get; set; }
        public string AccessoriesTypeId { get; set; }
        public string AccessoriesTypeName { get; set; }
        public string BrandId { get; set; }
        public string BrandName { get; set; }
        public IList<AccessoriesTypeViewModel> accessoriesTypeViewModels  { get; set; }
        public IList<BrandViewModel> brandViewModels { get; set; }

    }
}
