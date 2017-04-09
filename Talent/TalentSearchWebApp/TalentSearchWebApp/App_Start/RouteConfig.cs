﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TalentSearchWebApp
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
           "RegisterRoute",
           "Home/SearchCategory/{category}/{subCategory}",
           new { controller = "Home", action = "SearchCategory" });

            routes.MapRoute(
           "UpdateJobRoute",
           "Admin/CreateJob/{JobId}",
           new { controller = "Admin", action = "CreateJob" });
        }
    }
}