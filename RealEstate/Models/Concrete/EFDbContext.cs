﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace RealEstate.Models.Concrete
{
    public class EFDbContext : DbContext
    {
        public EFDbContext() : base("name=RealEstateEntities") { }
        public DbSet<Users> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Estates> Estates { get; set;  }
        public DbSet<Regions> Regions { get; set; }
        public DbSet<Streets> Streets { get; set; }
        public DbSet<Cities> Cities { get; set; }
        public DbSet<Districts> Districts { get; set; }
    }
}