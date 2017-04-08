﻿using BusinessEntities.Model;
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


         public ActionResult ForgotPassword(UserEntity user)
         {
             if (ModelState.IsValid && !string.IsNullOrEmpty(user.Email))
             {
                 IUserServices userServicObj = new UserServices();
                 var userInfo = userServicObj.GetUsersbyEmail(user.Email);
                 if (user != null)
                 {
                     JadeEmail.SendForgotPassword(userInfo.Email, userInfo.Password);
                     return RedirectToAction("MessagePage", "Home", new { messageKey = "ForgotPasswordSent" });
                 }
                 else
                 {
                     ModelState.AddModelError("", "Incorrect Email Address.");
                 }

             }
             return View();
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
             List<SubCategoryEntity> categoryentities = categoryObj.GetSubCategoriesWithWhere1(new String[] { "Category" }, new String[] { "CATEGORY" }).ToList();
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
         public ActionResult EditCategories(Int32 CategoryId)
         {
             ISubCategory categoryObj = new SubCategoryServices();
             var category = categoryObj.GetSubCategoryById(CategoryId);
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
             List<SubCategoryEntity> categoryentities = categoryObj.GetParentCategories(new String[] { "Category" }, new String[] { "CATEGORY" }).ToList();
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
        public PartialViewResult CreateProductionCompany()   //Insert PartialView  
        {
            IRegion objRegion = new RegionServices();
            ViewBag.RegionEntities = objRegion.GetAllRegions().ToList();
            return PartialView(new ProductionCompanyEntitiy());
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
        public PartialViewResult EditProductionCompany(long productionCompanyId)  // Update PartialView  
        {
            IRegion objRegion = new RegionServices();
            ViewBag.RegionEntities = objRegion.GetAllRegions().ToList();
            ViewBag.ProductionCompanyId = productionCompanyId;
            IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            return PartialView(objProductionCompanyServices.GetProductById(productionCompanyId));
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
            JobEntity objJobEntitiy = TempData.Peek("JobEntity") as JobEntity;
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
        public ActionResult CreateJob()   //Insert Job  
        {
            IRegion objRegion = new RegionServices();
            ViewBag.RegionEntities = objRegion.GetAllRegions().ToList();
            return View(new VmInsertJob());
        }

        [AuthorizeWithSessionAttribute]
        [HttpPost]
        public ActionResult CreateJob(VmInsertJob objVmInsertJob) // Record Insert  
        {
            //IProductionCompanyServices objProductionCompanyServices = new ProductionCompanyServices();
            //objProductionCompanyServices.CreateProduct(objProductionCompanyEntitiy);
            return Json(objVmInsertJob, JsonRequestBehavior.AllowGet);
        }

        [AuthorizeWithSessionAttribute]
        public JsonResult DeleteJob(long jobId)
        {
            IJobs objJobServices = new JobServices();
            return Json(objJobServices.DeleteJob(jobId), JsonRequestBehavior.AllowGet);
        }
    }
}