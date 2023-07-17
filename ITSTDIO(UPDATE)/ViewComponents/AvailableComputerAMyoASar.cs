using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ITSTDIO_UPDATE_.Models.DAO;

namespace ITSTDIO_UPDATE_.ViewComponents
{
    [ViewComponent(Name = "AvailableComputerAMyoASar")]
    public class AvailableComputerAMyoASar : ViewComponent
    {
        private readonly ApplicationDbContext applicationDbContext;
        public AvailableComputerAMyoASar(ApplicationDbContext applicationDbContext)
        {
            this.applicationDbContext = applicationDbContext;
        }

        public IViewComponentResult Invoke()
        {
            var data = applicationDbContext.computerAmyoAsars.ToList();
            return View("AvailableComputerAMyoASar", data);
        }
    }
}
