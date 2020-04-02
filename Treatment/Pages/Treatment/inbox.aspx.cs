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
            if (loadListViewTreatment())
            {

            }
            else
            {

            }
            if (loadGridViewTreatment())
            {

            }
            else
            {

            }
        }
        private bool loadListViewTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "<table class='table' >";
                    inboxTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
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
                                       "<td class='email-time'>" + treatmentMaster[i].Create_Date.ToString() + "</td>" +
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

        private string getDetialSendTo(int masterId)
        {
            string sendTo = "";
            try
            {
                List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                treatmentDetial = dbSentTo.Treatment_Detial.Where(x => x.Treatment_Id == masterId).ToList<Treatment_Detial>();
                for (int i = 0; i < treatmentDetial.Count; i++)
                {
                    sendTo += treatmentDetial[i].Employee_Structure.Employee.Employee_Name_En + " , "; 
                }
                return sendTo.Substring(0, sendTo.Length - 2);
            }
            catch (Exception eee) { return sendTo; }
        }

        private bool loadGridViewTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "";
                    List<Treatment_Master> treatmentMaster = new List<Treatment_Master>();
                    treatmentMaster = db.Treatment_Master.ToList<Treatment_Master>();
                    for (int i = 0; i < treatmentMaster.Count; i++)
                    {
                        yourHTMLstring = "<div class='col-sm-4'>"+
                                            "<div class='"+treatmentMaster[i].Treatment_Priority.Card_Class+"'>"+
                                                "<div class='card-header'>"+
                                                    "<a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "' class='card-title'>" + treatmentMaster[i].Employee_Structure.Employee.Employee_Name_En + " </a>" +
                                                    "<span class='label label-default f-right'>" + treatmentMaster[i].Create_Date.ToString() + "</span>" +
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
    }
}