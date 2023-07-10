using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Viethub.Models;

namespace Viethub.Controllers
{
    public class AccountController : Controller
    {
        ViethubEntities _db = new ViethubEntities();
        // GET: Account
        public ActionResult Index()
        {

            return View();

        }
        [HttpPost]
        public ActionResult Login(UserAccount user)
        {
            if (ModelState.IsValid)
            {
                var validUser = _db.UserAccounts.FirstOrDefault(u => u.username == user.username && u.pw == user.pw);
                if (validUser != null)
                {
                    // User authenticated successfully, set authentication cookie and redirect to home page
                    FormsAuthentication.SetAuthCookie(validUser.username, false);
                    // Lưu user-id vào Session
                    Session["UserId"] = user.id;
                    // Chuyển hướng tới trang chủ
                    return RedirectToAction("Index", "Home");

                }
                else
                {
                    ModelState.AddModelError("", "Invalid username or password.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(user);
        }
        // GET: Account/Register
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        // POST: Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(UserAccount user)
        {
            if (ModelState.IsValid)
            {
                var existingUser = _db.UserAccounts.FirstOrDefault(u => u.username == user.username);
                if (existingUser != null)
                {
                    ModelState.AddModelError("", "Username is already taken.");
                    return View(user);
                }

                _db.UserAccounts.Add(user);
                _db.SaveChanges();

                return RedirectToAction("Login", "Account");
            }

            return View(user);
        }
    }
}