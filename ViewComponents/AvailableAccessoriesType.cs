using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ITSTDIO_UPDATE_.Models.DAO;

namespace ITSTDIO_UPDATE_.ViewComponents
{
    [ViewComponent(Name = "AvailableAccessoriesType")]
    public class AvailableAccessoriesType : ViewComponent
    {
        private readonly ApplicationDbContext applicationDbContext;
        public AvailableAccessoriesType(ApplicationDbContext applicationDbContext)
        {
            this.applicationDbContext = applicationDbContext;
        }

        public IViewComponentResult Invoke()
        {
            var data = applicationDbContext.accessoriesTypes.ToList();
            return View("AvailableAccessoriesType", data);
        }
    }
}
