using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Threading.Tasks;
using ITSTDIO_UPDATE_.Models;
using ITSTDIO_UPDATE_.Models.DAO;
using ITSTDIO_UPDATE_.Models.ViewModels;
using Microsoft.EntityFrameworkCore;

namespace ITSTDIO_UPDATE_.Controllers
{
    public class CpuController : Controller
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
        public CpuController(ApplicationDbContext applicationDbContext)
        {
            this.applicationDbContext = applicationDbContext;
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(CpuViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Cpu model = new Cpu();

                model.Id = Guid.NewGuid().ToString();
                model.Ip = IpAddress();
                model.CreateDate = DateTime.Now;

                model.Name = viewModel.Name;

                applicationDbContext.cpus.Add(model);
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
            var data = applicationDbContext.cpus.Where(w => w.isActive == true).Select(t => new CpuViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return View(data);
        }
        public IActionResult Update(string Id)
        {
            var data = applicationDbContext.cpus.Where(w => w.Id == Id).Select(t => new CpuViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).SingleOrDefault();
            return View(data);
        }
        [HttpPost]
        public IActionResult Update(CpuViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Cpu model = new Cpu();

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
            var data = applicationDbContext.cpus.Find(Id);
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
