using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes.MeetingManagment
{
    /// <summary>
    /// Summary description for DeteteMeeting
    /// </summary>
    public class DeteteMeeting : IHttpHandler
    {
        ECMSEntities db = new ECMSEntities();

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["BoardId"] == null || context.Request["MeetingId"] == null )
                context.Response.Redirect("~/Pages/Eminutes/Home.aspx");

            int BoardId = int.Parse(context.Request["BoardId"].ToString());
            int MeetingId = int.Parse(context.Request["MeetingId"].ToString());

            if (MeetingId > 0) DeleteMetting(MeetingId);

            context.Response.Redirect("~/Pages/Eminutes/Board.aspx?BoardId=" + BoardId);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public bool DeleteMetting(int Meeting_id)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            {
                var M_Topic = db.M_Topic.Where(x => x.Meeting_Id == Meeting_id).ToList();
                 if(M_Topic.Count==0){
                    
                    var widgets = db.M_M_Attachments.Where(x => x.Meeting_Id == Meeting_id).ToList();
                    if (widgets.Count > 0)
                    {
                        foreach (M_M_Attachments widget in widgets)
                        {
                            db.M_M_Attachments.Remove(widget);
                        }
                    }
                     db.SaveChanges();

                    var DelMeeting = db.M_Meeting.First(x => x.Meeting_Id == Meeting_id);
                    db.M_Meeting.Remove(DelMeeting);
                    db.SaveChanges();
                    /* Add it to log file */
                    LogData = "data:" + JsonConvert.SerializeObject(DelMeeting, logFileModule.settings);
                    logFileModule.logfile(10, "حذف الإجتماع", "Delete Meeting", LogData);
                }
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}