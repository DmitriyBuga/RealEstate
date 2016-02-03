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
        void CreateNewUser(Users user);
    }
}
