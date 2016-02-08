using RealEstate.Models.Abstract;
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
        public JsonResult GetAllRegions()
        {
            return Json(repository.Regions, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCities(int? regionId)
        {
            if (regionId != null)

                return Json(repository.Cities.FirstOrDefault(x => x.region_id == (int)regionId), JsonRequestBehavior.AllowGet);
            else
                return Json(repository.Cities, JsonRequestBehavior.AllowGet);

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
    }
}