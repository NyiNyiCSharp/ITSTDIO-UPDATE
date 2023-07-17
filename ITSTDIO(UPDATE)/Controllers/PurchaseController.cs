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
using System.IO;
using Microsoft.AspNetCore.Hosting;
using ITSTDIO_UPDATE_.Models.DAO;
using ITSTDIO_UPDATE_.Models.ViewModels;
using Microsoft.EntityFrameworkCore;

namespace ITSTDIO_UPDATE_.Controllers
{
    public class PurchaseController : Controller
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
        public PurchaseController(ApplicationDbContext applicationDbContext, IWebHostEnvironment webHostEnvironment)
        {
            this.applicationDbContext = applicationDbContext;
            this.webHostEnvironment = webHostEnvironment;

        }
        public IActionResult Create()
        {
            var data = new PurchaseViewModel ();
           
            data.ItemViewModels = applicationDbContext.items.Where(w => w.isActive == true).Select(t => new ItemViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return View(data);
        }
        [HttpPost]
        public IActionResult Create(PurchaseViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                Purchase model = new Purchase();

                model.Id = Guid.NewGuid().ToString();
                model.Ip = IpAddress();
                model.CreateDate = DateTime.Now;

                model.ItemId = viewModel.ItemId;
                model.Quantity = viewModel.Quantity;
                model.BuyPrice = viewModel.BuyPrice;
                model.SalePrice = viewModel.SalePrice;

                applicationDbContext.purchases.Add(model);
                applicationDbContext.SaveChanges();

                var ItemData = applicationDbContext.items.Where(w => w.Id == viewModel.ItemId).SingleOrDefault();

                if (ItemData != null)
                {
                    ItemData.Ip = IpAddress();
                    ItemData.ModifiedDate = DateTime.Now;

                    ItemData.Price = viewModel.SalePrice;
                    ItemData.Quantity += viewModel.Quantity;

                    applicationDbContext.Entry(ItemData).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();
                }

                isSuccess = true;
            }
            catch (Exception ex) { }

            if (isSuccess) TempData["CreateMessageSuccess"] = "Create Success!!!";
            else TempData["CreateMessageFail"] = "Create Fail";

            return RedirectToAction("List");
        }
        public IActionResult List()
        {
            var data = applicationDbContext.purchases.Where(w => w.isActive == true).Select(t => new PurchaseViewModel
            {

               Id=t.Id,
               ItemId=t.ItemId,
               ItemName=t.Item.Name,
               Quantity=t.Quantity,
               BuyPrice=t.BuyPrice,
               SalePrice=t.SalePrice

            }).ToList();
            return View(data);
        }
        public IActionResult Update(string Id)
        {

            var data = applicationDbContext.purchases.Where(w => w.isActive == true).Select(t => new PurchaseViewModel
            {

                Id = t.Id,
                ItemId = t.ItemId,
                ItemName = t.Item.Name,
                Quantity = t.Quantity,
                BuyPrice = t.BuyPrice,
                SalePrice = t.SalePrice

            }).SingleOrDefault();

            data.ItemViewModels = applicationDbContext.items.Where(w => w.isActive == true).Select(t => new ItemViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return View(data);

        }
        [HttpPost]
        public IActionResult Update(PurchaseViewModel viewModel)
        {
            bool isSuccess = false;
            try
            {
                var PurchaseData = applicationDbContext.purchases.Where(w => w.Id == viewModel.Id).SingleOrDefault();

                if (PurchaseData.ItemId == viewModel.ItemId)
                {
                    var itemData = applicationDbContext.items.Where(w => w.Id == PurchaseData.ItemId).SingleOrDefault();

                    if (PurchaseData.Quantity > viewModel.Quantity)
                    {
                        var tempData = PurchaseData.Quantity - viewModel.Quantity;
                        if (itemData != null)
                        {
                            itemData.Ip = IpAddress();
                            itemData.ModifiedDate = DateTime.Now;
                            itemData.Quantity -= tempData;
                            itemData.Price = PurchaseData.SalePrice;

                            applicationDbContext.Entry(itemData).State = EntityState.Modified;
                            applicationDbContext.SaveChanges();
                        }

                    }

                    else if (PurchaseData.Quantity < viewModel.Quantity)
                    {
                        var tempData = viewModel.Quantity - PurchaseData.Quantity;
                        if (itemData != null)
                        {
                            itemData.Ip = IpAddress();
                            itemData.ModifiedDate = DateTime.Now;
                            itemData.Quantity += tempData;
                            itemData.Price = PurchaseData.SalePrice;

                            applicationDbContext.Entry(itemData).State = EntityState.Modified;
                            applicationDbContext.SaveChanges();
                        }
                    }

                    else if (PurchaseData.Quantity == viewModel.Quantity)
                    {
                        
                        if (itemData != null)
                        {
                            itemData.Ip = IpAddress();
                            itemData.ModifiedDate = DateTime.Now;
                            itemData.Price = PurchaseData.SalePrice;
                            applicationDbContext.Entry(itemData).State = EntityState.Modified;
                            applicationDbContext.SaveChanges();
                        }
                    }
                }

                else
                {
                    var firstItemData = applicationDbContext.items.Where(w => w.Id == PurchaseData.ItemId).SingleOrDefault();

                    if (firstItemData != null)
                    {
                        firstItemData.Ip = IpAddress();
                        firstItemData.ModifiedDate = DateTime.Now;

                        
                        firstItemData.Quantity -= viewModel.Quantity;

                        applicationDbContext.Entry(firstItemData).State = EntityState.Modified;
                        applicationDbContext.SaveChanges();
                    }
                    var ItemData = applicationDbContext.items.Where(w => w.Id == viewModel.ItemId).SingleOrDefault();

                    if (ItemData != null)
                    {
                        ItemData.Ip = IpAddress();
                        ItemData.ModifiedDate = DateTime.Now;

                        ItemData.Price = viewModel.SalePrice;
                        ItemData.Quantity += viewModel.Quantity;

                        applicationDbContext.Entry(ItemData).State = EntityState.Modified;
                        applicationDbContext.SaveChanges();
                    }
                }
      
                PurchaseData.Ip = IpAddress();
                PurchaseData.ModifiedDate = DateTime.Now;

                PurchaseData.ItemId = viewModel.ItemId;
                PurchaseData.Quantity = viewModel.Quantity;
                PurchaseData.BuyPrice = viewModel.BuyPrice;
                PurchaseData.SalePrice = viewModel.SalePrice;

                applicationDbContext.Entry(PurchaseData).State = EntityState.Modified;
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
            var PurchaseData = applicationDbContext.purchases.Find(Id);
            if (PurchaseData != null)
            {
                PurchaseData.isActive = false;
                applicationDbContext.Entry(PurchaseData).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            var ItemData = applicationDbContext.items.Where(w => w.Id == PurchaseData.ItemId).SingleOrDefault();
            if (ItemData != null)
            {
               
                ItemData.Quantity -= PurchaseData.Quantity;
                if (ItemData.Quantity > 0)
                {
                    ItemData.Price = ItemData.Price;
                }
                else
                {
                    ItemData.Price = 0;
                }
                applicationDbContext.Entry(ItemData).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            return RedirectToAction("List");
        }
    }
}
