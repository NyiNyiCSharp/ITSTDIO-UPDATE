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
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace ITSTDIO_UPDATE_.Controllers
{
    public class AccessoriesController : Controller
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
        public AccessoriesController(ApplicationDbContext applicationDbContext, IWebHostEnvironment webHostEnvironment)
        {
            this.applicationDbContext = applicationDbContext;
            this.webHostEnvironment = webHostEnvironment;

        }
        public IActionResult Create()
        {
            var data = new AccessoriesViewModel();
            data.accessoriesTypeViewModels=applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(t => new AccessoriesTypeViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(t => new BrandViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return View(data);
        }
        [HttpPost]
        public IActionResult Create(AccessoriesViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Accessories model = new Accessories();

                model.Id = Guid.NewGuid().ToString();
                model.Ip = IpAddress();
                model.CreateDate = DateTime.Now;

                model.Detail = viewModel.Detail;
                model.Name = viewModel.Name;
                model.BrandId = viewModel.BrandId;
                model.AccessoriesTypeId = viewModel.AccessoriesTypeId;
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
                applicationDbContext.accessories.Add(model);
                applicationDbContext.SaveChanges();

                Item item = new Item();

                item.Id= Guid.NewGuid().ToString();
                item.Ip = IpAddress();
                item.CreateDate = DateTime.Now;

                item.AccessoriesId = model.Id;
                item.BrandId = viewModel.BrandId;
                item.Detail = viewModel.Detail;              
                item.AccessoriesTypeId = viewModel.AccessoriesTypeId;
                item.Name = viewModel.Name;
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
            var data = applicationDbContext.accessories.Where(w => w.isActive == true).Select(t => new AccessoriesViewModel
            {

                PhotoPath = t.PhotoPath,
                Id = t.Id,
                Name = t.Name,
                BrandId = t.BrandId,
                BrandName = t.brand.Name,
                AccessoriesTypeId = t.AccessoriesTypeId,
                AccessoriesTypeName = t.accessoriesType.Name,
                Detail = t.Detail

            }).ToList();
            return View(data);
        }
        public IActionResult Update(string Id)
        {
            var data = applicationDbContext.accessories.Where(w => w.Id == Id).Select(t => new AccessoriesViewModel
            {

                PhotoPath = t.PhotoPath,
                Id = t.Id,
                Name = t.Name,
                BrandId=t.BrandId,
                BrandName = t.brand.Name,
                AccessoriesTypeId=t.AccessoriesTypeId,
                AccessoriesTypeName = t.accessoriesType.Name,
                Detail=t.Detail

            }).SingleOrDefault();
            data.accessoriesTypeViewModels = applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(t => new AccessoriesTypeViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(t => new BrandViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return View(data);
           
        }
        [HttpPost]
        public IActionResult Update(AccessoriesViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Accessories model = new Accessories();

                model.Id = viewModel.Id;
                model.Ip = IpAddress();
                model.ModifiedDate = DateTime.Now;

                model.Detail = viewModel.Detail;
                model.Name = viewModel.Name;
                model.BrandId = viewModel.BrandId;
                model.AccessoriesTypeId = viewModel.AccessoriesTypeId;
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

                var data = applicationDbContext.items.Where(w => w.AccessoriesId == viewModel.Id).SingleOrDefault();

                if (data != null)
                {                    
                    data.Ip = IpAddress();
                    data.ModifiedDate = DateTime.Now;

                    data.AccessoriesId = model.Id;
                    data.BrandId = viewModel.BrandId;
                    data.Detail = viewModel.Detail;
                    data.Name = viewModel.Name;
                    data.AccessoriesTypeId = viewModel.AccessoriesTypeId;
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
            var data = applicationDbContext.accessories.Find(Id);
            if (data != null)
            {
                data.isActive = false;
                applicationDbContext.Entry(data).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            var data2 = applicationDbContext.items.Where(w => w.AccessoriesId == Id).SingleOrDefault();
            if (data2 != null)
            {
                data2.isActive = false;
                applicationDbContext.Entry(data2).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            return RedirectToAction("List");
        }
    }
}
