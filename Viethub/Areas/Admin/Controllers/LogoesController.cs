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
    public class LogoesController : Controller
    {
        private ViethubEntities db = new ViethubEntities();

        // GET: Admin/Logoes
        public ActionResult Index()
        {
            return View(db.Logoes.ToList());
        }

        // GET: Admin/Logoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        // GET: Admin/Logoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Logoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,name,Description,icon,link,meta,hide,order,datebegin")] Logo logo, HttpPostedFileBase img)
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
                        path = Path.Combine(Server.MapPath("~/Content/assets/img"), filename);//duong dan
                        img.SaveAs(path);
                        logo.icon = filename;
                    }
                    else
                    {
                        logo.icon = "logo.png";
                    }

                    logo.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    logo.meta = Functions.ConvertToUnSign(logo.meta); //convert Tiếng Việt không dấu
                    db.Logoes.Add(logo);
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

            return View(logo);
        }

        // GET: Admin/Logoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        // POST: Admin/Logoes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,name,Description,icon,link,meta,hide,order,datebegin")] Logo logo, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                Logo temp = getById(logo.id);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/assets/img"), filename);
                        img.SaveAs(path);
                        logo.icon = filename;
                    }
                    //thong tin rieng
                    temp.Description = logo.Description;
                    temp.link= logo.link;
                    //thong tin chung
                    temp.name = temp.Description;
                    temp.meta = Functions.ConvertToUnSign(logo.meta); //convert Tiếng Việt không dấu
                    temp.hide = logo.hide;
                    temp.order = logo.order;
                    temp.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    db.Entry(temp).State = EntityState.Modified;
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

            return View(logo);
        }
        public Logo getById(long id)
        {
            return db.Logoes.Where(x => x.id == id).FirstOrDefault();

        }

        // GET: Admin/Logoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        // POST: Admin/Logoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Logo logo = db.Logoes.Find(id);
            db.Logoes.Remove(logo);
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
