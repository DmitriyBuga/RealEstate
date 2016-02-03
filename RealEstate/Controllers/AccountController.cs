﻿using RealEstate.Models;
using RealEstate.Models.Abstract;
using RealEstate.Models.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace RealEstate.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {
        private IRepository repository;
        public AccountController(IRepository repo)
        {
            repository = repo;
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LogViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (model.NewUser)
                {
                    if (!IsFreeLogin(model.UserName))
                    {
                        ModelState.AddModelError("", "Пользователь уже существует в базе");
                        return View(model);
                    }
                    
                }
                if (model.NewUser)
                    CreateNewUser(model.UserName, model.Password);

                if (ValidateUser(model.UserName, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    if (Url.IsLocalUrl(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("UserBudget", "Budget");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Неправильный пароль или логин");
                }
                
            }
            return View(model);
        }
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Login", "Account");
        }
        private bool IsFreeLogin(string login)
        {
            return (repository.Users.Where(x => x.login == login).Count() == 0);
        }
        private void CreateNewUser(string login, string password)
        {
            Users user = new Users();
            user.login = login;
            user.password = password;
            user.role_id = 2;
            user.name = login;
            user.position = "";
            repository.CreateNewUser(user);
        }
        private bool ValidateUser(string login, string password)
        {
            bool isValid = false;

            using (EFDbContext _db = new EFDbContext())
            {
                try
                {
                    
                    Users user = (from u in _db.Users
                                 where u.login == login && u.password == password
                                 select u).FirstOrDefault();

                    if (user != null)
                    {
                        isValid = true;
                    }
                }
                catch
                {
                    isValid = false;
                }
            }
            return isValid;
        }
    }
}