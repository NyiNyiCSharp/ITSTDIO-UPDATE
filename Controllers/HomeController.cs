using ITSTDIO_UPDATE_.Models;
using ITSTDIO_UPDATE_.Models.DAO;
using ITSTDIO_UPDATE_.Models.ViewModels;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext applicationDbContext;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly UserManager<IdentityUser> userManager;
        private readonly IWebHostEnvironment webHostEnvironment;
        public HomeController(UserManager<IdentityUser> userManager,
            ApplicationDbContext applicationDbContext, RoleManager<IdentityRole> roleManager,
             IWebHostEnvironment webHostEnvironment)
        {
            this.userManager = userManager;
            this.applicationDbContext = applicationDbContext;
            this.roleManager = roleManager;
            this.webHostEnvironment = webHostEnvironment;
        }
        public IActionResult ApplicationUserList()
        {
           
            var data = userManager.Users.ToList();
           
            return View(data);
        }
        public IActionResult ItemRemoveFromCart(string Id)
        {
            var data = applicationDbContext.carts.Find(Id);
            if (data != null)
            {
                var itemData = applicationDbContext.items.Where(w => w.Id == data.ItemId).SingleOrDefault();
                itemData.Quantity += data.Quantity;
             
                applicationDbContext.Entry(itemData).State = EntityState.Modified;
                applicationDbContext.SaveChanges();

                applicationDbContext.Remove(data);
                applicationDbContext.SaveChanges();
            }
            TempData["ItemRemoveSuccessMessage"] = "Item Remove is success";

            return RedirectToAction("ListFromUserCart");
        }
        public IActionResult ItemPlusConditionFromCart(string Id)
        {
            var data = applicationDbContext.carts.Find(Id);
            if (data != null)
            {
                
                var itemData = applicationDbContext.items.Where(w => w.Id == data.ItemId).SingleOrDefault();
                         
                if(itemData.Quantity>0)
                {
                    data.Quantity += 1;
                    data.Price = itemData.Price;
                    data.TotalPrice += itemData.Price;

                    applicationDbContext.Entry(data).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();

                    itemData.Quantity -= 1;

                    applicationDbContext.Entry(itemData).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();

                    TempData["ItemPlusConditionFromCartSuccessMessage"] = "Item Add is success";
                }
                else
                {
                    TempData["ItemPlusConditionFromCartFailMessage"] = "This Item is out of stock";
                }
                                             
            }           
            return RedirectToAction("ListFromUserCart");
        }
        public IActionResult ItemMinusConditionFromCart(string Id)
        {
            var data = applicationDbContext.carts.Find(Id);
            if (data != null)
            {
                var itemData = applicationDbContext.items.Where(w => w.Id == data.ItemId).SingleOrDefault();
                if (data.Quantity == 1)
                {
                    applicationDbContext.Remove(data);
                    applicationDbContext.SaveChanges();

                    itemData.Quantity += 1;
                    applicationDbContext.Entry(itemData).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();
                }
                else
                {
                    data.Quantity -= 1;
                    data.Price = itemData.Price;
                    data.TotalPrice -= itemData.Price;

                    applicationDbContext.Entry(data).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();

                    itemData.Quantity += 1;
                    applicationDbContext.Entry(itemData).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();
                }

            }
            TempData["ItemMinusConditionFromCartSuccessMessage"] = "Item Minus is success";

            return RedirectToAction("ListFromUserCart");
        }
        public IActionResult AddToCart(string Id)
        {
            var ItemData = applicationDbContext.items.Where(w => w.Id == Id).SingleOrDefault();

            var userId = this.User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (userId != null)
            {
                var userHaveCart = applicationDbContext.carts.Where(w => w.UserId == userId).ToList();
                if (userHaveCart != null && userHaveCart.Count > 0)
                {
                    int count = 0;
                    foreach (var userHave in userHaveCart)
                    {
                        if (userHave.ItemId == ItemData.Id)
                        {
                            var modifiedData = applicationDbContext.carts.Where(w => w.UserId == userId && w.ItemId == ItemData.Id).SingleOrDefault();

                            modifiedData.Quantity += 1;
                            modifiedData.TotalPrice += ItemData.Price;
                            modifiedData.Price = ItemData.Price;
                            modifiedData.TotalPrice += ItemData.Price;

                            applicationDbContext.Entry(modifiedData).State = EntityState.Modified;
                            applicationDbContext.SaveChanges();

                            ItemData.Quantity -= 1;
                            applicationDbContext.Entry(ItemData).State = EntityState.Modified;
                            applicationDbContext.SaveChanges();

                            count += 1;
                        }
                    }
                    if (count == 0)
                    {
                        Cart cart = new Cart();

                        cart.Id = Guid.NewGuid().ToString();
                        cart.UserId = userId;
                        cart.ItemId = ItemData.Id;
                        cart.ItemName = ItemData.Name;
                        cart.Price = ItemData.Price;
                        cart.TotalPrice += ItemData.Price;
                       

                        cart.Quantity = 1;

                        applicationDbContext.carts.Add(cart);
                        applicationDbContext.SaveChanges();

                        ItemData.Quantity -= 1;
                        applicationDbContext.Entry(ItemData).State = EntityState.Modified;
                        applicationDbContext.SaveChanges();
                    }
                    TempData["SuccessMessageForAddToCart"] = "Add to your cart is success.You can check in your cart";

                    return RedirectToAction("ProductList");
                }

                else
                {
                    Cart cart = new Cart();

                    cart.Id = Guid.NewGuid().ToString();
                    cart.UserId = userId;
                    cart.ItemId = ItemData.Id;
                    cart.ItemName = ItemData.Name;
                    cart.Price = ItemData.Price;
                    cart.TotalPrice += ItemData.Price;

                    cart.Quantity = 1;

                    applicationDbContext.carts.Add(cart);
                    applicationDbContext.SaveChanges();

                    ItemData.Quantity -= 1;
                    applicationDbContext.Entry(ItemData).State = EntityState.Modified;
                    applicationDbContext.SaveChanges();

                    TempData["SuccessMessageForAddToCart"] = "Add to your cart is success.You can check in your cart";

                    return RedirectToAction("ProductList");
                }
            }
            else
            {
                TempData["ErrorMessageForAddToCart"] = "Hey, you need to login or register.";
                return RedirectToAction("ProductList");
            }

        }
        public IActionResult ListFromUserCart()
        {
            var userId = this.User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (userId != null)
            {
                var userData = userManager.Users.Where(w => w.Id == userId).SingleOrDefault();
                ViewBag.UserEmail = userData.Email;
                var data = applicationDbContext.carts.Where(w => w.UserId == userId).Select(s => new CartViewModel
                {
                    Id = s.Id,
                    UserId = userId,
                    UserName = userData.Email,
                    ItemId = s.ItemId,
                    ItemName = s.ItemName,
                    Price = s.Price,
                    Quantity = s.Quantity,
                    TotalQuantity=s.TotalQuantity,
                    TotalPrice=s.TotalPrice
                }).ToList();
                return View(data);
            }
            else
            {
                TempData["ErrorMessage"] = "Hey, you need to login or register.";

                return View();

            }


        }
        public IActionResult ProductList()
        {
            var userId = this.User.FindFirstValue(ClaimTypes.NameIdentifier);
            ViewBag.UserId = userId;
            var data = new HomeViewModel();
            data.computerAmyoAsarViewModels = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c => new ComputerAmyoAsarViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.accessoriesTypeViewModels = applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(c => new AccessoriesTypeViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.itemViewModels = applicationDbContext.items.Where(w => w.isActive == true).Select(c => new ItemViewModel
            {
                Id = c.Id,
                Name = c.Name,
                Price = c.Price,
                Quantity = c.Quantity,
                Detail = c.Detail,
                PhotoPath = c.PhotoPath
            }).ToList();
            return View(data);
        }
        public IActionResult ComputerAmyoAsarCreate()
        {

            return PartialView("ComputerAmyoAsarCreate");
        }
        public IActionResult ComputerAmyoAsarList()
        {
            var data = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(t => new ComputerAmyoAsarViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return PartialView("ComputerAmyoAsarList", data);
        }
        public IActionResult CpuList()
        {
            var data = applicationDbContext.cpus.Where(w => w.isActive == true).Select(t => new CpuViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return PartialView("CpuList", data);
        }
        public IActionResult BrandList()
        {
            var data = applicationDbContext.brands.Where(w => w.isActive == true).Select(t => new BrandViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return PartialView("BrandList", data);
        }
        public IActionResult RamList()
        {
            var data = applicationDbContext.rams.Where(w => w.isActive == true).Select(t => new RamViewModel
            {
                Id = t.Id,
                Name = t.Name
            }).ToList();
            return PartialView("RamList", data);
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult ItemList()
        {
            var data = applicationDbContext.items.Where(w => w.isActive == true).Select(w => new ItemViewModel
            {
                Name = w.Name,
                Price = w.Price,
                Quantity = w.Quantity,
                PhotoPath = w.PhotoPath,
                Detail = w.Detail,
            }).ToList();
            return View(data);
        }
        public IActionResult Details(string Id)
        {
            var data = applicationDbContext.items.Where(w => w.Id == Id).Select(s => new ItemViewModel
            {
                Id = s.Id,
                Detail = s.Detail,
                Quantity=s.Quantity
            }).SingleOrDefault();

            return PartialView("DetailsPartial", data);
        }
        public IActionResult SearchByBrand(string Id)
        {
            var data = applicationDbContext.brands.Where(w => w.Id == Id).Select(s => new HomeViewModel
            {
                Name = s.Name
            }).SingleOrDefault();
            data.computerAmyoAsarViewModels = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c => new ComputerAmyoAsarViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.accessoriesTypeViewModels = applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(c => new AccessoriesTypeViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.itemViewModels = applicationDbContext.items.Where(w => w.BrandId == Id).Select(c => new ItemViewModel
            {
                Id = c.Id,
                Name = c.Name,
                Price = c.Price,
                Quantity = c.Quantity,
                Detail = c.Detail,
                PhotoPath = c.PhotoPath
            }).ToList();
            return View(data);
        }
        public IActionResult SearchByComputerType(string Id)
        {
            var data = applicationDbContext.computerAmyoAsars.Where(w => w.Id == Id).Select(s => new HomeViewModel
            {
                Name = s.Name
            }).SingleOrDefault();
            data.computerAmyoAsarViewModels = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c => new ComputerAmyoAsarViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.accessoriesTypeViewModels = applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(c => new AccessoriesTypeViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.itemViewModels = applicationDbContext.items.Where(w => w.ComputerAmyoAsarId == Id).Select(c => new ItemViewModel
            {
                Id = c.Id,
                Name = c.Name,
                Price = c.Price,
                Quantity = c.Quantity,
                Detail = c.Detail,
                PhotoPath = c.PhotoPath
            }).ToList();
            return View(data);
        }
        public IActionResult SearchByAccessoriesType(string Id)
        {
            var data = applicationDbContext.accessoriesTypes.Where(w => w.Id == Id).Select(s => new HomeViewModel
            {
                Name = s.Name
            }).SingleOrDefault();
            data.computerAmyoAsarViewModels = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c => new ComputerAmyoAsarViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.accessoriesTypeViewModels = applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(c => new AccessoriesTypeViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.itemViewModels = applicationDbContext.items.Where(w => w.AccessoriesTypeId == Id).Select(c => new ItemViewModel
            {
                Id = c.Id,
                Name = c.Name,
                Price = c.Price,
                Quantity = c.Quantity,
                Detail = c.Detail,
                PhotoPath = c.PhotoPath
            }).ToList();
            return View(data);
        }
        public IActionResult AllComputer()
        {
            var data = new HomeViewModel();
            data.computerAmyoAsarViewModels = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c => new ComputerAmyoAsarViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.accessoriesTypeViewModels = applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(c => new AccessoriesTypeViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.itemViewModels = applicationDbContext.items.Where(w => w.ComputerId != null).Select(c => new ItemViewModel
            {
                Id = c.Id,
                Name = c.Name,
                Price = c.Price,
                Quantity = c.Quantity,
                Detail = c.Detail,
                PhotoPath = c.PhotoPath
            }).ToList();
            return View(data);
        }
        public IActionResult AllAccessories()
        {
            var data = new HomeViewModel();
            data.computerAmyoAsarViewModels = applicationDbContext.computerAmyoAsars.Where(w => w.isActive == true).Select(c => new ComputerAmyoAsarViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.accessoriesTypeViewModels = applicationDbContext.accessoriesTypes.Where(w => w.isActive == true).Select(c => new AccessoriesTypeViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.brandViewModels = applicationDbContext.brands.Where(w => w.isActive == true).Select(c => new BrandViewModel
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
            data.itemViewModels = applicationDbContext.items.Where(w => w.AccessoriesId != null).Select(c => new ItemViewModel
            {
                Id = c.Id,
                Name = c.Name,
                Price = c.Price,
                Quantity = c.Quantity,
                Detail = c.Detail,
                PhotoPath = c.PhotoPath
            }).ToList();
            return View(data);
        }
        public IActionResult Order(OrderViewModel viewModel)
        {

            var userId = this.User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (userId != null)
            {
                var userData = userManager.Users.Where(w => w.Id == userId).SingleOrDefault();
                var userHaveCart = applicationDbContext.carts.Where(w => w.UserId == userId).ToList();
                if (userHaveCart != null && userHaveCart.Count > 0)
                {
                    Order model = new Order();

                    model.Id = Guid.NewGuid().ToString();
                    model.CreateDate = DateTime.Now;

                    model.UserId = userId;
                    model.UserName = userData.Email;

                    model.Address = viewModel.Address;
                    model.PhoneNumber = viewModel.PhoneNumber;

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
                  
                    foreach (var data in userHaveCart)
                    {

                        model.ItemName += data.ItemName + "\n";
                        model.Quantity += data.Quantity + "\n";
                        model.Price += data.Price + "\n";
                        model.TotalPrice += data.TotalPrice;

                       
                    }
                    applicationDbContext.orders.Add(model);
                    applicationDbContext.SaveChanges();

                    var userHaveCart2 = applicationDbContext.carts.Where(w => w.UserId == userId).ToList();
                    if (userHaveCart2 != null && userHaveCart2.Count > 0)
                    {
                        foreach (var data in userHaveCart2)
                        {                          
                            applicationDbContext.Remove(data);
                            applicationDbContext.SaveChanges();
                        }
                    }

                    TempData["SuccessMessageForOrder"] = "Order Success.Thanks!!!!!";

                    return RedirectToAction("ListFromUserCart");
                }
            }
            return View();
        }
        public IActionResult OrderList()
        {
            var data = applicationDbContext.orders.Where(w => w.isActive == true).Select(c => new OrderViewModel
            {
                Id = c.Id,
                UserId = c.UserId,
                UserName = c.UserName,
                ItemName = c.ItemName,
                Quantity = c.Quantity,
                PhotoPath = c.PhotoPath,
                Address=c.Address,
                PhoneNumber=c.PhoneNumber,
                Price=c.Price,
                TotalPrice=c.TotalPrice,
                Date=c.CreateDate,
            }).ToList();

            return View(data);
        }        
        public IActionResult OrderDelete(string Id)
        {
            var data = applicationDbContext.orders.Find(Id);
            if (data != null)
            {
                data.isActive = false;
                applicationDbContext.Entry(data).State = EntityState.Modified;
                applicationDbContext.SaveChanges();
            }
            return RedirectToAction("OrderList");
        }
        public IActionResult DirectToOrder(OrderViewModel viewModel)
        {

            var userId = this.User.FindFirstValue(ClaimTypes.NameIdentifier);
            var itemData = applicationDbContext.items.Where(w => w.Id == viewModel.ItemId).SingleOrDefault();
            if (userId != null)
            {
                var userData = userManager.Users.Where(w => w.Id == userId).SingleOrDefault();
               
                    Order model = new Order();

                    model.Id = Guid.NewGuid().ToString();
                    model.CreateDate = DateTime.Now;

                    model.UserId = userId;
                    model.UserName = userData.Email;

                    model.Address = viewModel.Address;
                    model.PhoneNumber = viewModel.PhoneNumber;

                model.ItemName = itemData.Name;
                model.Quantity = "1";
                model.Price = Convert.ToString(itemData.Price);
                model.TotalPrice = itemData.Price;

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
                  
                    applicationDbContext.orders.Add(model);
                    applicationDbContext.SaveChanges();

               

                TempData["SuccessMessageForOrder"] = "Order Success.Thanks!!!!!";

                   
            }
        
            else{
                Order model = new Order();

                model.Id = Guid.NewGuid().ToString();
                model.CreateDate = DateTime.Now;

                model.UserName = viewModel.UserName;

                model.Address = viewModel.Address;
                model.PhoneNumber = viewModel.PhoneNumber;

                model.ItemName = itemData.Name;
                model.Quantity = "1";
                model.Price = Convert.ToString(itemData.Price);
                model.TotalPrice = itemData.Price;

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

                applicationDbContext.orders.Add(model);
                applicationDbContext.SaveChanges();


                TempData["SuccessMessageForOrder"] = "Order Success.Thanks!!!!!";

            }


            itemData.Quantity -= 1;
            applicationDbContext.Entry(itemData).State = EntityState.Modified;
            applicationDbContext.SaveChanges();
            return RedirectToAction("ProductList");
        }
        



    }
}
