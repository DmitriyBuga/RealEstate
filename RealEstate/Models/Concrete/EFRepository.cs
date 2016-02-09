using RealEstate.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Linq;
using System.Web;

namespace RealEstate.Models.Concrete
{
   
    public class EFRepository : IRepository
    {
        private EFDbContext dbContext;
        public EFRepository(EFDbContext context)
        {
            dbContext = context;
        }
        public IQueryable<Users> Users
        {
            get { return dbContext.Users; }
        }
        public IQueryable<Estates> Estates
        {
            get { return dbContext.Estates; }
        }
        public IQueryable<Regions> Regions
        {
            get { return dbContext.Regions; }
        }
        public IQueryable<Streets> Streets
        {
            get { return dbContext.Streets; }
        }
        public IQueryable<Cities> Cities
        {
            get { return dbContext.Cities; }
        }
        public IQueryable<Districts> Districts
        {
            get { return dbContext.Districts; }
        }
        public IQueryable<Role> Roles
        {
            get { return dbContext.Roles; }
        }
        public void CreateNewUser(Users user)
        {
            dbContext.Users.Add(user);
            dbContext.SaveChanges();
        }
        public void DeleteRecord<T>(T dbEntry)
        {
            DbSet dbSet = dbContext.Set(typeof(T));
            dbSet.Remove(dbEntry);
            dbContext.SaveChanges();
        }
        public void CreateRecord<T>(T dbEntry)
        {
            DbSet dbSet = dbContext.Set(typeof(T));
            dbSet.Add(dbEntry);
            dbContext.SaveChanges();
        }
        public void UpdateRecord<T>(T dbEntry)
        {
            DbSet dbSet = dbContext.Set(typeof(T));
            dbContext.SaveChanges();
        }
    }
}