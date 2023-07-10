    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Viethub
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //HOME ROUTING
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            //NEWS ROUTING
            
            routes.MapRoute(
                name: "News",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "VhNews", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Viethub.Controllers" }
            );
            routes.MapRoute("New Detail", "{controller}/{type}/{meta}/{id}", new { Controller = "VhNews", action = "getNewDetail", id = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type","tin-tuc"}
                },
                new[] { "Viethub.Controllers" });
            //DISH MENU ROUTING
            routes.MapRoute(
                name: "Menus",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "VhMenu", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Viethub.Controllers" }
            );
            routes.MapRoute("Dish Detail", "{controller}/{type}/{meta}/{id}", new { Controller = "VhMenu", action = "getDetail", id = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type","mon-an"}
                },
                new[] { "Viethub.Controllers" });
            
        }
    }
}
