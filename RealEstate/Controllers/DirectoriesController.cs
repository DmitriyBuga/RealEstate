using RealEstate.Models;
using RealEstate.Models.Abstract;
using RealEstate.Models.Concrete;
using RealEstate.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealEstate.Controllers
{
    public class DirectoriesController : Controller
    {
        
        IRepository repository;
        // GET: Directories
        public DirectoriesController(IRepository repo)
        {
            repository = repo;
        }
        public ViewResult Districts()
        {
            CommonData commonData = new CommonData(repository);
            List<DistrictJSON> districts = new List<DistrictJSON>();
            foreach (Districts district in repository.Districts)
                districts.Add(new DistrictJSON {
                    id = district.id,
                    name = district.name,
                    city_id = district.city_id,
                    city_name = district.Cities.name
                });
            DistrictsModel districtsModel = new DistrictsModel
            {
                districts = districts,
                listCity = commonData.GetCities()
            };
            return View(districtsModel);
        }
        public ViewResult Streets()
        {
            return View();
        }
        /*
        public JsonResult GetCurrentDirectory()
        {
            return this.GetDirectory();
        }
        */
        public ViewResult Regions(string tableName, string title)
        {
            //GetDirectory = GetRegions;
            DirectoriesModel directoriesModel =
                new DirectoriesModel
                {
                    title = title,
                    tableName = tableName
                };
            return View(directoriesModel);
        }
        //public delegate JsonResult DelGetDirectory();
        //DelGetDirectory GetDirectory;
        
        public JsonResult GetUsers()
        {
            return Json(new CommonData(repository).GetUsers(), JsonRequestBehavior.AllowGet);
        }
        
        
        
        public JsonResult GetDistricts(int? cityId)
        {
            if (cityId != null)

                return Json(repository.Districts.FirstOrDefault(x => x.city_id == (int)cityId), JsonRequestBehavior.AllowGet);
            else
                return Json(repository.Districts, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetRegions()
        {
            return Json(new CommonData(repository).GetRegions(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult CreateRegions(string name)
        {
            Regions dbEntry = new Regions();
            dbEntry.name = name;
            repository.CreateRecord<Regions>(dbEntry);
            return Json(dbEntry, JsonRequestBehavior.AllowGet);
        }

        public JsonResult CreateDistrict(int id, string name, int city_id)
        {
            Districts dbEntry = new Districts();
            dbEntry.name = name;
            dbEntry.city_id = city_id;
            dbEntry.Cities = repository.Cities.FirstOrDefault(x => x.id == dbEntry.city_id);
            //dbEntry.city_name = dbEntry.Cities.name;
            repository.CreateRecord<Districts>(dbEntry);
            return Json(dbEntry, JsonRequestBehavior.AllowGet);
        }
        public void UpdateDistrict(int id, string name, int city_id)
        {
            Districts dbEntry = repository.Districts.FirstOrDefault(x => x.id == id);
            dbEntry.name = name;
            dbEntry.city_id = city_id;
            repository.UpdateRecord<Districts>(dbEntry);
        }
        public void UpdateRegions(int id, string name)
        {
            Regions dbEntry = repository.Regions.FirstOrDefault(x => x.id == id);
            dbEntry.name = name;
            repository.UpdateRecord<Regions>(dbEntry);
        }
        public void DeleteRegions(int id)
        {
            Regions dbEntry = repository.Regions.FirstOrDefault(x => x.id == id);
            repository.DeleteRecord<Regions>(dbEntry);
        }
        public JsonResult GetCities()
        {
            return Json(new CommonData(repository).GetCities(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult CreateCities(string name)
        {
            Cities dbEntry = new Cities();
            dbEntry.name = name;
            repository.CreateRecord<Cities>(dbEntry);
            return Json(dbEntry, JsonRequestBehavior.AllowGet);
        }
        public void UpdateCities(int id, string name)
        {
            Cities dbEntry = repository.Cities.FirstOrDefault(x => x.id == id);
            dbEntry.name = name;
            repository.UpdateRecord<Cities>(dbEntry);
        }
        public void DeleteCities(int id)
        {
            Cities dbEntry = repository.Cities.FirstOrDefault(x => x.id == id);
            repository.DeleteRecord<Cities>(dbEntry);
        }
    }
}