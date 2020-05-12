using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes.TopicManagment
{
    /// <summary>
    /// Summary description for deleteTopic
    /// </summary>
    public class deleteTopic : IHttpHandler
    {
        ECMSEntities db = new ECMSEntities();
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["BoardId"] == null || context.Request["MeetingId"] == null || context.Request["TopicId"] == null)
                context.Response.Redirect("~/Pages/Eminutes/Home.aspx");

            int BoardId = int.Parse(context.Request["BoardId"].ToString());
            int MeetingId = int.Parse(context.Request["MeetingId"].ToString());
            int TopicId = int.Parse(context.Request["TopicId"].ToString());

            if (TopicId > 0) DeleteTopic(TopicId);

            context.Response.Redirect("~/Pages/Eminutes/Meeting.aspx?BoardId=" + BoardId+ "&MeetingID="+ MeetingId);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public bool DeleteTopic(int Topic_id)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            {
                var DelTopic = db.M_Topic.First(x => x.Topic_Id == Topic_id);
                db.M_Topic.Remove(DelTopic);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(DelTopic, logFileModule.settings);
                logFileModule.logfile(10, "حذف الموضوع", "Delete Topic", LogData);

            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}