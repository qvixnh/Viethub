using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Viethub;
using Viethub.Help;
using Viethub.Models;

namespace Viethub.Areas.Admin.Controllers
{
    public class TeamsController : Controller
    {
        private ViethubEntities db = new ViethubEntities();

        // GET: Admin/Teams
        public ActionResult Index()
        {
            return View(db.Teams.ToList());
        }

        // GET: Admin/Teams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Team team = db.Teams.Find(id);
            if (team == null)
            {
                return HttpNotFound();
            }
            return View(team);
        }

        // GET: Admin/Teams/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Teams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,name,Description,icon,link,meta,hide,order,datebegin")] Team team, HttpPostedFileBase img)
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
                        path = Path.Combine(Server.MapPath("~/Content/assets/img/teams"), filename);//duong dan
                        img.SaveAs(path);
                        team.img = filename;
                    }
                    else
                    {
                        team.img = "logo.png";
                    }
                    
                    team.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    team.meta = Functions.ConvertToUnSign(team.meta); //convert Tiếng Việt không dấu
                    db.Teams.Add(team);
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

            return View(team);
        }

        // GET: Admin/Teams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Team team = db.Teams.Find(id);
            if (team == null)
            {
                return HttpNotFound();
            }
            return View(team);
        }

        // POST: Admin/Teams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]

        public ActionResult Edit([Bind(Include = "id,name,Role,Bio,img,meta,hide,order,datebegin")] Team team, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                Team temp = getById(team.id);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/assets/img/latest-team"), filename);
                        img.SaveAs(path);
                        temp.img = filename;
                    }
                    //thong tin nhan vien bep
                    temp.Bio = HttpUtility.HtmlEncode(team.Bio);
                    temp.Role = team.Role;
                    //thong tin chung
                    temp.name = team.name;
                    temp.meta = Functions.ConvertToUnSign(team.meta); //convert Tiếng Việt không dấu
                    temp.hide = team.hide;
                    temp.order = team.order;
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

            return View(team);
        }
        public Team  getById(long id)
        {
            return db.Teams.Where(x => x.id == id).FirstOrDefault();

        }
        // GET: Admin/Teams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Team team = db.Teams.Find(id);
            if (team == null)
            {
                return HttpNotFound();
            }
            return View(team);
        }

        // POST: Admin/Teams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Team team = db.Teams.Find(id);
            db.Teams.Remove(team);
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
