using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes.TopicManagment
{
    /// <summary>
    /// Summary description for UptadeTopicStatus
    /// </summary>
    public class UptadeTopicStatus : IHttpHandler
    {
        ECMSEntities db = new ECMSEntities();
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["BoardId"] == null || context.Request["MeetingId"] == null || context.Request["TopicId"] == null)
                context.Response.Redirect("~/Pages/Eminutes/Home.aspx");

            int BoardId = int.Parse(context.Request["BoardId"].ToString());
            int MeetingId = int.Parse(context.Request["MeetingId"].ToString());
            int TopicId = int.Parse(context.Request["TopicId"].ToString());

            if (TopicId > 0) UpdateTopic(TopicId);

            context.Response.Redirect("~/Pages/Eminutes/Meeting.aspx?BoardId=" + BoardId + "&MeetingID=" + MeetingId);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public bool UpdateTopic(int Topic_id)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            db.Configuration.LazyLoadingEnabled = false;
            try
            {
                var Topic = db.M_Topic.First(x => x.Topic_Id == Topic_id);

                if (Topic.Topic_Status == 1)
                {
                    Topic.Topic_Status = 2;
                }
                else if (Topic.Topic_Status == 2)
                {
                    Topic.Topic_Status = 1;
                }
                db.Entry(Topic).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Topic, logFileModule.settings);
                logFileModule.logfile(10, "تعديل  حالة الموضوع", "Update Topic stats", LogData);

            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}