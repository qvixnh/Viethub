using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Viethub.Help;
using Viethub.Models;

namespace Viethub.Areas.Admin.Controllers
{
    public class DishesController : Controller
    {
        private ViethubEntities db = new ViethubEntities();

        // GET: Admin/Dishes
        public ActionResult Index(long? id = null)
        {
            getCategory(id);
            return View();
        }
        public void getCategory(long? selectedId = null)
        {
            ViewBag.Category = new SelectList(db.Categories.Where(x => x.hide == false).OrderBy(x => x.order), "id", "name", selectedId);
        }
        public ActionResult getDishes(long? id)
        {
            if (id == null)
            {
                var v = db.Dishes.OrderBy(x => x.order).ToList();
                return PartialView(v);
            }
            var m = db.Dishes.Where(x=> x.categoryid== id).OrderBy(x => x.order).ToList();
            return PartialView(m);
        }
        // GET: Admin/Di
        // shes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dish dish = db.Dishes.Find(id);
            if (dish == null)
            {
                return HttpNotFound();
            }
            return View(dish);
        }

        // GET: Admin/Dishes/Create
        public ActionResult Create()
        {
            ViewBag.categoryid = new SelectList(db.Categories, "id", "name");
            return View();
        }

        // POST: Admin/Dishes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,name,price,img,description,meta,hide,order,datebegin,categoryid")] Dish dish, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/assets/img/products"), filename);
                        img.SaveAs(path);
                        dish.img = filename;
                    }
                    else
                    {
                        dish.img = "logo.png";
                    }
                    db.Dishes.Add(dish);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            ViewBag.categoryid = new SelectList(db.Categories, "id", "name", dish.categoryid);
            return View(dish);
        }


        // GET: Admin/Dishes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dish dish = db.Dishes.Find(id);
            if (dish == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryid = new SelectList(db.Categories, "id", "name", dish.categoryid);
            return View(dish);
        }

        // POST: Admin/Dishes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]

        public ActionResult Edit([Bind(Include = "id,name,price,img,description,meta,hide,order,datebegin,categoryid")] Dish dish, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                Dish temp = db.Dishes.Find(dish.id);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/assets/img/products"), filename);
                        img.SaveAs(path);
                        temp.img = filename; //Lưu ý
                    }
                    temp.name = dish.name;
                    temp.price = dish.price;
                    temp.description = dish.description;
                    temp.meta = Functions.ConvertToUnSign(dish.meta); //convert Tiếng Việt không dấu
                    temp.hide = dish.hide;
                    temp.order = dish.order;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                    return RedirectToAction("Index", "Dish", new { id = dish.categoryid });
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            ViewBag.categoryid = new SelectList(db.Categories, "id", "name", dish.categoryid);
            return View(dish);
        }

        // GET: Admin/Dishes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dish dish = db.Dishes.Find(id);
            if (dish == null)
            {
                return HttpNotFound();
            }
            return View(dish);
        }

        // POST: Admin/Dishes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Dish dish = db.Dishes.Find(id);
            db.Dishes.Remove(dish);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
