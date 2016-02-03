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
        public IQueryable<Role> Roles
        {
            get { return dbContext.Roles; }
        }
        public void CreateNewUser(Users user)
        {
            dbContext.Users.Add(user);
            dbContext.SaveChanges();
        }
    }
}