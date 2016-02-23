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
        public ViewResult Streets()
        {
            return View();
        }
        public ViewResult Regions()
        {

            return View(repository.Regions);
        }
        public ViewResult Cities()
        {
            return View();
        }
        public JsonResult GetUsers()
        {
            return Json(new CommonData(repository).GetUsers(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetRegions()
        {
            return Json(new CommonData(repository).GetRegions(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCities()
        {
            return Json(new CommonData(repository).GetCities(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetStreets(int? cityId)
        {
            if (cityId != null)

                return Json(repository.Streets.FirstOrDefault(x => x.city_id == (int)cityId), JsonRequestBehavior.AllowGet);
            else
                return Json(repository.Streets, JsonRequestBehavior.AllowGet);

        }
        public JsonResult GetDistricts(int? cityId)
        {
            if (cityId != null)

                return Json(repository.Districts.FirstOrDefault(x => x.city_id == (int)cityId), JsonRequestBehavior.AllowGet);
            else
                return Json(repository.Districts, JsonRequestBehavior.AllowGet);
        }
        public JsonResult CreateRegion(string name)
        {
            Regions dbEntry = new Regions();
            dbEntry.name = name;
            repository.CreateRecord<Regions>(dbEntry);
            return Json(dbEntry, JsonRequestBehavior.AllowGet);
        }
        public void UpdateRegion(int id, string name)
        {
            Regions dbEntry = repository.Regions.FirstOrDefault(x => x.id == id);
            dbEntry.name = name;
            repository.UpdateRecord<Regions>(dbEntry);
        }
        public void DeleteRegion(int id)
        {
            Regions dbEntry = repository.Regions.FirstOrDefault(x => x.id == id);
            repository.DeleteRecord<Regions>(dbEntry);
        }
    }
}