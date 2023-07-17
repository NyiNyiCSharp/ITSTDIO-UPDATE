using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models.ViewModels
{
    public class ComputerViewModel
    {
        public IFormFile Photo { get; set; } // Property to hold the uploaded photo file
        public string PhotoPath { get; set; } // Property to hold the path to the photo
        public string Detail { get; set; }
        public string Id { get; set; }
        public string Name { get; set; }
        public int storageSize { get; set; }
        public string isSSD { get; set; }
        public string ComputerAmyoAsarName { get; set; }
        public string BrandName { get; set; }
        public string RamName { get; set; }
        public string CpuName { get; set; }
        public string ComputerAmyoAsarId { get; set; }
        public string BrandId { get; set; }
        public string RamId { get; set; }
        public string CpuId { get; set; }
        public IList<RamViewModel> RamViewModel { get; set; }
        public IList<CpuViewModel> CpuViewModel { get; set; }
        public IList<BrandViewModel> BrandViewModel { get; set; }
        public IList<ComputerAmyoAsarViewModel> ComputerAmyoAsarViewModel { get; set; }
    }
}
