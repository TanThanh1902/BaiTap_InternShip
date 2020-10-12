using BT_InternShip.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BT_InternShip.Controllers
{
    public class AccountsController : Controller
    {
        DBManagementEntities db = new DBManagementEntities();
        // GET: Accounts
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(SignIn user)
        {
            bool result = db.USERTABLEs.SingleOrDefault(t => t.Email == user.Email && t.Password == user.Password) != null;
            if (result)
            {
                FormsAuthentication.SetAuthCookie(user.Email, false);
                if (user.ReturnUrl.Contains("/Accounts/Login"))
                {
                    return Redirect("/Home/Index");
                }
                return Redirect(user.ReturnUrl);
            }
            ViewBag.notification = "Incorrected email or password";
            return View(user);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}