using ITSTDIO_UPDATE_.Models.DAO;
using ITSTDIO_UPDATE_.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Threading.Tasks;
using ITSTDIO_UPDATE_.Models;

namespace ITSTDIO_UPDATE_.Controllers
{
    public class BrandController : Controller
    {
        private static string IpAddress()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new Exception("No network adapters with an IPv4 address in the system!");
        }
        private readonly ApplicationDbContext applicationDbContext;
        public BrandController(ApplicationDbContext applicationDbContext)
        {
            this.applicationDbContext = applicationDbContext;
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(BrandViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Brand model = new Brand();

                model.Id = Guid.NewGuid().ToString();
                model.Ip = IpAddress();
                model.CreateDate = DateTime.Now;

                model.Name = viewModel.Name;

                applicationDbContext.brands.Add(model);
                applicationDbContext.SaveChanges();

                isSuccess = true;
            }
            catch (Exception ex) { }

            if (isSuccess) TempData["CreateMessageSuccess"] = "Create Success!!!";
            else TempData["CreateMessageFail"] = "Create Fail";

            return RedirectToAction("List");
        }
        public IActionResult List()
        {
            var data = applicationDbContext.brands.Where(w => w.isActive == true).Select(t => new BrandViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return View(data);
        }
        public IActionResult Update(string Id)
        {
            var data = applicationDbContext.brands.Where(w => w.Id == Id).Select(t => new BrandViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).SingleOrDefault();
            return View(data);
        }
        [HttpPost]
        public IActionResult Update(BrandViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Brand model = new Brand();

                model.Id = viewModel.Id;
                model.Ip = IpAddress();
                model.ModifiedDate = DateTime.Now;
                model.Name = viewModel.Name;

                applicationDbContext.Entry(model).State = EntityState.Modified;
                applicationDbContext.SaveChanges();

                isSuccess = true;
            }
            catch (Exception ex) { }

            if (isSuccess) TempData["EditMessageSuccess"] = "Edit Success!!!";
            else TempData["EditMessageFail"] = "Edit Fail";

            return RedirectToAction("List");
        }
        public IActionResult Delete(string Id)
        {
            var data = applicationDbContext.brands.Find(Id);
            if (data != null)
            {
                data.isActive = false;
                applicationDbContext.Entry(data).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            return RedirectToAction("List");
        }
    }
}
