using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Viethub.Models;

namespace Viethub.Controllers
{
    public class CDishesController : Controller
    {
        ViethubEntities _db = new ViethubEntities();
        // GET: Dish
        public ActionResult Index()
        {
            return View();
        }
        
    }
}