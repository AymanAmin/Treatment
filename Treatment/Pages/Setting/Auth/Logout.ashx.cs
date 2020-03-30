using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Treatment.Pages.Setting.Auth
{
    /// <summary>
    /// Summary description for Logout
    /// </summary>
    public class Logout : IHttpHandler , System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpContext.Current.Session.Abandon();
            context.Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}