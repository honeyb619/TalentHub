using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TalentSearchWebApp
{
    public class AuthorizeWithSessionAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session == null || httpContext.Session["UserInfo"] == null)
                return false;

            return base.AuthorizeCore(httpContext);
        }

    }
}