using RealEstate.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstate.Models.Concrete
{
    public class EFRepository : IRepository
    {
        private EFDbContext dbContext;
        private Dictionary<string, object> tableObjects;
        public void EFDbContext()
        {
            tableObjects.Add("Regions", Regions);
            tableObjects.Add("Cities", Cities);
        }
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
        public void DeleteRecord<T>(int id)
        {
            dbContext.Streets.FirstOrDefault();
            var dbSet = dbContext.Set(typeof(T));
            //T dbentry = dbSet.FirstOrDefault(x => x.id == id);
            //dbSet.Remove(dbentry);
        }
    }
}