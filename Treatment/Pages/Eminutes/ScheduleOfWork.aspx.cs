using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes
{
    public partial class ScheduleOfWork : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            string path_and_query = HttpContext.Current.Request.Url.PathAndQuery;
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx?URL="+ path_and_query);

            List<M_Meeting> MeetingList = db.M_Meeting.ToList();
            string Meetings = loadData(MeetingList);
            /* Call javascript funcations   */
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "loadData(" + Meetings + ",'" + DateTime.Now.ToShortDateString() + "');", true);
        }

        public string loadData(List<M_Meeting> MeetingList)
        {
            string AllMeetings = "[";
            for (int i = 0; i < MeetingList.Count; i++)
            {
                DateTime date = DateTime.Parse(MeetingList[i].Meeting_Date.ToString());
                string formated_Date = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture) + "T" + MeetingList[i].Meeting_Time;

                string MeetingName = MeetingList[i].Meeting_Name_En;
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    MeetingName = MeetingList[i].Meeting_Name_Ar;
                AllMeetings += "{" +
                       "title: '" + MeetingName + "'," +
                        "start: '" + formated_Date + "'," +
                        "constraint: 'availableForMeeting'," +
                        "borderColor: '#FC6180'," +
                        "backgroundColor: '#FC6180'," +
                        "textColor: '#fff'" +
                    "}";
                if (i < MeetingList.Count - 1)
                    AllMeetings += ",";
            }
            AllMeetings += "]";
            return AllMeetings;

        }
    }
}