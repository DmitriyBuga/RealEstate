﻿using RealEstate.Models.Concrete;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstate.Models.Abstract
{
    public interface IRepository
    {
        IQueryable<Users> Users { get; }
        IQueryable<Role> Roles { get; }
        IQueryable<Estates> Estates { get; }
        IQueryable<Regions> Regions { get; }
        IQueryable<Cities> Cities { get; }
        IQueryable<Streets> Streets { get; }
        IQueryable<Districts> Districts { get; }
        void CreateNewUser(Users user);
        void DeleteRecord<T>(T dbEntry);
        T CreateRecord<T>(T dbEntry);
        void UpdateRecord<T>(T dbEntry) where T : class;
    }
}
