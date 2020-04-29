using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes.BoardManagment
{
    /// <summary>
    /// Summary description for DeleteMembers
    /// </summary>
    public class DeleteMembers : IHttpHandler
    {
        ECMSEntities db = new ECMSEntities();
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["BoardId"] == null || context.Request["EmpId"] == null || context.Request["MemberTableId"] == null)
                context.Response.Redirect("~/Pages/Eminutes/Home.aspx");

            int board_id = int.Parse(context.Request["BoardId"].ToString());
            int emp_id = int.Parse(context.Request["EmpId"].ToString());
            int member_id = int.Parse(context.Request["MemberTableId"].ToString());

            try
            {
                var member = new M_Board_Member { Board_Member_Id = member_id };
                db.Entry(member).State = System.Data.EntityState.Deleted;
                db.SaveChanges();
            }
            catch { }

            context.Response.Redirect("~/Pages/Eminutes/BoardManagment/BoardMember.aspx?BoardId=" + board_id);
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