using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Setting.UserManagment
{
    public partial class MyNotifications : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        string[] Color = { "blue", "purple", "green", "black", "red", "orange", "maroon", "teal", "deepskyblue", "gray", "yellow", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            if (!IsPostBack)
            {
                int UserID = SessionWrapper.LoggedUser.Employee_Id;
                List<Notification_Master> NotificationList = db.Notification_Master.Where(x => x.To_Employee_Structure_Id == UserID).ToList();
                NotificationList = NotificationList.OrderByDescending(x => x.Notification_Date).Take(500).ToList();
                LoadNotification(NotificationList);
                LoadActivity(UserID);
            }
        }

        protected void Reload_Click(object sender, EventArgs e)
        {
            List<Treatment_Master> Treatment_List = db.Treatment_Master.ToList();
            int UserID = SessionWrapper.LoggedUser.Employee_Id;
            List<Notification_Master> NotificationList = db.Notification_Master.Where(x => x.To_Employee_Structure_Id == UserID).ToList();
            NotificationList = NotificationList.OrderByDescending(x => x.Notification_Date).Take(500).ToList();
            LoadNotification(NotificationList);
        }

        public void LoadNotification(List<Notification_Master> List_Notify)
        {
            List<Treatment_Master> Treatment_List = db.Treatment_Master.ToList();
            string str = string.Empty;
            for (int i = 0; i < List_Notify.Count; i++)
            {
                int Structure_id = (int)List_Notify[i].To_Employee_Structure_Id;
                Employee_Structure employeeStructure = db.Employee_Structure.FirstOrDefault(x => x.Employee_Structure_Id == Structure_id);

                // get data based on language
                string Notification_Description = List_Notify[i].Notification_Description_En;
                string emp_name = employeeStructure.Employee.Employee_Name_En;
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    emp_name = employeeStructure.Employee.Employee_Name_Ar;
                    Notification_Description = List_Notify[i].Notification_Description_Ar;
                }
                str += "<div class='row p-b-30'>" +

                              "<div class='col-auto text-right update-meta'>" +
                              "<a href='" + List_Notify[i].Notification_Link + List_Notify[i].Notification_Id + "'>" +
                                "<p class='text-muted m-b-0 d-inline'>" + Date_Different((DateTime)List_Notify[i].Notification_Date) + "</p>" +
                                "<i class='feather icon-inbox bg-info update-icon'></i>" +
                                "</a>" +
                            "</div>" +
                            "<div class='col'>" +
                            "<a href='" + List_Notify[i].Notification_Link + List_Notify[i].Notification_Id + "'>" +
                                "<h6>" + emp_name + "</h6>" +
                                "<p class='text-muted m-b-0'>" + Notification_Description + "</p>" +
                                "</a>" +
                            "</div>" +

                        "</div>";
            }

            Notifications.Text = str;
        }

        public void LoadActivity(int UserID)
        {
            string CssClass = string.Empty;
            string str = string.Empty;
            List<Log_File> activites = db.Log_File.Where(x => x.Login_Id == UserID && x.Log_Name != "تسجيل دخول").ToList();
            activites = activites.OrderByDescending(x => x.Log_Date).Take(500).ToList();
            List<Permission> Permisions_List = db.Permissions.ToList();

            int counter = 0;
            for (int i = 0; i < Permisions_List.Count; i++)
            {
                if (Color.Count() - 1 == counter)
                    counter = 0;
                else
                    counter++;

                Permisions_List[i].Url_Path = Color[counter];

            }

            for (int i = 0; i < activites.Count; i++)
            {
                string activity_verb = FieldNames.getFieldName("MyNotifications-Youhave", "You have ");

                // get data based on language
                string Log_Name = activites[i].Log_Description;
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    Log_Name = activites[i].Log_Name;
                }

                if (Log_Name == null || Log_Name == "")
                    Log_Name = activites[i].Log_Name;

                Permission per = Permisions_List.Where(x => x.Permission_Id == activites[i].Form_Id).FirstOrDefault();
                string per_name = string.Empty;
                if (per != null)
                {
                    CssClass = per.Permission_Icon;
                    // Get data based on language
                    per_name = per.Permission_Name_En;
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        per_name = per.Permission_Name_Ar;

                }
                str += "<div class='row m-b-25'>" +
                                  "<div class='col-auto p-r-0' style='margin-top:3%'>" +
                                    "<i class='" + CssClass + " bg-info feed-icon' style='font-size:160%;background-color: " + per.Url_Path + " !important'></i>" +
                                "</div>" +
                                "<div class='col'>" +
                                "<h6 class='m-b-5'>"+ per_name + "</h6>" +
                                "<p class='text-muted m-b-0'>" + "<span style='color:green'>" + activity_verb + "</span>" + Log_Name + " </p>" +
                                "<p class='text-muted m-b-0'><i class='feather icon-clock m-r-10'></i>" + Date_Different((DateTime)activites[i].Log_Date) + "</p>" +
                                "</div>" +
                            "</div>";
            }
            Activity.Text = str;
        }

        public string Date_Different(DateTime ReveviedDate)
        {
            
            string Different = "Unkown time ago";
            if (SessionWrapper.LoggedUser.Language_id == 1)
                Different = "منذ مدة غير معلومة";
            try
            {
                // Get the current DateTime.
                DateTime now = DateTime.Now;

                // Get the TimeSpan of the difference.
                TimeSpan elapsed = now.Subtract(ReveviedDate);


                // Get number of days ago.
                int Ago = (int)elapsed.TotalDays;

                if (Ago > 366)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 366 + " Years ago";
                    else
                        Different = "منذ " + Ago / 366 + " سنة";
                }
                else if (Ago >= 30)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 30 + " Mounths ago";
                    else
                        Different = "منذ " + Ago / 30 + " شهر";
                }
                else if (Ago >= 7)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 7 + " Weeks ago";
                    else
                        Different = "منذ " + Ago / 7 + " اسبوع";
                }
                else if (Ago < 1)
                {
                    Ago = (int)elapsed.TotalHours;

                    if (Ago < 1)
                    {
                        Ago = (int)elapsed.TotalMinutes;
                        if (Ago < 1)
                        {
                            Ago = (int)elapsed.Seconds;
                            if (SessionWrapper.LoggedUser.Language_id == 2)
                                Different = Ago + " Seconds ago";
                            else
                                Different = "منذ " + Ago  + " ثانية";
                        }
                        else if (SessionWrapper.LoggedUser.Language_id == 2)
                            Different = Ago + " Minutes ago";
                        else
                            Different = "منذ " + Ago + " دقيقة";
                    }
                    else if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago + " Hours ago";
                    else
                        Different = "منذ " + Ago + " ساعة";

                }
                else if (SessionWrapper.LoggedUser.Language_id == 2)
                    Different = Ago + " days ago";
                else
                    Different = "منذ " + Ago + " يوم";
            }
            catch { }

            return Different;
        }

        protected void Refresh_Click(object sender, EventArgs e)
        {
            int UserID = SessionWrapper.LoggedUser.Employee_Id;
            LoadActivity(UserID);
        }

    }
}