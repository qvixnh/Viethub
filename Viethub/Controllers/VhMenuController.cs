using System.Linq;
using System.Web.Mvc;
using Viethub.Models;

namespace Viethub.Controllers
{
    public class VhMenuController : Controller
    {
        ViethubEntities _db = new ViethubEntities();
        // GET: Menu
        public ActionResult Index()
        {
            var v = from t in _db.Categories
                    where t.hide == false
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getDishByCategoryID(int id, string meta)
        {
            ViewBag.meta += meta + "mon-an";
            if (id == null)
            {
                id = 1;
            }
            var v = from t in _db.Dishes
                    where t.hide == false && t.categoryid == id
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getDetail(int id)
        {
            if (id == null)
            {
                id = 1;
            }
            var v = from t in _db.Dishes
                    where t.id == id
                    select t;
            return View(v.FirstOrDefault());
        }

    }
}