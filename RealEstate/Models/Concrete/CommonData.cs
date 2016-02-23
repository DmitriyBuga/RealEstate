using RealEstate.Models.Abstract;
using RealEstate.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstate.Models.Concrete
{
    public class CommonData
    {
        IRepository repository;
        public CommonData(IRepository repo)
        {
            repository = repo;
        }
        public List<UsersJSON> GetUsers()
        {
            List<UsersJSON> users = new List<UsersJSON>();
            foreach (Users reg in repository.Users)
                users.Add(new UsersJSON() { id = reg.id, name = reg.name });
            return users;
        }
        public List<RegionsJSON> GetRegions()
        {
            List<RegionsJSON> regions = new List<RegionsJSON>();
            foreach (Regions reg in repository.Regions)
                regions.Add(new RegionsJSON() { id = reg.id, name = reg.name });
            return regions;
        }
        public List<CitiesJSON> GetCities()
        {
            List<CitiesJSON> regions = new List<CitiesJSON>();
            foreach (Cities reg in repository.Cities)
                regions.Add(new CitiesJSON() { id = reg.id, name = reg.name });
            return regions;

        }
    }
}