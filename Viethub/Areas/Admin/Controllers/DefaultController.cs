using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Viethub.Models;

namespace Viethub.Areas.Admin.Controllers
{
    public class DefaultController : Controller
    {
        ViethubEntities _db = new ViethubEntities();
        // GET: Admin/Default
        public ActionResult Index()
        {
            int dishesCount = _db.Dishes.Count();
            int categoriesCount = _db.Categories.Count();
            int newsCount = _db.News.Count();
            int voucherCount = _db.Vouchers.Count();
            int userCount = _db.UserAccounts.Count();
            ViewBag.CategoriesCount = categoriesCount; // passing data to the view
            ViewBag.NewsCount = newsCount; // passing data to the view
            ViewBag.DishesCount = dishesCount; // passing data to the view
            ViewBag.voucherCount = voucherCount;
            ViewBag.UserAccountsCount = userCount;
            return View();
        }
    }
}