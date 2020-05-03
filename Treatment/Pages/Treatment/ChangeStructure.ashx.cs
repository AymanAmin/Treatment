using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Website.Classes;

namespace Treatment.Pages.Treatment
{
    /// <summary>
    /// Summary description for ChangeStructure
    /// </summary>
    public class ChangeStructure : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SessionWrapper.Structure  = int.Parse(context.Request["EmpStructureId"].ToString());
            context.Response.Redirect("../../../../");
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