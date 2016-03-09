using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealEstate
{
    public class UsersAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            // если пользователь не принадлежит роли admin, то он перенаправляется на Home/About
            bool auth = filterContext.HttpContext.Request.IsAuthenticated;
            if (!auth)
            {
                
                //filterContext.HttpContext.Response.ad;
            }
        }
    }
}