using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Linq;
using HappyTechCompany.Models;

namespace HappyTechCompany.Controllers
{
    public class HomeController : Controller
    {
        private CompanyDBEntities cdb = new CompanyDBEntities();
        public ActionResult Index()
        {
            ViewBag.TemplateInfo = cdb.Templates.ToList();
            if (Session["IsLogin"] == null || Session["IsLogin"].ToString() == "false")
            {
                return RedirectToAction("/login");
            }
            if (Session["Username"].ToString().ToLower() == "admin")
            {
                return View(cdb.UserApplications.ToList());
            }
            else
            {
                string username = Session["Username"].ToString();
                return View(cdb.UserApplications.Where(m => m.SubmitterName == username).ToList());
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session["IsLogin"] = "";
            Session["Username"] = "";
            return RedirectToAction("/login");
        }

        public ActionResult LoginMethod([Bind(Include = "Username,Password")] string Username, string password)
        {
            if (!string.IsNullOrEmpty(Username) && !string.IsNullOrEmpty(password))
            {
                var userInfo = cdb.Users.Where(user => user.Username == Username && user.Password == password);
                if (userInfo.Any())
                {
                    Session["IsLogin"] = "true";
                    Session["Username"] = userInfo.FirstOrDefault().Username;
                    return RedirectToAction("/");
                }
                TempData["ErrorMessage"] = "Invalid Username and password";
                return RedirectToAction("/login");
            }
            else
            {
                TempData["ErrorMessage"] = "Invalid Username and password";
                Session["IsLogin"] = "false";
                return RedirectToAction("/login");
            }
        }

        public ActionResult Submit(int? id, string user)
        {
            Template template = cdb.Templates.Find(id);
            UserApplication uInfo = cdb.UserApplications.Where(app => app.SubmitterName == user).FirstOrDefault();
            uInfo.FeedbackSubmittedBy = Session["Username"].ToString();
            uInfo.FeedbackId = template.ID;
            uInfo.FeedbackSubmitted = true;
            cdb.Entry(uInfo).State = EntityState.Modified;
            cdb.SaveChanges();
            TempData["EmailMessage"] = "Email has been sent to " + uInfo.SubmitterName + " for there feedback successfully.";
            return RedirectToAction("/");
        }

        public ActionResult ViewFeedback(int? id)
        {
            ViewBag.TemplateList = cdb.Templates.ToList();
            UserApplication uInfo = cdb.UserApplications.Where(app => app.ID == id).FirstOrDefault();
            return View(uInfo);
        }
    }
}