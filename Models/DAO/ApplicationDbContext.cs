using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITSTDIO_UPDATE_.Models.DAO
{
    public class ApplicationDbContext : IdentityDbContext<IdentityUser, IdentityRole, string>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        public DbSet<Brand> brands { get; set; }
        public DbSet<Cpu> cpus { get; set; }
        public DbSet<Ram> rams { get; set; }
        public DbSet<Computer> computers { get; set; }
        public DbSet<ComputerAmyoAsar> computerAmyoAsars { get; set; }
        public DbSet<Accessories> accessories { get; set; }
        public DbSet<AccessoriesType> accessoriesTypes { get; set; }
        public DbSet<Item> items { get; set; }
        public DbSet<Cart> carts { get; set; }
        public DbSet<Purchase> purchases { get; set; }

        public DbSet<Order> orders { get; set; }


    }
}
