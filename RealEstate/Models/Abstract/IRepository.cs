using System;
using System.Collections.Generic;
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
    }
}
