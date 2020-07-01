using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes
{
    public partial class ScheduleOfWork : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<M_Meeting> MeetingList = db.M_Meeting.ToList();
            string Meetings = loadData(MeetingList);
            /* Call javascript funcations   */
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "loadData("+ Meetings + ",'"+DateTime.Now.ToShortDateString()+"');", true);
        }

        public string loadData(List<M_Meeting> MeetingList)
        {
            string AllMeetings = "[";
            for (int i = 0; i < MeetingList.Count; i++)
            {
                DateTime date = DateTime.Parse(MeetingList[i].Meeting_Date.ToString());
                string formated_Date = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)+"T"+ MeetingList[i].Meeting_Time;
                
                AllMeetings += "{" +
                       "title: '"+ MeetingList[i].Meeting_Name_En + "'," +
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