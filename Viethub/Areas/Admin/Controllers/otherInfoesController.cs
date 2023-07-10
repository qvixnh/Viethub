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
    public class otherInfoesController : Controller
    {
        private ViethubEntities db = new ViethubEntities();

        // GET: Admin/otherInfoes
        public ActionResult Index()
        {
            return View(db.otherInfoes.ToList());
        }

        // GET: Admin/otherInfoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            otherInfo otherInfo = db.otherInfoes.Find(id);
            if (otherInfo == null)
            {
                return HttpNotFound();
            }
            return View(otherInfo);
        }

        // GET: Admin/otherInfoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/otherInfoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]

        public ActionResult Create([Bind(Include = "id,name,description,meta,hide,order,datebegin")] otherInfo otherInfo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    otherInfo.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    otherInfo.meta = Functions.ConvertToUnSign(otherInfo.meta); //convert Tiếng Việt không dấu
                    db.otherInfoes.Add(otherInfo);
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

            return View(otherInfo);
        }

        // GET: Admin/otherInfoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            otherInfo otherInfo = db.otherInfoes.Find(id);
            if (otherInfo == null)
            {
                return HttpNotFound();
            }
            return View(otherInfo);
        }

        // POST: Admin/otherInfoes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,name,description,meta,hide,order,datebegin")] otherInfo otherInfo)
        {
            try
            {
                otherInfo temp = getById(otherInfo.id);
                if (ModelState.IsValid)
                {
                    //thong tin rieng
                    temp.description = HttpUtility.HtmlEncode(otherInfo.description);
                    //thong tin chung
                    temp.name = otherInfo.name;
                    temp.meta = Functions.ConvertToUnSign(otherInfo.meta); //convert Tiếng Việt không dấu
                    temp.hide = otherInfo.hide;
                    temp.order = otherInfo.order;
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

            return View(otherInfo);
        }
        public otherInfo getById(long id)
        {
            return db.otherInfoes.Where(x => x.id == id).FirstOrDefault();

        }
        // GET: Admin/otherInfoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            otherInfo otherInfo = db.otherInfoes.Find(id);
            if (otherInfo == null)
            {
                return HttpNotFound();
            }
            return View(otherInfo);
        }

        // POST: Admin/otherInfoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            otherInfo otherInfo = db.otherInfoes.Find(id);
            db.otherInfoes.Remove(otherInfo);
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
