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
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace ITSTDIO_UPDATE_.Controllers
{
    public class ComputerController : Controller
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
        private readonly IWebHostEnvironment webHostEnvironment;
        public ComputerController(ApplicationDbContext applicationDbContext,
            IWebHostEnvironment webHostEnvironment)
        {
            this.applicationDbContext = applicationDbContext;
            this.webHostEnvironment = webHostEnvironment;

        }
        public IActionResult Create()
        {
            var data = new ComputerViewModel();
            data.ComputerAmyoAsarViewModel = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c=>new ComputerAmyoAsarViewModel
            {
                Id=c.Id,
                Name=c.Name
            }).ToList();
            data.BrandViewModel = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.CpuViewModel = applicationDbContext.cpus.Where(w => w.isActive == true).Select(c => new CpuViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.RamViewModel = applicationDbContext.rams.Where(w => w.isActive == true).Select(c => new RamViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            return View(data);
        }
        [HttpPost]
        public IActionResult Create(ComputerViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Computer model = new Computer();

                model.Id = Guid.NewGuid().ToString();
                model.Ip = IpAddress();
                model.CreateDate = DateTime.Now;

                model.BrandId = viewModel.BrandId;
                model.ComputerAmyoAsarId = viewModel.ComputerAmyoAsarId;
                model.CpuId = viewModel.CpuId;
                model.RamId = viewModel.RamId;
                model.Name = viewModel.Name;
                model.storageSize = viewModel.storageSize;
                model.Detail = viewModel.Detail;
                model.isSSD = string.IsNullOrEmpty(viewModel.isSSD) ? false : true;
                             
                if (viewModel.Photo != null && viewModel.Photo.Length > 0)
                {
                    string uploadsFolder = Path.Combine(webHostEnvironment.WebRootPath, "uploads");
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + viewModel.Photo.FileName;
                    string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        viewModel.Photo.CopyTo(fileStream);
                    }

                    model.PhotoPath = "/uploads/" + uniqueFileName;

                }

                applicationDbContext.computers.Add(model);
                applicationDbContext.SaveChanges();

                Item item = new Item();

                item.Id = Guid.NewGuid().ToString();
                item.Ip = IpAddress();
                item.CreateDate = DateTime.Now;

                item.ComputerId = model.Id;
                item.BrandId = viewModel.BrandId;
                item.ComputerAmyoAsarId = viewModel.ComputerAmyoAsarId;
                item.Name = viewModel.Name;
                item.Detail = viewModel.Detail;
                item.PhotoPath = model.PhotoPath;

                applicationDbContext.items.Add(item);
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
            var data = applicationDbContext.computers.Where(w => w.isActive == true).Select(t => new ComputerViewModel
            {
                PhotoPath = t.PhotoPath,
                Id = t.Id,
               BrandId=t.BrandId,
               ComputerAmyoAsarId=t.ComputerAmyoAsarId,
               CpuId=t.CpuId,
               RamId=t.RamId,
                ComputerAmyoAsarName = t.ComputerAmyoAsar.Name,
                BrandName = t.Brand.Name,
                CpuName = t.Cpu.Name,
                RamName = t.Ram.Name,
                Name = t.Name,
                Detail = t.Detail,
                storageSize = t.storageSize,
                isSSD = t.isSSD == true ? "yes" : null
            }).ToList();
            return View(data);
        }
        public IActionResult Update(string Id)
        {
            var data = applicationDbContext.computers.Where(w => w.Id==Id).Select(t => new ComputerViewModel
            {
                PhotoPath = t.PhotoPath,
                Id = t.Id,
                BrandId = t.BrandId,
                ComputerAmyoAsarId = t.ComputerAmyoAsarId,
                CpuId = t.CpuId,
                RamId = t.RamId,
                ComputerAmyoAsarName = t.ComputerAmyoAsar.Name,
                BrandName = t.Brand.Name,
                CpuName = t.Cpu.Name,
                RamName = t.Ram.Name,
                Name = t.Name,
                Detail = t.Detail,
                storageSize = t.storageSize,
                isSSD = t.isSSD == true ? "yes" : null
            }).SingleOrDefault();
            data.ComputerAmyoAsarViewModel = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c => new ComputerAmyoAsarViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.BrandViewModel = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.CpuViewModel = applicationDbContext.cpus.Where(w => w.isActive == true).Select(c => new CpuViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.RamViewModel = applicationDbContext.rams.Where(w => w.isActive == true).Select(c => new RamViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            return View(data);
        }
        [HttpPost]
        public IActionResult Update(ComputerViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Computer model = new Computer();

                model.Id = viewModel.Id;
                model.Ip = IpAddress();
                model.ModifiedDate = DateTime.Now;

                model.BrandId = viewModel.BrandId;
                model.ComputerAmyoAsarId = viewModel.ComputerAmyoAsarId;
                model.CpuId = viewModel.CpuId;
                model.RamId = viewModel.RamId;
                model.Name = viewModel.Name;
                model.storageSize = viewModel.storageSize;
                model.isSSD = string.IsNullOrEmpty(viewModel.isSSD) ? false : true;
               
                model.Detail = viewModel.Detail;

                if (viewModel.Photo != null && viewModel.Photo.Length > 0)
                {
                    if (!string.IsNullOrEmpty(model.PhotoPath))
                    {
                        string existingFilePath = Path.Combine(webHostEnvironment.WebRootPath, "uploads", Path.GetFileName(model.PhotoPath));
                        if (System.IO.File.Exists(existingFilePath))
                        {
                            System.IO.File.Delete(existingFilePath);
                        }
                    }

                    string uploadsFolder = Path.Combine(webHostEnvironment.WebRootPath, "uploads");
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + viewModel.Photo.FileName;
                    string newFilePath = Path.Combine(uploadsFolder, uniqueFileName);

                    using (var fileStream = new FileStream(newFilePath, FileMode.Create))
                    {
                        viewModel.Photo.CopyTo(fileStream);
                    }

                    model.PhotoPath = "/uploads/" + uniqueFileName;
                }
               
                applicationDbContext.Entry(model).State = EntityState.Modified;
                applicationDbContext.SaveChanges();


                var data = applicationDbContext.items.Where(w => w.ComputerId == viewModel.Id).SingleOrDefault();

                if (data != null)
                {

                    data.Ip = IpAddress();
                    data.ModifiedDate = DateTime.Now;

                    data.ComputerId = viewModel.Id;
                    data.BrandId = viewModel.BrandId;
                    data.ComputerAmyoAsarId = viewModel.ComputerAmyoAsarId;
                    data.Name = viewModel.Name;
                    data.Detail = viewModel.Detail;
                    data.PhotoPath = model.PhotoPath;

                    applicationDbContext.Entry(data).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();


                }


                isSuccess = true;
            }
            catch (Exception ex) { }

            if (isSuccess) TempData["EditMessageSuccess"] = "Edit Success!!!";
            else TempData["EditMessageFail"] = "Edit Fail";

            return RedirectToAction("List");
        }
        public IActionResult Delete(string Id)
        {
            var data = applicationDbContext.computers.Find(Id);
            if (data != null)
            {
                data.isActive = false;
                applicationDbContext.Entry(data).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            var data2 = applicationDbContext.items.Where(w => w.ComputerId == Id).SingleOrDefault();
            if (data2 != null)
            {
                data.isActive = false;
                applicationDbContext.Entry(data2).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            return RedirectToAction("List");
        }
    }
}
