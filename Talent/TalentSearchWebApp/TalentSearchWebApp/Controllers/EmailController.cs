using BusinessEntities.Model;
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
        public ActionResult ForgotPasswordEmail(UserEntity user)
        {
            return View(user);
        }

        [HttpPost]
        public ActionResult EnquiryFormEmail(ContactUsMail user)
        {
            return View(user);
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
