using RealEstate.Models;
using RealEstate.Models.Abstract;
using RealEstate.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealEstate.Controllers
{
    public class EstatesController : Controller
    {
        private const string _localImagePath = "/Files/Images/";
        IRepository repository;
        public EstatesController(IRepository repo)
        {
            repository = repo;
        }
        // GET: Estates
        public ActionResult Table()
        {
            return View();
        }
        private List<EstatesJSON> CreateJSONEstate(IQueryable<Estates> estates)
        {
            List<EstatesJSON> estatesJSON = new List<EstatesJSON>();
            //List<Statuses> statusList;
            foreach (Estates p in estates)
            {
                estatesJSON.Add(new EstatesJSON
                {
                    id = p.id,
                    city = p.city,
                    street = p.street,
                    floors = p.floors,
                    floor = p.floor,
                    square = p.square,
                    price = p.price,
                    user_name = p.Users.name,
                    user_id = p.user_id,
                    rooms = p.rooms,
                    type_op = p.type_op,
                    name_op = "Продам",
                });

            }
            return estatesJSON;
            //return Json(stat, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllEstates()
        {
            return Json(CreateJSONEstate(repository.Estates), JsonRequestBehavior.AllowGet);
        }
        public JsonResult getSlides(int? Id)
        {
            if (Id != null)
            {
                string userDir = Server.MapPath("~" + _localImagePath + Id.ToString() + "/");
                string[] listFiles;
                if (System.IO.Directory.Exists(userDir))
                {
                    listFiles = System.IO.Directory.GetFiles(userDir);
                    for (int i = 0; i < listFiles.Count(); i++)
                    {
                        listFiles[i] = _localImagePath + Id.ToString() + "/" + System.IO.Path.GetFileName(listFiles[i]);
                    }
                    return Json(listFiles, JsonRequestBehavior.AllowGet);
                }
            }
            return Json("", JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetImageList(int? Id)
        {
            if (Id != null)
            {
                string userDir = Server.MapPath("~" + _localImagePath + Id.ToString() + "/");
                string[] listFiles;
                if (System.IO.Directory.Exists(userDir))
                {
                    listFiles = System.IO.Directory.GetFiles(userDir);
                    for (int i = 0; i < listFiles.Count(); i++)
                    {
                        listFiles[i] = _localImagePath + Id.ToString() + "/" + System.IO.Path.GetFileName(listFiles[i]);
                    }
                    return Json(listFiles, JsonRequestBehavior.AllowGet);
                }
            }
            return Json("", JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ViewResult EditEstate(Estates estate, HttpPostedFileBase upload)
        {
            //Estates estate = repository.Estates.FirstOrDefault(x => x.ID == Id);

            if (upload != null)
            {
                string fileName = System.IO.Path.GetFileName(upload.FileName);
                string userDir = Server.MapPath("~" + _localImagePath + estate.id.ToString() + "/");
                System.IO.Directory.CreateDirectory(userDir);
                if (System.IO.Directory.Exists(userDir))
                {
                    estate.lastImagePath = userDir + fileName;
                    upload.SaveAs(estate.lastImagePath);
                    estate.lastImagePath = _localImagePath + estate.id.ToString() + "/" + System.IO.Path.GetFileName(estate.lastImagePath);
                }

            }
            estate.listUser = new SelectList(repository.Users.OrderBy(x => x.id), "Id", "Name");
            return View(estate);
        }
        [HttpGet]
        public ViewResult EditEstate(int Id)
        {
            Estates estate = repository.Estates.FirstOrDefault(x => x.id == Id);
            string userDir = Server.MapPath("~" + _localImagePath + estate.id.ToString() + "/");
            string[] listFiles;
            if (System.IO.Directory.Exists(userDir))
            {
                listFiles = System.IO.Directory.GetFiles(userDir);
                if (listFiles.Length > 0)
                    estate.lastImagePath = _localImagePath + estate.id.ToString() + "/" + System.IO.Path.GetFileName(listFiles[0]);
            }
            estate.listUser = new SelectList(repository.Users.OrderBy(x => x.id), "Id", "Name");
            return View(estate);
        }
        public PartialViewResult Gallery(int? Id)
        {
            //   Server.Files();
            return PartialView();
        }
        public JsonResult _UploadImage(string uploadFiles)
        {
            return Json(uploadFiles, JsonRequestBehavior.AllowGet);
        }
        
        public ActionResult UploadImage(HttpPostedFileBase upload, int Id)
        {
            if (upload != null)
            {
                string fileName = System.IO.Path.GetFileName(upload.FileName);
                upload.SaveAs(Server.MapPath("~/Files/Images/" + Id.ToString() + "/" + fileName));
            }
            return EditEstate(Id);
        }

    }
}