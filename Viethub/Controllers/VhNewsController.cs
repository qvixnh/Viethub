using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Viethub.Models;

namespace Viethub.Controllers
{
    public class VhNewsController : Controller
    {
        ViethubEntities _db = new ViethubEntities();
        // GET: News
        public ActionResult Index()
        {
            var v = from t in _db.News
                    where t.hide == false
                    orderby t.order descending
                    select t;
            return View(v.ToList());
        }
        public ActionResult getNewDetail(int id, string meta)
        {
            ViewBag.meta += meta+"tin-tuc";

            if (id == null)
            {
                id = 1;
            }
            var v = from t in _db.News
                    where t.id == id
                    select t;
            return View(v.FirstOrDefault());
        }
    }
}