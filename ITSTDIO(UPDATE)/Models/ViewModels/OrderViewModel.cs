using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models.ViewModels
{
    public class OrderViewModel
    {
        public IFormFile Photo { get; set; } // Property to hold the uploaded photo file
        public string PhotoPath { get; set; } 
        public string Id { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string ItemName { get; set; }
        public int TotalPrice { get; set; }
        public string Price { get; set; }
        public string Quantity { get; set; }
        public string Address { get; set; }
        public int PhoneNumber { get; set; }
        public DateTime Date { get; set; }
        public string ItemId { get; set; }
    }
}
