using BusinessEntities.Model;
using BusinessServices.Interfaces;
using BusinessServices.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
        public ActionResult ProductionEmailFormat(CustomEmailFormat email) {
            return View(email);
        }

        [HttpPost]
        public ActionResult NotificationEmailFormat(CustomEmailFormat email)
        {
            return View(email);
        }


        public ActionResult Index()
        {
            return View();
        }

    }
}
