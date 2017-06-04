using BusinessEntities.Model;
using BusinessEntities.ViewModel;
using BusinessServices.Interfaces;
using BusinessServices.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using TalentSearchWebApp.Common;
using TalentSearchWebApp.Models;


namespace TalentSearchWebApp.Controllers
{
    public class AdminController : Controller
    {
        public List<VmMainSkills> MenuModel { get; set; }

        public AdminController()
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

        [AuthorizeWithSessionAttribute]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LogOn(UserEntity model)
        {
            if (User.Identity.IsAuthenticated && Session["UserInfo"] != null)
            {
                return Redirect(Url.Action("Index", "Admin"));
            }
            else if (ModelState.IsValid && model.UserName != null && model.Password != null)
            {
                IUserServices userServicObj = new UserServices();
                var user = userServicObj.GetUsers(model.UserName);
                if (user != null && user.Password == model.Password)
                {
                    Session["UserInfo"] = user;
                    FormsAuthentication.SetAuthCookie(model.UserName, false);
                    return Redirect(Url.Action("Index", "Home"));
                }
                else
                {
                    ModelState.AddModelError("", "Incorrect username or password");
                }
            }

            return View();
        }

        [AuthorizeWithSessionAttribute]
        public ActionResult LogOut()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            return RedirectToAction("index", "Home");
        }

        [AuthorizeWithSessionAttribute]
        public ActionResult AddTalent()
        {
            return RedirectToAction("RegisterTalent", "Home");
        }


        [AuthorizeWithSessionAttribute]
        public ActionResult ChangePassword(UserEntity model)
        {
            model.UserName = ((UserEntity)Session["UserInfo"]).UserName;
            if (ModelState.IsValid && model.UserName != null && model.Password != null)
            {
                IUserServices userServicObj = new UserServices();
                var user = userServicObj.UpdateUsers(model);
                if (user != null && user.Password == model.Password)
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, false);
                    ViewBag.isPasswordSaved = true;
                }
                else
                {
                    ModelState.AddModelError("", "Incorrect username or password");
                }
            }
            else
            {
                ViewBag.isPasswordSaved = false;
            }

            return View();
        }


        public ActionResult ForgotPassword(ContactUsMail user)
        {
            if (!string.IsNullOrEmpty(user.EmailId))
            {
                if (!String.IsNullOrEmpty(user.Message))
                {
                    JadeEmail.SendForgotPassword(user.EmailId, user.Message);
                    return Json(true, JsonRequestBehavior.AllowGet);
                }

            }
            return View();
        }

        [AuthorizeWithSession]
        public JsonResult GetRegions()
        {
            IRegion objRegion = new RegionServices();
            var regions = objRegion.GetAllRegions();
            return Json(regions, JsonRequestBehavior.AllowGet);
        }

        //public JsonResult Delete(Int32 empid)  
        //{  
        //    EmployeeData emp = db.EmployeeDatas.Where(x => x.EmpID == empid).FirstOrDefault();  
        //    db.EmployeeDatas.DeleteOnSubmit(emp);  
        //    db.SubmitChanges();  
        //    return Json(true, JsonRequestBehavior.AllowGet);  
        //}  

        [AuthorizeWithSessionAttribute]
        public ActionResult Categories()
        {
            ISubCategory categoryObj = new SubCategoryServices();
            List<SubCategoryEntity> categoryentities = categoryObj.GetParentChildSubCategoriesWithWhere(new String[] { "Category" }, new String[] { "CATEGORY" }).ToList();
            return View(categoryentities);
        }

        [AuthorizeWithSessionAttribute]
        public ActionResult DeleteCategories(Int32 CategoryId)
        {
            ISubCategory categoryObj = new SubCategoryServices();
            categoryObj.DeleteSubCategory(CategoryId, 1);
            return Json(true, JsonRequestBehavior.AllowGet);
        }


        [AuthorizeWithSessionAttribute]
        public ActionResult EditCategories(Int32 CategoryId,string CategoryName=null)
        {
            ISubCategory categoryObj = new SubCategoryServices();
            var category = categoryObj.GetSubCategoryById(CategoryId);
            ViewBag.CategoryName = CategoryName;
            return View(category);
        }

        [AuthorizeWithSession]
        [HttpPost]
        public ActionResult UpdateCategoryDetails(SubCategoryEntity entity)
        {
            ISubCategory categoryObj = new SubCategoryServices();
            categoryObj.UpdateSubCategory(entity.SubCategoryId, entity);
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSession]
        public ActionResult AddMainCategory()
        {
            return View();
        }

        [AuthorizeWithSession]
        [HttpPost]
        public ActionResult SaveMainCategory(SubCategoryEntity entity)
        {
            ISubCategory categoryObj = new SubCategoryServices();
            categoryObj.AddMainCategory(entity);
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSession]
        public ActionResult AddChildCategory()
        {
            ISubCategory categoryObj = new SubCategoryServices();
            List<SubCategoryEntity> categoryentities = new List<SubCategoryEntity>();

            categoryentities = categoryObj.GetParentCategories(new String[] { "Category" }, new String[] { "CATEGORY" }).ToList();

            ViewBag.AvaiableEnums = categoryentities.Select(x =>
                                    new SelectListItem()
                                    {
                                        Text = x.SubCategoryName,
                                        Value = x.SubCategoryId.ToString()
                                    });
            return View();
        }

        [AuthorizeWithSession]
        [HttpPost]
        public ActionResult SaveChildCategory(SubCategoryEntity entity)
        {
            ISubCategory categoryObj = new SubCategoryServices();
            categoryObj.AddChildCategory(entity);
            return Json(true, JsonRequestBehavior.AllowGet);
        }


        [AuthorizeWithSessionAttribute]
        public ActionResult ProductionCompany() //Record Select  
        {
            return View();
        }

        [AuthorizeWithSessionAttribute]
        public PartialViewResult GetProductionCompanyData(int page = 1, string sort = "ModifiedDate", string sortdir = "DESC")
        {
            ProductionCompanyEntitiy objProductionCompanyEntitiy = null;

            if (Request.IsAjaxRequest())
            {
                objProductionCompanyEntitiy = TempData.Peek("ProductionCompanyEntitiy") as ProductionCompanyEntitiy;
            }
            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            return PartialView("_ProductionCompanyList", objProductionCompanyServices.GetAllProducts(page, sort, sortdir, objProductionCompanyEntitiy));
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public PartialViewResult GetProductionCompanyData(ProductionCompanyEntitiy productionCompanyEntitiy)
        {
            TempData["ProductionCompanyEntitiy"] = productionCompanyEntitiy;
            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            return PartialView("_ProductionCompanyList", objProductionCompanyServices.GetAllProducts(1, "ModifiedDate", "DESC", productionCompanyEntitiy));
        }

        [AuthorizeWithSessionAttribute]
        [HttpGet]
        public ViewResult CreateProductionCompany()   //Insert PartialView  
        {
            IRegion objRegion = new RegionServices();
            ViewBag.RegionEntities = objRegion.GetAllRegions().ToList();
            return View(new ProductionCompanyEntitiy());
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public JsonResult CreateProductionCompany(ProductionCompanyEntitiy objProductionCompanyEntitiy) // Record Insert  
        {
            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            objProductionCompanyServices.CreateProduct(objProductionCompanyEntitiy);
            return Json(objProductionCompanyEntitiy, JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        [HttpGet]
        public ViewResult EditProductionCompany(long productionCompanyId)  // Update PartialView  
        {
            IRegion objRegion = new RegionServices();
            ViewBag.RegionEntities = objRegion.GetAllRegions().ToList();
            ViewBag.ProductionCompanyId = productionCompanyId;
            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            return View(objProductionCompanyServices.GetProductById(productionCompanyId));
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public JsonResult EditProductionCompany(ProductionCompanyEntitiy objProductionCompanyEntitiy)  // Record Update 
        {
            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            objProductionCompanyServices.UpdateProduct(objProductionCompanyEntitiy);
            return Json(objProductionCompanyEntitiy, JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        public JsonResult Delete(long productionCompanyId) // Delete Production Company
        {
            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            return Json(objProductionCompanyServices.DeleteProduct(productionCompanyId), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        public ActionResult Jobs() //Record Select  
        {
            return View();
        }

        [AuthorizeWithSessionAttribute]
        public PartialViewResult GetJobsData(int page = 1, string sort = "ModifiedDate", string sortdir = "DESC")
        {
            JobEntity objJobEntitiy = null;

            if (Request.IsAjaxRequest())
            {
                objJobEntitiy = TempData.Peek("JobEntity") as JobEntity;
            }
            IJobs objJobServices = new JobServices();
            return PartialView("_JobList", objJobServices.GetAllJobs(page, sort, sortdir, objJobEntitiy));
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public PartialViewResult GetJobsData(JobEntity jobEntitiy)
        {
            TempData["JobEntity"] = jobEntitiy;
            IJobs objJobServices = new JobServices();
            return PartialView("_JobList", objJobServices.GetAllJobs(1, "ModifiedDate", "DESC", jobEntitiy));
        }

        [AuthorizeWithSessionAttribute]
        [HttpGet]
        public JsonResult GetJobsbyTalentId(long TalentId)
        {
            IJobs objJobServices = new JobServices();
            return Json(objJobServices.GetJobsByTalentId(TalentId), JsonRequestBehavior.AllowGet);
        }


        [AuthorizeWithSessionAttribute]
        [HttpGet]
        public ActionResult CreateJob(long JobId = 0)  //Insert Job  
        {
            string[] categoryNames = { "New Zealand Language", "Category", "Job Status" };
            string[] masterCategoryNames = { "LANGUAGE", "CATEGORY", "STATUS" };

            VmInsertJob objVmInsertJob = new VmInsertJob();

            if (JobId != 0)
            {
                ViewBag.PageAction = "Update";
                IJobs objJobServices = new JobServices();
                objVmInsertJob = objJobServices.GetJobById(JobId);
            }
            else
            {
                ViewBag.PageAction = "Create";
                objVmInsertJob.Skills.Add(new VmSkills());
            }

            ISubCategory objSubCategory = new SubCategoryServices();
            objVmInsertJob.SubCategoryEntities = objSubCategory.GetSubCategoriesWithWhere(categoryNames, masterCategoryNames).ToList();

            IRegion objRegion = new RegionServices();
            objVmInsertJob.RegionEntities = objRegion.GetAllRegions().ToList();

            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            objVmInsertJob.ProductionCompanyList = objProductionCompanyServices.GetProductionCompanyDropdown();

            return View(objVmInsertJob);
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public ActionResult CreateJob(VmInsertJob objVmInsertJob) // Record Insert  
        {
            IJobs objJobServices = new JobServices();
            if (objVmInsertJob.JobId == 0)
                return Json(objJobServices.CreateJob(objVmInsertJob), JsonRequestBehavior.AllowGet);
            else
                return Json(objJobServices.UpdateJob(objVmInsertJob), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        public JsonResult DeleteJob(long jobId)
        {
            IJobs objJobServices = new JobServices();
            return Json(objJobServices.DeleteJob(jobId), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        public ActionResult Talents(string search = null, bool AdvancedSearch = false, string Region = null, string Ethicity = null, string HairColor = null, string EyeColor = null, string Age = null, string Waist = null, string Hip = null, string ChestBust = null)
        {
            ITalentServices talentObj = new TalentServices();
            if (AdvancedSearch)
            {
                var talents = talentObj.GetAllTalentsbyAdvancedSearch(Region, Ethicity, HairColor, EyeColor, Age, Waist, Hip, ChestBust);
                return View(talents);

            }
            else
            {
                var talents = talentObj.GetAllTalents(search);
                return View(talents);
            }

        }

        [AuthorizeWithSessionAttribute]
        public JsonResult DeleteTalent(long TalentId)
        {
            ITalentServices objJobServices = new TalentServices();
            return Json(objJobServices.DeleteTalent(TalentId), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        public JsonResult DeleteMedia(long MediaId)
        {
            IMediaServices objJobServices = new MediaServices();
            return Json(objJobServices.DeleteMedia(MediaId), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        public ActionResult EditTalent(long TalentId)
        {
            ITalentServices objJobServices = new TalentServices();
            var talent = objJobServices.GetTalentById(TalentId);
            ViewBag.talent = talent;
            string[] categoryNames = { "New Zealand Language", "Category" };
            string[] masterCategoryNames = { "LANGUAGE", "CATEGORY" };
            VmInsertTalent objVmInsertTalent = new VmInsertTalent();
            ISubCategory objSubCategory = new SubCategoryServices();
            objVmInsertTalent.SubCategoryEntities = objSubCategory.GetSubCategoriesWithWhere(categoryNames, masterCategoryNames).ToList();

            IRegion objRegion = new RegionServices();
            objVmInsertTalent.RegionEntities = objRegion.GetAllRegions().ToList();

            return View(objVmInsertTalent);

        }

        [HttpPost]
        public JsonResult SendEmail(ContactUsMail email)
        {

            if (!String.IsNullOrEmpty(email.Message))
            {
                JadeEmail.SendMessage(email.Message);
                return Json(true, JsonRequestBehavior.AllowGet);
            }

            return Json(false, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult UpdateTalent(VmInsertTalent objVmInsertTalent)
        {
            if (objVmInsertTalent.LanguageIds != null)
            {
                objVmInsertTalent.LanguageIds.Remove(0);
            }

            ITalentServices objTalentServices = new TalentServices();
            long talentId = objTalentServices.UpdateTalent(objVmInsertTalent);

            return Json(talentId);
        }

        [AuthorizeWithSessionAttribute]
        [HttpGet]
        public JsonResult GetTalentsForJob(long jobId, bool AdvancedSearch = false, string Region = null, string Ethicity = null, string HairColor = null, string EyeColor = null, string Age = null, string Waist = null, string Hip = null, string ChestBust = null)
        {
            ITalentServices objTalentServices = new TalentServices();
            if (AdvancedSearch)
            {
                return Json(objTalentServices.GetTalentsForJob(jobId, AdvancedSearch, Region, Ethicity, HairColor, EyeColor, Age, Waist, Hip, ChestBust), JsonRequestBehavior.AllowGet);
            }
            return Json(objTalentServices.GetTalentsForJob(jobId), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        [HttpGet]
        public JsonResult LoadjobTalentStatus()
        {
            string[] categoryNames = { "Job Talent Status" };
            string[] masterCategoryNames = { "STATUS" };

            ISubCategory objSubCategory = new SubCategoryServices();
            return Json(objSubCategory.GetSubCategoriesWithWhere(categoryNames, masterCategoryNames).ToList(), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public ActionResult SaveJobTalentAssociation(VmSaveJobTalentAssociation objVmSaveJobTalentAssociation)
        {
            IJobs objJobServices = new JobServices();
            return Json(objJobServices.SaveJobTalentAssociation(objVmSaveJobTalentAssociation), JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public JsonResult GetNotificationDetails(VmSaveJobTalentAssociation objVmSaveJobTalentAssociation)
        {
            Dictionary<string, string> NotificationDetails = new Dictionary<string, string>();
            IJobs ObjJobService = new JobServices();
            ITalentServices ObjTalentService = new TalentServices();
            IProductionCompanyServices ObjProductionCompany = new ProductionCompanyServices();
            ISubCategory ObjSubCategory = new SubCategoryServices();
            VmTalentEntity Talent = ObjTalentService.GetTalentById(objVmSaveJobTalentAssociation.TalentStatusIds[0].TalentId);
            NotificationDetails["ProductionEmail"] = ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).Email;
            NotificationDetails["ProductionComanyName"] = ObjProductionCompany.GetProductById(ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).ProductionCompanyId).ProductionCompanyName;
            NotificationDetails["TalentName"] = Talent.FirstName + " " + Talent.LastName;
            NotificationDetails["JobStatus"] = ObjSubCategory.GetSubCategoryById(objVmSaveJobTalentAssociation.TalentStatusIds[0].StatusId).SubCategoryName;
            NotificationDetails["TalentEmail"] = Talent.EmailId;
            NotificationDetails["JobDescription"] = ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).JobDescription;
            NotificationDetails["JobName"] = ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).JobName;
            NotificationDetails["TalentId"] = Talent.TalentId.ToString();
            NotificationDetails["Region"] = Talent.RegionName;
            return Json(NotificationDetails);
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public JsonResult GetCompanyNotificationDetails(VmSaveJobTalentAssociation objVmSaveJobTalentAssociation)
        {

            List<Dictionary<string, string>> NotificationDetails = new List<Dictionary<string, string>>();
            IJobs ObjJobService = new JobServices();
            ITalentServices ObjTalentService = new TalentServices();
            IProductionCompanyServices ObjProductionCompany = new ProductionCompanyServices();
            ISubCategory ObjSubCategory = new SubCategoryServices();
            foreach (var TalentObj in objVmSaveJobTalentAssociation.TalentStatusIds)
            {
                Dictionary<string, string> NotificationDetail = new Dictionary<string, string>();
                VmTalentEntity Talent = ObjTalentService.GetTalentById(TalentObj.TalentId);
                NotificationDetail["ProductionEmail"] = ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).Email;
                NotificationDetail["ProductionComanyName"] = ObjProductionCompany.GetProductById(ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).ProductionCompanyId).ProductionCompanyName;
                NotificationDetail["TalentName"] = Talent.FirstName + " " + Talent.LastName;
                NotificationDetail["JobStatus"] = ObjSubCategory.GetSubCategoryById(TalentObj.StatusId).SubCategoryName;
                NotificationDetail["TalentEmail"] = Talent.EmailId;
                NotificationDetail["JobDescription"] = ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).JobDescription;
                NotificationDetail["JobName"] = ObjJobService.GetJobById(objVmSaveJobTalentAssociation.JobId).JobName;
                NotificationDetail["TalentId"] = Talent.TalentId.ToString();
                NotificationDetail["Region"] = Talent.RegionName;
                NotificationDetails.Add(NotificationDetail);
            }
            return Json(NotificationDetails);
        }

        public ActionResult Languages()
        {
            ISubCategory categoryObj = new SubCategoryServices();
            List<SubCategoryEntity> categoryentities = categoryObj.GetParentChildSubCategoriesWithWhere(new String[] { "New Zealand Language" }, new String[] { "LANGUAGE" }).OrderBy(x=>x.SubCategoryName).ToList();
            return View(categoryentities);
        }

        public ActionResult Ethicity()
        {
            ISubCategory categoryObj = new SubCategoryServices();
            List<SubCategoryEntity> categoryentities = categoryObj.GetParentChildSubCategoriesWithWhere(new String[] { "New Zealand Ethincity" }, new String[] { "ETHNICITY" }).OrderBy(x => x.SubCategoryName).ToList();
            return View(categoryentities);
        }


        public ActionResult AddIndependentcategories(string CategoryName) {
             ISubCategory categoryObj = new SubCategoryServices();
             var masterCategory = categoryObj.getMasterCategories(CategoryName);
             if (masterCategory.Count > 0) {
                 ViewBag.Mastercategory = masterCategory[0];
                 ViewBag.CategoryName = CategoryName;
                 return View();
             }
             return Content("Category not Found");
        }

        [AuthorizeWithSession]
        [HttpPost]
        public ActionResult SaveIndependentCategory(SubCategoryEntity entity)
        {
            ISubCategory categoryObj = new SubCategoryServices();
            categoryObj.AddIndependentCategory(entity);
            return Json(true, JsonRequestBehavior.AllowGet);
        }


    }
}
