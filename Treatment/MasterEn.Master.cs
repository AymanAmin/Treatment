﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment
{
    public partial class MasterEn : System.Web.UI.MasterPage
    {
        ECMSEntities db;
        List<Permission> ListPermissions = new List<Permission>();
        Permission CurrentPageNow = new Permission();
        List<int> CurrentPageSequences = new List<int>();
        bool isDashBoard = false;
        int currentStructureUserId = 0, currentUserId = 0, delegationId = 0;
        List<Notification_Master> notificationMaster;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new ECMSEntities();

            Session["IsECMS"] = true;
            //ListPermissions = db.Permissions.ToList();
            if (SessionWrapper.LoggedUser != null)
            {
                if (SessionWrapper.IsLocked)
                    Response.Redirect("~/Pages/Setting/admin/LockScreen.aspx");
            }
            else
            {
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
            }

            string path_and_query = HttpContext.Current.Request.Url.PathAndQuery;

            path_and_query = HttpUtility.UrlEncode(path_and_query);
            txtlockscreen.Text = "<a  href='../../../../Pages/Setting/Auth/LockScreen.aspx?URL="+ path_and_query + "'>"+
                                                        "<i class='feather icon-lock'></i> "+FieldNames.getFieldName("Master-LockScreen", "Lock Screen")+
                                                    "</a>"; 
            //Change Layout to RTL
            if (SessionWrapper.LoggedUser.Language_id != null)
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    Style.Text = FieldNames.getSTyleRTL();
                    Script.Text = FieldNames.getJavaScriptRTL();
                    //this.html.Attributes.Add("dir", "ltr");
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RTL_Layout();", true);
                }
            ListPermissions = SessionWrapper.Permssions;

            Employee_Name();
            LoadBreadcrumb(ListPermissions);
            LoadMenu(ListPermissions);
            currentUserId = SessionWrapper.LoggedUser.Employee_Id;
            currentStructureUserId = SessionWrapper.EmpStructure;
            delegationId = getDelegationId();
            loadNotification();
            LoadStructure();
            // ViewData(60);
        }

        private int getDelegationId()
        {
            int DeleId = 0;
            try
            {
                DeleId = (int)db.Employee_Structure.First(x => x.Employee_Structure_Id == currentStructureUserId && x.Type_Delegation == true).Employee_Delegation;
                return DeleId;
            }
            catch { return DeleId; }
        }

        private void Employee_Name()
        {
            if (SessionWrapper.LoggedUser.Language_id == 2)
                Emp_Name.Text = SessionWrapper.LoggedUser.Employee_Name_En;
            else
                Emp_Name.Text = SessionWrapper.LoggedUser.Employee_Name_Ar;
        }

        private void LoadBreadcrumb(List<Permission> ListPermission)
        {
            string str = "<li class='breadcrumb-item'><a href = '~/'><i class='feather icon-home'></i></a></li>";

            List<string> breadcrumbs = new List<string>();

            string Current_PageName = "لوحة المعلومات";
            if (SessionWrapper.LoggedUser.Language_id == 2)
            Current_PageName = "DashBoard";

            string LocalPath =  String.Concat(HttpContext.Current.Request.Url.LocalPath.Skip(1));
            int found = LocalPath.IndexOf(".aspx");
            LocalPath = LocalPath.Substring(0, found + 5);

            if (LocalPath == "default.aspx")
                isDashBoard = true;

            try
            {
                Permission CurrentPage = CurrentPageNow =  ListPermission.Where(x => x.Url_Path == LocalPath).First();

                if (CurrentPage != null)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Current_PageName = CurrentPage.Permission_Name_En;
                    else
                        Current_PageName = CurrentPage.Permission_Name_Ar;
                    do
                    {
                        //Add id for currnet sequense to set menu as active
                        CurrentPageSequences.Add(CurrentPage.Permission_Id);

                        if (SessionWrapper.LoggedUser.Language_id == 2)
                            breadcrumbs.Add(CurrentPage.Permission_Name_En);
                        else
                            breadcrumbs.Add(CurrentPage.Permission_Name_Ar);

                        CurrentPage = ListPermission.Where(x => x.Permission_Id == CurrentPage.Parent).First();
                    }
                    while (CurrentPage.Parent != 0);
                    //Add Last Id (the Perant Id for list
                    CurrentPageSequences.Add(CurrentPage.Permission_Id);

                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        breadcrumbs.Add(CurrentPage.Permission_Name_En);
                    else
                        breadcrumbs.Add(CurrentPage.Permission_Name_Ar);



                    for (int i = breadcrumbs.Count - 1; i > 0; i--)
                    {
                        str += "<li class='breadcrumb-item'><a href='#'> " + breadcrumbs[i] + "</a> </li>";
                    }
                }
                PageName.Text = Current_PageName;
                breadcrumb.Text = str;
            }
            catch { breadcrumb.Text = str; PageName.Text = Current_PageName; }
        }

        private void LoadMenu(List<Permission> Permission_List)
        {
            string str = string.Empty;
            try
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<ul class='pcoded-item pcoded-left-item'>";
                else
                    str += "<ul class='pcoded-item pcoded-left-item'>";
                str += "<li class='SubMenuRTL'>";
                str += "<a href = '../../../../' > ";
                str += "<span class='pcoded-micon active' style='color:#452a74'><i class='feather icon-home'></i></span>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<span class='pcoded-mtext'>لوحة المعلومات</span>";
                else
                    str += "<span class='pcoded-mtext'>Dashboard</span>";
                str += "</a>";
                str += "</li>";

                for (int First_Level = 0; First_Level < Permission_List.Count; First_Level++)
                {
                    if (Permission_List[First_Level].Parent == 0)
                    {
                        if(CurrentPageSequences.Contains(Permission_List[First_Level].Permission_Id) || (isDashBoard && First_Level==0))
                            str += "<li id='"+ Permission_List[First_Level].Permission_Id + "' class='pcoded-hasmenu pcoded-trigger'>";
                        else
                            str += "<li id='" + Permission_List[First_Level].Permission_Id + "' class='pcoded-hasmenu'>";
                        str += "<a href = 'javascript:void(0)'>";
                        str += "<span class='pcoded-micon'><i class='"+ Permission_List[First_Level].Permission_Icon+ "'></i></span>";
                        if (SessionWrapper.LoggedUser.Language_id == 2)
                            str += "<span class='pcoded-mtext'>"+ Permission_List[First_Level].Permission_Name_En + "</span>";
                        else
                            str += "<span class='pcoded-mtext'>" + Permission_List[First_Level].Permission_Name_Ar + "</span>";
                        str += "</a>";
                        str += "<ul class='pcoded-submenu'>";
                        List<Permission> Second_List = Permission_List.Where(x => x.Parent == Permission_List[First_Level].Permission_Id).ToList();
                        for (int Second_Level = 0; Second_Level < Second_List.Count; Second_Level++)
                        {
                            List<Permission> Third_List = Permission_List.Where(x => x.Parent == Second_List[Second_Level].Permission_Id).ToList();
                            if (Third_List.Count > 0)
                            {
                                if (CurrentPageSequences.Contains(Second_List[Second_Level].Permission_Id))
                                    str += "<li id='" + Second_List[Second_Level].Permission_Id + "' class='pcoded-hasmenu pcoded-trigger'>";
                                else
                                    str += "<li id='" + Second_List[Second_Level].Permission_Id + "' class='pcoded-hasmenu'>";
                                str += "<a href = 'javascript:void(0)'>";
                                str += "<span class='pcoded-micon'><i class='"+ Second_List[Second_Level].Permission_Icon+ "'></i></span>";
                                if (SessionWrapper.LoggedUser.Language_id == 2)
                                    str += "<span class='pcoded-mtext'>"+ Second_List[Second_Level].Permission_Name_En + "</span>";
                                else
                                    str += "<span class='pcoded-mtext'>" + Second_List[Second_Level].Permission_Name_Ar + "</span>";
                                str += "</a>";
                                str += "<ul class='pcoded-submenu'>";
                                for (int Third_Level = 0; Third_Level < Third_List.Count; Third_Level++)
                                {
                                    if (CurrentPageNow.Permission_Id == Third_List[Third_Level].Permission_Id)
                                        str += "<li class='active'>";
                                    else
                                        str += "<li class='SubMenuRTL'>";
                                    str += "<a href = '../../../../" + Third_List[Third_Level].Url_Path + "' > ";
                                    str += "<span class='pcoded-micon'><i class='"+ Third_List[Third_Level].Permission_Icon+ "'></i></span>";
                                    if (SessionWrapper.LoggedUser.Language_id == 2)
                                        str += "<span class='pcoded-mtext'>"+ Third_List[Third_Level].Permission_Name_En + "</span>";
                                    else
                                        str += "<span class='pcoded-mtext'>" + Third_List[Third_Level].Permission_Name_Ar + "</span>";
                                    str += "</a>";
                                    str += "</li>";
                                }
                                str += "</ul>";
                                str += "</li>";
                            }
                            else
                            {
                                if (CurrentPageNow.Permission_Id == Second_List[Second_Level].Permission_Id)
                                    str += "<li class='active'>";
                                else
                                    str += "<li class='SubMenuRTL'>";
                                str += "<a href = '../../../../" + Second_List[Second_Level].Url_Path + "' > ";
                                str += "<span class='pcoded-micon'><i class='" + Second_List[Second_Level].Permission_Icon + "'></i></span>";
                                if (SessionWrapper.LoggedUser.Language_id == 2)
                                    str += "<span class='pcoded-mtext'>" + Second_List[Second_Level].Permission_Name_En + "</span>";
                                else
                                    str += "<span class='pcoded-mtext'>" + Second_List[Second_Level].Permission_Name_Ar + "</span>";
                                str += "</a>";
                                str += "</li>";
                            }
                        }
                        str += "</ul>";
                        str += "</li>";
                    }
                }
                str += "<ul class='pcoded-item pcoded-left-item'>";
                str += "<li class='SubMenuRTL'>";
                str += "<a href = '../../../../Pages/Setting/Auth/Logout.ashx' > ";
                str += "<span class='pcoded-micon active' style='color:#452a74'><i class='icofont icofont-logout'></i></span>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<span class='pcoded-mtext'>تسجيل خروج</span>";
                else
                    str += "<span class='pcoded-mtext'>Logout</span>";

                str += "</a>";
                str += "</li>";
                str += "</ul>";
            }
            catch { }
            Menu.Text = str;
        }

        private void loadNotification()
        {
            try
            {
                List<Notification_Employee> notificationEmployee = new List<Notification_Employee>();
                notificationEmployee = db.Notification_Employee.Where(x => x.Employee_Id == currentUserId).ToList<Notification_Employee>();
                int notfOne = 0, notfTow = 0, notfThir = 0, notfFour = 0;
                if (notificationEmployee.Count > 0)
                {
                    for (int i = 0; i < notificationEmployee.Count; i++)
                    {
                        if (i == 0)
                            notfOne = (int)notificationEmployee[i].NotificationShow_Id;
                        if (i == 1)
                            notfTow = (int)notificationEmployee[i].NotificationShow_Id;
                        if (i == 2)
                            notfThir = (int)notificationEmployee[i].NotificationShow_Id;
                        if (i == 3)
                            notfFour = (int)notificationEmployee[i].NotificationShow_Id;
                    }
                }
                notificationMaster = new List<Notification_Master>();
                notificationMaster = db.Notification_Master.Where(x => (x.To_Employee_Structure_Id == currentStructureUserId || x.To_Employee_Structure_Id == delegationId) && x.Is_Read == false && (x.Notification_Show_Id == notfOne || x.Notification_Show_Id == notfTow || x.Notification_Show_Id == notfThir || x.Notification_Show_Id == notfFour)).OrderByDescending(x => x.Notification_Id).ToList<Notification_Master>();
                string yourHTMLstring = "";
                yourHTMLstring = "<div class='dropdown-toggle' data-toggle='dropdown'>";
                if (notificationMaster.Count > 0)
                {
                    int notShowNumnNotf = notificationMaster.Where(x => x.Is_Show_Reply == true && x.Date_Show_Reply > DateTime.Now).Count();
                    yourHTMLstring += "<i class='feather icon-bell'></i>" +
                                      "<span class='badge bg-c-pink'>" + (notificationMaster.Count - notShowNumnNotf) + "</span>";
                }
                else
                {
                    yourHTMLstring += "<i class='feather icon-bell'></i>";
                }
                yourHTMLstring += "</div>";
                //panelNotification.Controls.Add(new LiteralControl(yourHTMLstring));
                yourHTMLstring += "<ul class='show-notification notification-view dropdown-menu' data-dropdown-in='fadeIn' data-dropdown-out='fadeOut'>";
                yourHTMLstring += "<li>" +
                                    "<h6>" + Treatment.Classes.FieldNames.getFieldName("Master-Notifications", "Notifications") + "</h6>";
                if (notificationMaster.Count > 0)
                {
                    yourHTMLstring += "<label class='label label-danger'>" + Treatment.Classes.FieldNames.getFieldName("Master-New", "New") + "</label>";
                } 
                yourHTMLstring += "</li>";
                panelNotification.Controls.Add(new LiteralControl(yourHTMLstring));
                Employee_Structure employeeStructure;
                int employeeStructureId = 0;
                int counter = 0;
                for (int i = 0; i < notificationMaster.Count; i++)
                {
                    
                    employeeStructure = new Employee_Structure();
                    employeeStructureId = (int)notificationMaster[i].From_Employee_Structure_Id;
                    employeeStructure = db.Employee_Structure.FirstOrDefault(x => x.Employee_Structure_Id == employeeStructureId);
                    if (employeeStructure != null)
                    {
                        if (counter == 4)
                        {
                            yourHTMLstring = "<li style='padding-top: 2%;padding-bottom: 1%; text-align:center;'>" +
                                "<a href='../../../../Pages/Setting/UserManagment/MyNotifications.aspx' class='hover-notification'>"+ Classes.FieldNames.getFieldName("Master-SeeAllNotifications", "See All Notifications") + "</a>" +
                                "</li>";
                            panelNotification.Controls.Add(new LiteralControl(yourHTMLstring));

                            break;
                        }
                        string NameOfEmp = employeeStructure.Employee.Employee_Name_En;
                        string Description = notificationMaster[i].Notification_Description_En;
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                        {
                            NameOfEmp = employeeStructure.Employee.Employee_Name_Ar;
                            Description = notificationMaster[i].Notification_Description_Ar;
                        }
                        yourHTMLstring = "<li style='padding-top: 2%;padding-bottom: 1%;'>" +
                                                "<div class='media'>" +
                                                    "<img class='d-flex align-self-center img-radius' src='../../../../media/Profile/" + employeeStructure.Employee.Employee_Profile + "' alt='Avtar' />" +
                                                    "<a href='" + notificationMaster[i].Notification_Link + notificationMaster[i].Notification_Id + "' class='hover-notification'>" +
                                                        "<div class='media-body'>" +
                                                            "<h5 class='notification-user'>" + NameOfEmp + "</h5>" +
                                                            "<p class='notification-msg'>" + Description + "</p>" +
                                                            "<span class='notification-time'>" + Date_Different((DateTime)notificationMaster[i].Notification_Date) + "</span>" +
                                                        "</div>" +
                                                    "</a>" +
                                                "</div>" +
                                            "</li>";
                        if (!(bool)notificationMaster[i].Is_Show_Reply)
                        {
                            panelNotification.Controls.Add(new LiteralControl(yourHTMLstring));
                            counter++;
                        }
                        else if (DateTime.Now >= notificationMaster[i].Date_Show_Reply)
                        {
                            panelNotification.Controls.Add(new LiteralControl(yourHTMLstring));
                            counter++;
                        }
                    }
                }
                yourHTMLstring = "</ul>";
                panelNotification.Controls.Add(new LiteralControl(yourHTMLstring));
            }
            catch (Exception)
            {
            }
        }

        private void LoadStructure()
        {
            List<Employee_Structure> ListStructure = db.Employee_Structure.Where(x => (x.Employee_Id == SessionWrapper.LoggedUser.Employee_Id || (x.Employee_Delegation == SessionWrapper.LoggedUser.Employee_Id && x.Type_Delegation == false)) && x.Status_Structure == true).ToList();
            string str = string.Empty;
            for (int i = 0; i < ListStructure.Count; i++)
            {
                if (currentStructureUserId == ListStructure[i].Employee_Structure_Id)
                {
                    
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        showStructure.InnerHtml = ListStructure[i].Structure.Structure_Name_Ar + isEmployeeDelegation((bool)ListStructure[i].Type_Delegation);
                    else
                        showStructure.InnerHtml = ListStructure[i].Structure.Structure_Name_En + isEmployeeDelegation((bool)ListStructure[i].Type_Delegation);
                }
                else
                {
                    str += "<li>";
                    str += "<a href = '../../../../Pages/Treatment/ChangeStructure.ashx?EmpStructureId=" + ListStructure[i].Employee_Structure_Id + "'> ";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<i class='feather icon-grid'></i> " + ListStructure[i].Structure.Structure_Name_Ar + isEmployeeDelegation((bool)ListStructure[i].Type_Delegation);
                    else
                        str += "<i class='feather icon-grid'></i> " + ListStructure[i].Structure.Structure_Name_En + isEmployeeDelegation((bool)ListStructure[i].Type_Delegation);
                    str += "</a>";
                    str += "</li>";
                }
                
            }
            txtStructure.Text = str;

        }

        private string isEmployeeDelegation(bool flayDelegation)
        {
            string workDelegation = "";
            if (flayDelegation)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    workDelegation = " <label class='label label-inverse-danger delegation-css-ar'> مفوض </label> ";
                else workDelegation = " <label class='label label-inverse-danger delegation-css-en'> Delegation </label> ";
            }
            return workDelegation;
        }

        public string Date_Different(DateTime ReveviedDate)
        {

            string Different = "Unkown time";
            if (SessionWrapper.LoggedUser.Language_id == 1)
                Different = "غير معروف";
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
                        Different = Ago / 366 + " Years";
                    else
                        Different = "منذ " + Ago / 366 + " سنة";
                }
                else if (Ago >= 30)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 30 + " Mounths";
                    else
                        Different = "منذ " + Ago / 30 + " شهر";
                }
                else if (Ago >= 7)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 7 + " Weeks";
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
                                Different = Ago + " Seconds";
                            else
                                Different = "منذ " + Ago + " ثانية";
                        }
                        else if (SessionWrapper.LoggedUser.Language_id == 2)
                            Different = Ago + " Minutes";
                        else
                            Different = "منذ " + Ago + " دقيقة";
                    }
                    else if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago + " Hours";
                    else
                        Different = "منذ " + Ago + " ساعة";

                }
                else if (SessionWrapper.LoggedUser.Language_id == 2)
                    Different = Ago + " days";
                else
                    Different = "منذ " + Ago + " يوم";
            }
            catch { }

            return Different;
        }
    }
}