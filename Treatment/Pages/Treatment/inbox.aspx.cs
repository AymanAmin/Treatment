﻿using System;
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
        int currentStructureUserId = 0, currentUserId = 0;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        ECMSEntities dbSentTo = new ECMSEntities();
        List<Employee_Structure> ListDelegationEmpStru = new List<Employee_Structure>();
        bool isDelegation = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            checkLogin();
            currentUserId = SessionWrapper.LoggedUser.Employee_Id;
            currentStructureUserId = SessionWrapper.EmpStructure;
            isDelegation = getIsDelegation();
            ListDelegationEmpStru = getAllEmployeeStructure();
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
            /*if (loadGridViewInboxTreatment())
            {

            }
            else
            {

            }*/
        }

        private bool getIsDelegation()
        {
            bool flayDele = false;
            try
            {
                flayDele = (bool)dbSentTo.Employee_Structure.First(x => x.Employee_Structure_Id == currentStructureUserId).Type_Delegation;
                return flayDele;
            }
            catch { return flayDele; }
        }

        private List<Employee_Structure> getAllEmployeeStructure()
        {
            List<Employee_Structure> listEpSt = new List<Employee_Structure>();
            List<Employee_Structure> listEpStRetrun = new List<Employee_Structure>();
            List<Employee_Structure> listEpSt1;
            try
            {
                listEpSt = dbSentTo.Employee_Structure.Where(x => x.Employee_Delegation == currentStructureUserId).ToList<Employee_Structure>();
                listEpStRetrun.AddRange(listEpSt);
                int delgaEpStId = 0;
                for (int i = 0; i < listEpSt.Count; i++)
                {
                    if ((bool)listEpSt[i].Status_Structure && !(bool)listEpSt[i].Type_Delegation)
                    {
                        delgaEpStId = listEpSt[i].Employee_Structure_Id;
                        listEpSt1 = new List<Employee_Structure>();
                        listEpSt1 = dbSentTo.Employee_Structure.Where(x => x.Employee_Delegation == delgaEpStId).ToList<Employee_Structure>();
                        listEpStRetrun.AddRange(listEpSt1);
                    }
                }
            }
            catch (Exception ee) { }
            return listEpStRetrun;
        }
        private void checkLogin()
        {
            if (SessionWrapper.LoggedUser != null)
            {
                if (SessionWrapper.IsLocked)
                    Response.Redirect("~/Pages/Setting/admin/LockScreen.aspx");
            }
            else
            {
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");
            }
        }

        private int getStructure(int employeeId)
        {
            int employeeStructureId = 0;
            try
            {
                Employee_Structure employeeStructure = dbSentTo.Employee_Structure.First(x => x.Employee_Id == employeeId);
                employeeStructureId = (int)employeeStructure.Employee_Structure_Id;
            }
            catch (Exception)
            {
            }
            return employeeStructureId;
        }

        private string getEmployeeName(int employeeStrurtId)
        {
            string employeeName = "";
            try
            {
                Employee_Structure employeeStructure = dbSentTo.Employee_Structure.First(x => x.Employee_Structure_Id == employeeStrurtId);
                employeeName = employeeStructure.Employee.Employee_Name_En;
            }
            catch (Exception)
            {
            }
            return employeeName;
        }

        private List<Treatment_Detial> getTreatmentDetail()
        {
            List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    treatmentDetial = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == currentStructureUserId && (x.Assignment_Status_Id == 1 || x.Assignment_Status_Id == 2)).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                    List<Treatment_Detial> treatmentDetialDelegation;
                    int delgEmpStrId = 0;
                    for (int i = 0; i < ListDelegationEmpStru.Count; i++)
                    {
                        delgEmpStrId = ListDelegationEmpStru[i].Employee_Structure_Id;
                        treatmentDetialDelegation = new List<Treatment_Detial>();
                        treatmentDetialDelegation = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == delgEmpStrId && (x.Assignment_Status_Id == 1 || x.Assignment_Status_Id == 2)).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                        treatmentDetial.AddRange(treatmentDetialDelegation);
                    }
                }
                catch (Exception eexs) { }
            }
            return treatmentDetial.OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
        }

        private List<Treatment_Master> getTreatmentMaster()
        {
            List<Treatment_Master> treatmentMaster = new List<Treatment_Master>();
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    treatmentMaster = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == currentStructureUserId && x.Treatment_Status_Id == 1).OrderByDescending(x => x.Treatment_Id).ToList<Treatment_Master>();
                    List<Treatment_Master> treatmentMasterDelegation;
                    int delgEmpStrId = 0;
                    if (!isDelegation)
                    {
                        for (int i = 0; i < ListDelegationEmpStru.Count; i++)
                        {
                            delgEmpStrId = ListDelegationEmpStru[i].Employee_Structure_Id;
                            treatmentMasterDelegation = new List<Treatment_Master>();
                            treatmentMasterDelegation = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == delgEmpStrId && x.Treatment_Status_Id == 1).OrderByDescending(x => x.Treatment_Id).ToList<Treatment_Master>();
                            treatmentMaster.AddRange(treatmentMasterDelegation);
                        }
                    }
                }
                catch (Exception eexs) { }
            }
            return treatmentMaster.OrderByDescending(x => x.Treatment_Id).ToList<Treatment_Master>();
        }

        private List<Treatment_Detial> getTreatmentDetailComplete()
        {
            List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    treatmentDetial = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == currentStructureUserId && x.Assignment_Status_Id == 3).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                    List<Treatment_Detial> treatmentDetialDelegation;
                    int delgEmpStrId = 0;
                    if (!isDelegation)
                    {
                        for (int i = 0; i < ListDelegationEmpStru.Count; i++)
                        {
                            delgEmpStrId = ListDelegationEmpStru[i].Employee_Structure_Id;
                            treatmentDetialDelegation = new List<Treatment_Detial>();
                            treatmentDetialDelegation = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == delgEmpStrId && x.Assignment_Status_Id == 3).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                            treatmentDetial.AddRange(treatmentDetialDelegation);
                        }
                    }
                }
                catch (Exception eexs) { }
            }
            return treatmentDetial.OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
        }

        private bool loadListViewInboxTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "<table id='issue-list-table' class='table dt-responsive' style='width: 100%;border-collapse: collapse !important'>" +
                                                "<thead class='text-left' style='display: none;'>" +
                                                    "<tr>"+
                                                        "<th>Expand</th>"+
                                                        "<th>Actions</th>"+
                                                        "<th>Status</th>"+
                                                        "<th>English Name</th>"+
                                                        "<th>Arabic Name</th>"+
                                                    "</tr>"+
                                                 "</thead>"+
                                                 "<tbody class='text-left'>";
                    inboxTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                    //treatmentDetial = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == currentStructureUserId && (x.Assignment_Status_Id == 1 || x.Assignment_Status_Id == 2)).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                    treatmentDetial = getTreatmentDetail();
                    Treatment_Master oneTreatmentMaster;
                    int motherTreatmentId = 0;
                    int oneTreatmentDetailId = 0;
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        oneTreatmentDetailId = treatmentDetial[i].Treatment_Detial_Id;
                        treatmentDetial[i] = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == oneTreatmentDetailId);
                        if (treatmentDetial[i] != null)
                        {
                            oneTreatmentMaster = new Treatment_Master();
                            motherTreatmentId = (int)treatmentDetial[i].Treatment_Master.Treatment_Mother;
                            if (motherTreatmentId == 0)
                                oneTreatmentMaster = treatmentDetial[i].Treatment_Master;
                            else
                            {
                                oneTreatmentMaster = db.Treatment_Master.First(x => x.Treatment_Id == motherTreatmentId);
                            }
                            yourHTMLstring = "<tr class='" + getReadEmail((bool)treatmentDetial[i].Is_Read) + "'>" +
                                          "<td style='width: 4%;'>" +
                                                "<div class='check-star'>" +
                                                     "<a href='#!' data-toggle='tooltip' data-placement='top' data-trigger='hover' title='" + treatmentDetial[i].Treatment_Master.Treatment_Priority.Treatment_Priority_Name_En + "'>" +
                                                         "<i class='" + treatmentDetial[i].Treatment_Master.Treatment_Priority.Css_Class + "' style='font-size: 150%;'></i>" +
                                                    "</a>" +
                                                 "</div>" +
                                           "</td>" +
                                           "<td style='width: 20%;'><a href='ShowTreatment.aspx?getTreatmentId=" + oneTreatmentMaster.Treatment_Id + "&getTabId=1&getTreatmentDetialId=" + treatmentDetial[i].Treatment_Detial_Id + "' class='email-name'>" + getSubString(treatmentDetial[i].Treatment_Master.Employee_Structure.Employee.Employee_Name_En,20) +"</a></td>" +
                                           "<td style='width: 60%;'><a href='ShowTreatment.aspx?getTreatmentId=" + oneTreatmentMaster.Treatment_Id + "&getTabId=1&getTreatmentDetialId=" + treatmentDetial[i].Treatment_Detial_Id + "' class='email-name'>" + getSubString(treatmentDetial[i].Treatment_Master.Treatment_Subject, 90) + "</a></td>" +
                                           "<td style='width: 7%;' class='email-tag'><a href='ShowTreatment.aspx?getTreatmentId=" + oneTreatmentMaster.Treatment_Id + "&getTabId=1&getTreatmentDetialId=" + treatmentDetial[i].Treatment_Detial_Id + "'><label class='" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Css_Class + "'>" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label></a></td>" +
                                           "<td style='width: 9%;' class='email-time'>" + dateAgo((DateTime)treatmentDetial[i].Treatment_Master.Create_Date) + "</td>" +
                                       "</tr>";
                            inboxTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                        }
                    }

                    yourHTMLstring = "</tbody></table>";
                    inboxTreatment.Controls.Add(new LiteralControl(yourHTMLstring));

                    var counterTreatmentDetial = treatmentDetial.Where(x => x.Is_Read == false).Count();
                    if (counterTreatmentDetial > 0)
                    {
                        addNfNumTreatment.Visible = true;
                        addNfNumTreatment.InnerText = counterTreatmentDetial.ToString();
                    }
                    else
                    {
                        addNfNumTreatment.Visible = false;
                    }
                    return true;
                }
                catch (Exception eee) { return false; }
            }
        }

        private string getSubString(string stringName, int stringLenght)
        {
            string returnSubString = "";
            if (stringName.Length > stringLenght)
                returnSubString = stringName.Substring(0, stringLenght);
            else
                returnSubString = stringName;
            return returnSubString;
        }

        private string getReadEmail(bool flayReadEmail)
        {
            string strReadEmail = "";
            if (flayReadEmail)
                strReadEmail = "read read-email-tr";
            else
                strReadEmail = "unread";
            return strReadEmail;
        }

        private bool loadListViewSendTreatment()
        {
            using (ECMSEntities db = new ECMSEntities())
            {
                try
                {
                    string yourHTMLstring = "<table id='issue-list-table2' class='table dt-responsive' style='width: 100%;border-collapse: collapse !important'>" +
                                                "<thead class='text-left' style='display: none;'>" +
                                                    "<tr>" +
                                                        "<th>Expand</th>" +
                                                        "<th>Actions</th>" +
                                                        "<th>Status</th>" +
                                                        "<th>English Name</th>" +
                                                        "<th>Arabic Name</th>" +
                                                    "</tr>" +
                                                 "</thead>" +
                                                 "<tbody class='text-left'>";
                    sendTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    List<Treatment_Master> treatmentMaster = new List<Treatment_Master>();
                    //treatmentMaster = db.Treatment_Master.Where(x => x.From_Employee_Structure_Id == currentStructureUserId && x.Treatment_Status_Id == 1).OrderByDescending(x => x.Treatment_Id).ToList<Treatment_Master>();
                    treatmentMaster = getTreatmentMaster();
                    int oneTreatmentMasterId = 0;
                    for (int i = 0; i < treatmentMaster.Count; i++)
                    {
                        oneTreatmentMasterId = treatmentMaster[i].Treatment_Id;
                        treatmentMaster[i] = db.Treatment_Master.FirstOrDefault(x => x.Treatment_Id == oneTreatmentMasterId);
                        if (treatmentMaster[i] != null)
                        {
                            yourHTMLstring = "<tr class='unread'>" +
                                           "<td style='width: 4%;'>" +
                                                "<div class='check-star'>" +
                                                     "<a href='#!' data-toggle='tooltip' data-placement='top' data-trigger='hover' title='" + treatmentMaster[i].Treatment_Priority.Treatment_Priority_Name_En + "'>" +
                                                         "<i class='" + treatmentMaster[i].Treatment_Priority.Css_Class + "' style='font-size: 150%;'></i>" +
                                                    "</a>" +
                                                 "</div>" +
                                           "</td>" +
                                           "<td style='width: 20%;'><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "&getTabId=2' class='email-name'>" + getSubString(getDetialSendTo(treatmentMaster[i].Treatment_Id), 20) + "</a></td>" +
                                           "<td style='width: 60%;'><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "&getTabId=2' class='email-name'>" + getSubString(treatmentMaster[i].Treatment_Subject, 90) + "</a></td>" +
                                           "<td style='width: 7%;' class='email-tag'><a href='ShowTreatment.aspx?getTreatmentId=" + treatmentMaster[i].Treatment_Id + "&getTabId=2'><label class='" + treatmentMaster[i].Treatment_Confidentiality.Css_Class + "'>" + treatmentMaster[i].Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label></a></td>" +
                                           "<td style='width: 9%;' class='email-time'>" + dateAgo((DateTime)treatmentMaster[i].Create_Date) + "</td>" +
                                       " </tr>";
                            sendTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                        }
                    }

                    yourHTMLstring = "</tbody></table>";
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
                    string yourHTMLstring = "<table id='issue-list-table1' class='table dt-responsive' style='width: 100%;border-collapse: collapse !important'>" +
                                                "<thead class='text-left' style='display: none;'>" +
                                                    "<tr>"+
                                                        "<th>Expand</th>"+
                                                        "<th>Actions</th>"+
                                                        "<th>Status</th>"+
                                                        "<th>English Name</th>"+
                                                        "<th>Arabic Name</th>"+
                                                    "</tr>"+
                                                 "</thead>"+
                                                 "<tbody class='text-left'>";
                    completeTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                    List<Treatment_Detial> treatmentDetial = new List<Treatment_Detial>();
                    //treatmentDetial = db.Treatment_Detial.Where(x => x.To_Employee_Structure_Id == currentStructureUserId && (x.Assignment_Status_Id == 1 || x.Assignment_Status_Id == 2)).OrderByDescending(x => x.Treatment_Detial_Id).ToList<Treatment_Detial>();
                    treatmentDetial = getTreatmentDetailComplete();
                    Treatment_Master oneTreatmentMaster;
                    int motherTreatmentId = 0;
                    int oneTreatmentDetailId = 0;
                    for (int i = 0; i < treatmentDetial.Count; i++)
                    {
                        oneTreatmentDetailId = treatmentDetial[i].Treatment_Detial_Id;
                        treatmentDetial[i] = db.Treatment_Detial.FirstOrDefault(x => x.Treatment_Detial_Id == oneTreatmentDetailId);
                        if (treatmentDetial[i] != null)
                        {
                            oneTreatmentMaster = new Treatment_Master();
                            motherTreatmentId = (int)treatmentDetial[i].Treatment_Master.Treatment_Mother;
                            if (motherTreatmentId == 0)
                                oneTreatmentMaster = treatmentDetial[i].Treatment_Master;
                            else
                            {
                                oneTreatmentMaster = db.Treatment_Master.First(x => x.Treatment_Id == motherTreatmentId);
                            }
                            yourHTMLstring = "<tr class='unread'>" +
                                          "<td style='width: 4%;'>" +
                                                "<div class='check-star'>" +
                                                     "<a href='#!' data-toggle='tooltip' data-placement='top' data-trigger='hover' title='" + treatmentDetial[i].Treatment_Master.Treatment_Priority.Treatment_Priority_Name_En + "'>" +
                                                         "<i class='" + treatmentDetial[i].Treatment_Master.Treatment_Priority.Css_Class + "' style='font-size: 150%;'></i>" +
                                                    "</a>" +
                                                 "</div>" +
                                           "</td>" +
                                           "<td style='width: 20%;'><a href='ShowTreatment.aspx?getTreatmentId=" + oneTreatmentMaster.Treatment_Id + "&getTabId=3&getTreatmentDetialId=" + treatmentDetial[i].Treatment_Detial_Id + "' class='email-name'>" + getSubString(treatmentDetial[i].Treatment_Master.Employee_Structure.Employee.Employee_Name_En,20) +"</a></td>" +
                                           "<td style='width: 60%;'><a href='ShowTreatment.aspx?getTreatmentId=" + oneTreatmentMaster.Treatment_Id + "&getTabId=3&getTreatmentDetialId=" + treatmentDetial[i].Treatment_Detial_Id + "' class='email-name'>" + getSubString(treatmentDetial[i].Treatment_Master.Treatment_Subject, 90) + "</a></td>" +
                                           "<td style='width: 7%;' class='email-tag'><a href='ShowTreatment.aspx?getTreatmentId=" + oneTreatmentMaster.Treatment_Id + "&getTabId=3&getTreatmentDetialId=" + treatmentDetial[i].Treatment_Detial_Id + "'><label class='" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Css_Class + "'>" + treatmentDetial[i].Treatment_Master.Treatment_Confidentiality.Treatment_Confidentiality_Name_En + "</label></a></td>" +
                                           "<td style='width: 9%;' class='email-time'>" + dateAgo((DateTime)treatmentDetial[i].Treatment_Master.Create_Date) + "</td>" +
                                       "</tr>";
                            completeTreatment.Controls.Add(new LiteralControl(yourHTMLstring));
                        }
                    }

                    yourHTMLstring = "</tbody></table>";
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