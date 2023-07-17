using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models.ViewModels
{
    public class HomeViewModel
    {
        public string Name { get; set; }
        public IList<BrandViewModel> brandViewModels  { get; set; }
        public IList<ComputerAmyoAsarViewModel> computerAmyoAsarViewModels { get; set; }
        public IList<AccessoriesTypeViewModel>accessoriesTypeViewModels  { get; set; }
        public IList<ItemViewModel> itemViewModels { get; set; }

      
            public IList<IdentityRole> Roles { get; set; }
            public IList<IdentityUser> Users { get; set; }

        public string UserId { get; set; }
        public string RoleId { get; set; }
       
    }
}
