using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Viethub.Models;

namespace Viethub.Controllers
{
    public class HomeController : Controller
    {
        ViethubEntities _db = new ViethubEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult getMenu()
        {
            var v = from t in _db.Menus
                    where t.hide == false
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getBanner()
        {
            var v = from t in _db.Banners
                    where t.hide == false
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getFooter()
        {
            var v = from t in _db.Footers
                    where t.hide == false
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getLogo()
        {
            var v = from t in _db.Logoes
                    where t.hide == false
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getTeam()
        {
            var v = from t in _db.Teams
                    where t.hide == false
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getOtherInfo()
        {
            var v = from t in _db.otherInfoes
                    where t.hide == false && t.order==1 //order = 1 is for Footer, 2 for Contact, 3 for About
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getOtherInfoContact()
        {
            var v = from t in _db.otherInfoes
                    where t.hide == false && t.order == 2 //order = 1 is for Footer, 2 for Contact, 3 for location
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getLocation()
        {
            var v = from t in _db.otherInfoes
                    where t.hide == false && t.order == 3 //order = 1 is for Footer, 2 for Contact, 3 for location
                    select t;
            return PartialView(v.ToList());
        }

    }
}