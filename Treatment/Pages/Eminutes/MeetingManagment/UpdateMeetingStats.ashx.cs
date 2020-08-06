using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes.MeetingManagment
{
    /// <summary>
    /// Summary description for UpdateMeetingStats
    /// </summary>
    public class UpdateMeetingStats : IHttpHandler
    {
        ECMSEntities db = new ECMSEntities();
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["BoardId"] == null || context.Request["MeetingId"] == null)
                context.Response.Redirect("~/Pages/Eminutes/Home.aspx");

            int BoardId = int.Parse(context.Request["BoardId"].ToString());
            int MeetingId = int.Parse(context.Request["MeetingId"].ToString());

            if (MeetingId > 0) UpateMetting(MeetingId);

            context.Response.Redirect("~/Pages/Eminutes/Board.aspx?BoardId=" + BoardId);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public bool UpateMetting(int Meeting_id)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            db.Configuration.LazyLoadingEnabled = false;
            try
            {

                var Meeting = db.M_Meeting.First(x => x.Meeting_Id == Meeting_id);
                if (Meeting.Meeting_Status == 1)
                {
                    Meeting.Meeting_Status = 2;
                }
                else if (Meeting.Meeting_Status == 2)
                {
                    Meeting.Meeting_Status = 3;
                }
                else if (Meeting.Meeting_Status == 3)
                {
                    Meeting.Meeting_Status = 1;
                }
                db.Entry(Meeting).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                    /* Add it to log file */
                    LogData = "data:" + JsonConvert.SerializeObject(Meeting, logFileModule.settings);
                    logFileModule.logfile(10, "تعيل حالة الإجتماع", "Update Meeting Stats", LogData);
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}