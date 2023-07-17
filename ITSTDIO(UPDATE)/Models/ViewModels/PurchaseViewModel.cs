using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models.ViewModels
{
    public class PurchaseViewModel
    {
        public string Id { get; set; }
        public string ItemId { get; set; }
        public string ItemName { get; set; }
        public int Quantity { get; set; }

        public int BuyPrice { get; set; }

        public int SalePrice { get; set; }
        public IList<ItemViewModel> ItemViewModels  { get; set; }
    }
}
