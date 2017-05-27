using BusinessEntities.Model;
using BusinessServices.Interfaces;
using BusinessServices.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TalentSearchWebApp.Common;
using TalentSearchWebApp.Models;

namespace TalentSearchWebApp.Controllers
{
    public class EmailController : Controller
    {
        //
        // GET: /Email/

        [HttpPost]
        public ActionResult ForgotPasswordEmail(ContactUsMail user)
        {
            IUserServices userServicObj = new UserServices();
            var userInfo = userServicObj.GetUsersbyEmail(user.EmailId);
            if (userInfo != null)
            {
                return View(userInfo);
            }
            return null;
        }

        [HttpPost]
        public ActionResult EnquiryFormEmail(ContactUsMail user)
        {
            return View(user);
        }

        [HttpPost]
        public ActionResult ProductionEmailFormat(CustomEmailFormat email)
        {
            return View(email);
        }

        [HttpPost]
        public ActionResult NotificationEmailFormat(CustomEmailFormat email)
        {
            return View(email);
        }

        [HttpPost]
        public ActionResult ProductionCompanyEmail(NotificationEmail emailData)
        {
            return View(emailData);
        }

        [HttpPost]
        public ActionResult TalentEmail(NotificationEmail emailData)
        {
            return View(emailData);
        }

        [HttpPost]
        public JsonResult SendBulkEmail(ContactUsMail email)
        {

            if (!String.IsNullOrEmpty(email.Message))
            {
                JadeEmail.SendBulkMessage(email.EmailId, email.Subject, email.Message);
                return Json(true, JsonRequestBehavior.AllowGet);
            }

            return Json(false, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
