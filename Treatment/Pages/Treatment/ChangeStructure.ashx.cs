using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Website.Classes;

using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;

namespace Treatment.Pages.Treatment
{
    /// <summary>
    /// Summary description for ChangeStructure
    /// </summary>
    public class ChangeStructure : IHttpHandler , System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            if(context.Request["EmpStructureId"] == null)
                context.Response.Redirect("~/");

            string str = context.Request["EmpStructureId"].ToString();

            SessionWrapper.EmpStructure = int.Parse(str);
            context.Response.Redirect("~/");
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