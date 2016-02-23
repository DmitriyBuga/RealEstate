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
            CommonData commonData = new CommonData(repository);
            TableModel tableModel = new TableModel
            {
                estates = CreateJSONEstate(repository.Estates),
                users = commonData.GetUsers(),
                regions = commonData.GetRegions(),
                cities = commonData.GetCities()
            };
            return View(tableModel);
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
                    city_id = p.city_id,
                    rooms = p.rooms,
                    type_op = p.type_op,
                    name_op = "Продам",
                });

            }
            return estatesJSON;
            //return Json(stat, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteImage(string image, int Id)
        {
            System.IO.File.Delete(Server.MapPath("~" + image));
            return Json("", JsonRequestBehavior.AllowGet);
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
        public ViewResult EditEstate(EstateModel modelEstate)
        {

            modelEstate.estate.user_id = modelEstate.estate.Users.id;
            modelEstate.estate.region_id = modelEstate.estate.Regions.id;
            modelEstate.estate.city_id = modelEstate.estate.Cities.id;
            
            ValidateEstate(modelEstate.estate);
            
            if (ModelState.IsValid)
            {
                Estates dbEntry = repository.Estates.FirstOrDefault(x => x.id == modelEstate.estate.id);
                if (dbEntry != null)
                {
                    //dbEntry.price = modelEstate.estate.price;
                    //dbEntry.apt = modelEstate.estate.apt;
                    dbEntry = modelEstate.estate;
                    repository.UpdateRecord<Estates>(modelEstate.estate);
                }
                else
                {
                    modelEstate.estate.Users = repository.Users.FirstOrDefault(x => x.id == modelEstate.estate.user_id);
                    modelEstate.estate.Regions = repository.Regions.FirstOrDefault(x => x.id == modelEstate.estate.region_id);
                    modelEstate.estate.Cities = repository.Cities.FirstOrDefault(x => x.id == modelEstate.estate.city_id);
                    repository.CreateRecord<Estates>(modelEstate.estate);
                }
            }
            modelEstate.listUser = new SelectList(repository.Users.OrderBy(x => x.id), "Id", "Name");
            modelEstate.listRegion = new SelectList(repository.Regions.OrderBy(x => x.id), "Id", "Name");
            modelEstate.listCity = new SelectList(repository.Cities.OrderBy(x => x.id), "Id", "Name");
            return View(modelEstate);
        }
        public void DeleteEstate(int id)
        {
            repository.DeleteRecord<Estates>(repository.Estates.FirstOrDefault(x=>x.id == id));
            if (System.IO.Directory.Exists(Server.MapPath("~" + _localImagePath + id.ToString() + "/")))
                System.IO.Directory.Delete(Server.MapPath("~" + _localImagePath + id.ToString() + "/"));
        }
        private void ValidateEstate(Estates estate)
        {
            if (estate.price == 0)
                ModelState.AddModelError("price", "Не заполнена цена");
        }
        [HttpGet]
        public ViewResult EditEstate(int? Id)
        {
            EstateModel modelEstate = new EstateModel();
            if (Id == null)
                modelEstate.estate = new Estates();
                
            else
                modelEstate.estate = repository.Estates.FirstOrDefault(x => x.id == Id);
            modelEstate.listUser = new SelectList(repository.Users.OrderBy(x => x.id), "Id", "Name");
            modelEstate.listRegion = new SelectList(repository.Regions.OrderBy(x => x.id), "Id", "Name");
            modelEstate.listCity = new SelectList(repository.Cities.OrderBy(x => x.id), "Id", "Name");
            return View(modelEstate);
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
        public string FileUpload()
        {
            int iUploadedCnt = 0;
            int id = 1;
            // DEFINE THE PATH WHERE WE WANT TO SAVE THE FILES.
            System.Web.HttpFileCollection hfc = System.Web.HttpContext.Current.Request.Files;
            id = Convert.ToInt32(System.Web.HttpContext.Current.Request["estateId"]);
            for (int iCnt = 0; iCnt <= hfc.Count - 1; iCnt++)
            {
                
                System.Web.HttpPostedFileBase hpf = Request.Files[iCnt];
                //System.Web.HttpPostedFile hpf = hfc[iCnt];

                if (hpf.ContentLength > 0)
                {
                    string fileName = System.IO.Path.GetFileName(hpf.FileName);
                    string userDir = Server.MapPath("~" + _localImagePath + id.ToString() + "/");
                    System.IO.Directory.CreateDirectory(userDir);
                    if (System.IO.Directory.Exists(userDir))
                    {
                        hpf.SaveAs(userDir + fileName);   
                    }

                    /*
                    // CHECK IF THE SELECTED FILE(S) ALREADY EXISTS IN FOLDER. (AVOID DUPLICATE)
                    if (!System.IO.File.Exists(sPath + System.IO.Path.GetFileName(hpf.FileName)))
                    {
                        // SAVE THE FILES IN THE FOLDER.
                        hpf.SaveAs(sPath + System.IO.Path.GetFileName(hpf.FileName));
                        iUploadedCnt = iUploadedCnt + 1;
                    }
                    */
                }
            }

            // RETURN A MESSAGE (OPTIONAL).
            if (iUploadedCnt > 0)
            {
                return iUploadedCnt + " Files Uploaded Successfully";
            }
            else
            {
                return "Upload Failed";
            }
        }

    }
}