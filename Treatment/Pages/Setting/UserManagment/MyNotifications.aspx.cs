using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Setting.UserManagment
{
    public partial class MyNotifications : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            int UserID = SessionWrapper.LoggedUser.Employee_Id;
            List<Notification_Master> NotificationList = db.Notification_Master.Where(x => x.Employee_Structure_Id == UserID).ToList();
            LoadNotification(NotificationList);
        }

        protected void Reload_Click(object sender, EventArgs e)
        {
            List<Treatment_Master> Treatment_List = db.Treatment_Master.ToList();
            int UserID = SessionWrapper.LoggedUser.Employee_Id;
            List<Notification_Master> NotificationList = db.Notification_Master.Where(x => x.Employee_Structure_Id == UserID).ToList();
            LoadNotification(NotificationList);
        }

        public void LoadNotification(List<Notification_Master> List_Notify)
        {
            List<Treatment_Master> Treatment_List = db.Treatment_Master.ToList();
            string str = string.Empty;
            for (int i = 0; i < List_Notify.Count; i++)
            {
                int Structure_id = (int)List_Notify[i].Employee_Structure_Id;
                Employee_Structure employeeStructure = db.Employee_Structure.FirstOrDefault(x => x.Employee_Structure_Id == Structure_id);
                str += "<div class='row p-b-30'>" +
                              "<div class='col-auto text-right update-meta'>" +
                                "<p class='text-muted m-b-0 d-inline'>" + Date_Different((DateTime)List_Notify[i].Notification_Date) + "</p>" +
                                "<i class='feather icon-twitter bg-info update-icon'></i>" +
                            "</div>" +
                            "<div class='col'>" +
                                "<h6>" + employeeStructure.Employee.Employee_Name_En + "</h6>" +
                                "<p class='text-muted m-b-0'>" + List_Notify[i].Notification_Description_En + "</p>" +
                            "</div>" +
                        "</div>";
            }

            Notifications.Text = str;
        }

        public string Date_Different(DateTime ReveviedDate)
        {
            string Different = "Unkown time ago";
            try
            {
                // Get the current DateTime.
                DateTime now = DateTime.Now;

                // Get the TimeSpan of the difference.
                TimeSpan elapsed = now.Subtract(ReveviedDate);

                // Get number of days ago.
                int Ago = (int)elapsed.TotalDays;
                if (Ago < 1)
                {
                    Ago = (int)elapsed.TotalHours;

                    if (Ago < 1)
                    {
                        Ago = (int)elapsed.TotalMinutes;
                        if (Ago < 1)
                        {
                            Ago = (int)elapsed.Seconds;
                            Different = Ago + " Seconds ago";
                        }
                        else
                            Different = Ago + " Minutes ago";
                    }
                    else
                        Different = Ago + " Hours ago";

                }
                else
                    Different = Ago + " days ago";
            }
            catch { }

            return Different;
        }
    }
}