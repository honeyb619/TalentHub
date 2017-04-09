using BusinessServices.Interfaces;
using BusinessServices.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessEntities.ViewModel;
using System.IO;
using System.Web.Routing;
using TalentSearchWebApp.Common;
using System.Net.Mail;
using TalentSearchWebApp.Models;

namespace JADE_TALENT.Controllers
{
    public class HomeController : Controller
    {

        public List<VmMainSkills> MenuModel { get; set; }

        public HomeController()
        {

        }
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);

            if (requestContext.HttpContext.User.Identity.IsAuthenticated && Session["UserInfo"] != null)
            {
                AdminMenu();
            }
            else
            {
                UserMenu();
            }


        }

        private void UserMenu()
        {
            ISubCategory subcatService = new SubCategoryServices();
            this.MenuModel = subcatService.GetParentChildCategoriesWithWhere();
            this.ViewData["MenuModel"] = this.MenuModel;
        }

        private void AdminMenu()
        {
            ISubCategory subcatService = new SubCategoryServices();
            this.MenuModel = subcatService.GetParentChildAdminCategoriesWithWhere();
            this.ViewData["MenuModel"] = this.MenuModel;
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult RegisterTalent()
        {
            string[] categoryNames = { "New Zealand Language", "Category" };
            string[] masterCategoryNames = { "LANGUAGE", "CATEGORY" };

            VmInsertTalent objVmInsertTalent = new VmInsertTalent();
            ISubCategory objSubCategory = new SubCategoryServices();
            objVmInsertTalent.SubCategoryEntities = objSubCategory.GetSubCategoriesWithWhere(categoryNames, masterCategoryNames).ToList();

            IRegion objRegion = new RegionServices();
            objVmInsertTalent.RegionEntities = objRegion.GetAllRegions().ToList();

            return View(objVmInsertTalent);
        }

        // POST: /User/Create
        [HttpPost]
        public JsonResult RegisterTalent(VmInsertTalent objVmInsertTalent)
        {
            if (objVmInsertTalent.LanguageIds != null)
            {
                objVmInsertTalent.LanguageIds.Remove(0);
            }

            ITalentServices objTalentServices = new TalentServices();
            long talentId = objTalentServices.CreateTalent(objVmInsertTalent);

            return Json(talentId);
        }

        public ActionResult ContactUs(ContactUsMail emailObj)
        {
            if (ModelState.IsValid)
            {
                JadeEmail.SendEnquiryMessage(emailObj);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return View();
        }
        public ActionResult Profile(long ProfileId = 1000)
        {
            ITalentServices obj = new TalentServices();
            var talent = obj.GetTalentById(ProfileId);
            return View(talent);
        }

        public ActionResult UploadFiles()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UploadFile(HttpPostedFileBase fileObj, string isImage)
        {
            var img = Path.GetFileName(fileObj.FileName);
            var path = "";
            Dictionary<string, string> result = new Dictionary<string, string>();
            if (ModelState.IsValid)
            {
                result["FileName"] = System.IO.Path.GetFileName(fileObj.FileName);
                string FileExtension = System.IO.Path.GetFileName(fileObj.FileName).Split('.').Last();
                string FileName = DateTime.Now.ToFileTime() + "." + FileExtension;
                if (fileObj != null && fileObj.ContentLength > 0)
                {
                    if (isImage == "true")
                    {
                        path = Path.Combine(Server.MapPath("~/Content/Files/Image"), FileName);
                        result["path"] = string.Format("{0}/{1}", "../Content/Files/Image", FileName);
                    }
                    else
                    {
                        path = Path.Combine(Server.MapPath("~/Content/Files/Video"), FileName);
                        result["path"] = string.Format("{0}/{1}", "../Content/Files/Video", FileName);
                    }
                    fileObj.SaveAs(path);

                }
                return Json(result);
            }
            return Content("File Not Saved Successfully");
        }

        [HttpPost]
        public ActionResult TalentMedia(VmMedias media)
        {
            IMediaServices mediaservice = new MediaServices();
            var mediaId = mediaservice.CreateMedia(media);
            return Json("Media Created with id :" + mediaId);

        }

        public ActionResult MessagePage(string messageKey)
        {
            var message = TalentSearchWebApp.Resources.JadeTalentResource.ResourceManager.GetString(messageKey);
            return View((object)message);
        }

        public ActionResult SearchCategory(string category, string subCategory)
        {
            ITalentServices objTalentServices = new TalentServices();
            return View(objTalentServices.GetPublicTalents(category, subCategory, User.Identity.IsAuthenticated));
        }
    }
}
