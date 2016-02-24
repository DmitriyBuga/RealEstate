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
        public List<CommonDirJSON> GetRooms()
        {
            List<CommonDirJSON> floors = new List<CommonDirJSON>();
            foreach (int reg in repository.Estates.Select(x => x.rooms).Distinct())
                floors.Add(new CommonDirJSON() { id = reg, name = reg.ToString() });
            return floors;
        }
        public List<CommonDirJSON> GetFloors()
        {
            List<CommonDirJSON> floors = new List<CommonDirJSON>();
            int id = 0;
            foreach (string reg in repository.Estates.Select(x => x.floor.ToString() + "/" + x.floors.ToString()).Distinct())
                floors.Add(new CommonDirJSON() { id = id++, name = reg.ToString() });    
            return floors;
        }
        public List<CommonDirJSON> GetUsers()
        {
            List<CommonDirJSON> users = new List<CommonDirJSON>();
            foreach (Users reg in repository.Users)
                users.Add(new CommonDirJSON() { id = reg.id, name = reg.name });
            return users;
        }
        public List<CommonDirJSON> GetRegions()
        {
            List<CommonDirJSON> regions = new List<CommonDirJSON>();
            foreach (Regions reg in repository.Regions)
                regions.Add(new CommonDirJSON() { id = reg.id, name = reg.name });
            return regions;
        }
        public List<CommonDirJSON> GetCities()
        {
            List<CommonDirJSON> regions = new List<CommonDirJSON>();
            foreach (Cities reg in repository.Cities)
                regions.Add(new CommonDirJSON() { id = reg.id, name = reg.name });
            return regions;

        }
    }
}