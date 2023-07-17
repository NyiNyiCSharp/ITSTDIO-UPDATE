using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ITSTDIO_UPDATE_.Models.DAO;

namespace ITSTDIO_UPDATE_.ViewComponents
{
    [ViewComponent(Name = "AvailableBrand")]
    public class AvailableBrand : ViewComponent
    {
        private readonly ApplicationDbContext applicationDbContext;
        public AvailableBrand(ApplicationDbContext applicationDbContext)
        {
            this.applicationDbContext = applicationDbContext;
        }

        public IViewComponentResult Invoke()
        {
            var data = applicationDbContext.brands.ToList();
            return View("AvailableBrand", data);
        }
    }
}
