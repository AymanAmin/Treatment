using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Treatment
{
    public partial class inbox : System.Web.UI.Page
    {
        string messageForm = "";
        int currentStructureUserId = 1;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        ECMSEntities dbSentTo = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (loadListViewInboxTreatment())
            {

            }
            else
            {

            }
            if (loadListViewSendTreatment())
            {

            }
            else
            {

            }
            if (loadListViewCompleteTreatment())
            {

            }
            else
            {

            }
            if (loadGridViewInboxTreatment())
            {

            }
            else
            {

            }
        }
        private bool loadListViewInboxTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "<table class='table' >";
                    inboxTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                    treatmentDetial = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == currentStructureUserId && x.Assignment_Status_Id == 1).ToList<Treatment_Detial>();
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        yourHTMLstring = "<tr class='unread'>" +
                                      "<td>" +
                                            "<div class='check-star'>" +
                                                 "<div class='checkbox-fade fade-in-primary checkbox'>" +
                                                      "<label>" +
                                                           "<input type='checkbox' value=''>" +
                                                                "<span class='cr'><i class='cr-icon icofont icofont-verification-check txt-primary'></i></span>" +
                                                      "</label>" +
                                                 "</div>" +
                                                 "<i class='" + treatmentDetial[i].Treatment_Master.Treatment_Priority.Css_Class + "'></i>" +
                                             "</div>" +
                                       "</td>" +
                                       "<td><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentDetial[i].Treatment_Master.Treatment_Id + "' class='email-name'>" + treatmentDetial[i].Treatment_Master.Employee_Structure.Employee.Employee_Name_En + "</a></td>" +
                                       "<td><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentDetial[i].Treatment_Master.Treatment_Id + "' class='email-name'>" + treatmentDetial[i].Treatment_Master.Treatment_Subject + "</a></td>" +
                                       "<td class='email-tag'><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentDetial[i].Treatment_Master.Treatment_Id + "'><label class='" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Css_Class + "'>" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label></a></td>" +
                                       "<td class='email-time'>" + dateAgo((DateTime)treatmentDetial[i].Treatment_Master.Create_Date) + "</td>" +
                                   " </tr>";
                        inboxTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    }

                    yourHTMLstring = "</table>";
                    inboxTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    return true;
                }
                catch (Exception eee) { return false; }
            }
        }

        private bool loadListViewSendTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "<table class='table' >";
                    sendTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    List<Treatment_Master> treatmentMaster = new List<Treatment_Master>();
                    treatmentMaster = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == currentStructureUserId && x.Treatment_Status_Id == 1).ToList<Treatment_Master>();
                    for (int i = 0; i < treatmentMaster.Count; i++)
                    {
                        yourHTMLstring = "<tr class='unread'>" +
                                      "<td>" +
                                            "<div class='check-star'>" +
                                                 "<div class='checkbox-fade fade-in-primary checkbox'>" +
                                                      "<label>" +
                                                           "<input type='checkbox' value=''>" +
                                                                "<span class='cr'><i class='cr-icon icofont icofont-verification-check txt-primary'></i></span>" +
                                                      "</label>" +
                                                 "</div>" +
                                                 "<i class='" + treatmentMaster[i].Treatment_Priority.Css_Class + "'></i>" +
                                             "</div>" +
                                       "</td>" +
                                       "<td><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "' class='email-name'>" + getDetialSendTo(treatmentMaster[i].Treatment_Id) + "</a></td>" +
                                       "<td><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "' class='email-name'>" + treatmentMaster[i].Treatment_Subject + "</a></td>" +
                                       "<td class='email-tag'><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "'><label class='" + treatmentMaster[i].Treatment_Confidentiality.Css_Class + "'>" + treatmentMaster[i].Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label></a></td>" +
                                       "<td class='email-time'>" + dateAgo((DateTime)treatmentMaster[i].Create_Date) + "</td>" +
                                   " </tr>";
                        sendTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    }

                    yourHTMLstring = "</table>";
                    sendTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    return true;
                }
                catch (Exception eee) { return false; }
            }
        }

        private bool loadListViewCompleteTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "<table class='table' >";
                    completeTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                    treatmentDetial = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == currentStructureUserId && x.Assignment_Status_Id == 3).ToList<Treatment_Detial>();
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        yourHTMLstring = "<tr class='unread'>" +
                                      "<td>" +
                                            "<div class='check-star'>" +
                                                 "<div class='checkbox-fade fade-in-primary checkbox'>" +
                                                      "<label>" +
                                                           "<input type='checkbox' value=''>" +
                                                                "<span class='cr'><i class='cr-icon icofont icofont-verification-check txt-primary'></i></span>" +
                                                      "</label>" +
                                                 "</div>" +
                                                 "<i class='" + treatmentDetial[i].Treatment_Master.Treatment_Priority.Css_Class + "'></i>" +
                                             "</div>" +
                                       "</td>" +
                                       "<td><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentDetial[i].Treatment_Master.Treatment_Id + "' class='email-name'>" + treatmentDetial[i].Treatment_Master.Employee_Structure.Employee.Employee_Name_En + "</a></td>" +
                                       "<td><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentDetial[i].Treatment_Master.Treatment_Id + "' class='email-name'>" + treatmentDetial[i].Treatment_Master.Treatment_Subject + "</a></td>" +
                                       "<td class='email-tag'><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentDetial[i].Treatment_Master.Treatment_Id + "'><label class='" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Css_Class + "'>" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label></a></td>" +
                                       "<td class='email-time'>" + dateAgo((DateTime)treatmentDetial[i].Treatment_Detial_Date) + "</td>" +
                                   " </tr>";
                        completeTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    }

                    yourHTMLstring = "</table>";
                    completeTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    return true;
                }
                catch (Exception eee) { return false; }
            }
        }

        private string getDetialSendTo(int masterId)
        {
            string sendTo = "";
            try
            {
                List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                treatmentDetial = dbSentTo.Treatment_Detial.Where(x => x.Treatment_Id == masterId && x.Treatment_Copy_To == false).ToList<Treatment_Detial>();
                for (int i = 0; i < treatmentDetial.Count; i++)
                {
                    sendTo += treatmentDetial[i].Employee_Structure.Employee.Employee_Name_En + " , "; 
                }
                return sendTo.Substring(0, sendTo.Length - 2);
            }
            catch (Exception eee) { return sendTo; }
        }

        private bool loadGridViewInboxTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "";
                    List<Treatment_Master> treatmentMaster = new List<Treatment_Master>();
                    treatmentMaster = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == currentStructureUserId && x.Treatment_Status_Id == 1).ToList<Treatment_Master>(); 
                    for (int i = 0; i < treatmentMaster.Count; i++)
                    {
                        yourHTMLstring = "<div class='col-sm-4'>"+
                                            "<div class='"+treatmentMaster[i].Treatment_Priority.Card_Class+"'>"+
                                                "<div class='card-header'>"+
                                                    "<a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "' class='card-title'>" + getDetialSendTo(treatmentMaster[i].Treatment_Id) + " </a>" +
                                                    "<span class='label label-default f-right'>" + dateAgo((DateTime)treatmentMaster[i].Create_Date) + "</span>" +
                                                "</div>"+
                                                "<div class='card-block'>"+
                                                    "<div class='row'>"+
                                                        "<div class='col-sm-12'>"+
                                                            "<p class='task-detail'><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "'>" + treatmentMaster[i].Treatment_Subject + "</a></p>" +
                                                            "<p class='task-due'><strong>Secret: </strong><strong class='" + treatmentMaster[i].Treatment_Confidentiality.Css_Class + "'>" + treatmentMaster[i].Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</strong></p>" +
                                                        "</div>"+
                                                    "</div>"+
                                                "</div>"+
                                            "</div>"+
                                        "</div>";
                        gridViewTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    }
                    return true;
                }
                catch (Exception eee) { return false; }
            }
        }
        private string dateAgo(DateTime yourDate)
        {
            const int SECOND = 1;
            const int MINUTE = 60 * SECOND;
            const int HOUR = 60 * MINUTE;
            const int DAY = 24 * HOUR;
            const int MONTH = 30 * DAY;

            var ts = new TimeSpan(DateTime.Now.Ticks - yourDate.Ticks);
            double delta = Math.Abs(ts.TotalSeconds);

            if (delta < 1 * MINUTE)
                return ts.Seconds == 1 ? "one second ago" : ts.Seconds + " seconds ago";

            if (delta < 2 * MINUTE)
                return "a minute ago";

            if (delta < 45 * MINUTE)
                return ts.Minutes + " minutes ago";

            if (delta < 90 * MINUTE)
                return "an hour ago";

            if (delta < 24 * HOUR)
                return ts.Hours + " hours ago";

            if (delta < 48 * HOUR)
                return "yesterday";

            if (delta < 30 * DAY)
                return ts.Days + " days ago";

            if (delta < 12 * MONTH)
            {
                int months = Convert.ToInt32(Math.Floor((double)ts.Days / 30));
                return months <= 1 ? "one month ago" : months + " months ago";
            }
            else
            {
                int years = Convert.ToInt32(Math.Floor((double)ts.Days / 365));
                return years <= 1 ? "one year ago" : years + " years ago";
            }
        }
    }
}