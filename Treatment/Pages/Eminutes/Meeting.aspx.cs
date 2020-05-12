using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes
{
    public partial class Meeting : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        int BoardID = 0;
        static int MeetingID = 0;
        int User_Id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["BoardId"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");
            else
                BoardID = int.Parse(Request["BoardId"].ToString());

            if (Request["MeetingID"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");
            else
                MeetingID = int.Parse(Request["MeetingID"].ToString());

            User_Id = 2;
            MeetingInfo(MeetingID);
            ViewTopic(MeetingID);
            MeetingMember(BoardID);
            ViewVotes(MeetingID);
        }

        public void MeetingInfo(int Meeting_Id)
        {
            try
            {
                string yourHTMLstring = "";
                string yourHTMLstring2 = "";
                var Meeting = db.M_Meeting.First(x => x.Meeting_Id == Meeting_Id);
                var Boards = db.M_Board.First(x => x.Board_Id == Meeting.Board_Id);
                var Meeting_Status = db.M_Meeting_Status.First(x => x.Meeting_Status_Id == Meeting.Meeting_Status);
                var Locations = db.M_Board_Location.First(x => x.Board_Location_Id == Meeting.Board_Location_Id);

                //var meet = (from m in db.M_Meeting join b in db.M_Board on m.Board_Id equals b.Board_Id where m.Meeting_Id == Meeting_Id select (m));

                yourHTMLstring = "<h5 class='card -header-text'><i class='icofont icofont-ui-note m-r-10'></i>" + "Meeting Properties" + "</h5>";
                MeetingInfTitel.Controls.Add(new LiteralControl(yourHTMLstring));

                yourHTMLstring = "<table class='table table-border table-xs'>" +
                                "<tbody>" +
                                    "<tr>" +
                                        "<td><i class='icofont icofont-users-social primary'></i> " + "Board Name:" + "</td>" +
                                        "<td class='text-right f-left'><span class='f-right'><a href = '#' >" + Boards.Board_Name_En + "</a></span></td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td><i class='icofont icofont-underline primary'></i> " + "English Name:" + "</td>" +
                                        "<td class='text-right f-left'><span class='f-right'><a href = '#' >" + Meeting.Meeting_Name_En + "</a></span></td>" +
                                    "</tr>" +
                                    "<tr>" +
                                       " <td><i class='icofont icofont-underline primary'></i>" + "Arabic Name:" + "</td>" +
                                        "<td class='text-right f-left'>" + Meeting.Meeting_Name_Ar + "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td><i class='icofont icofont-calendar primary'></i> " + "Meeting Date: " + "</td>" +
                                        "<td class='text-right f-left'>" + Meeting.Meeting_Date + "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td><i class='icofont icofont-calendar primary'></i> " + "Time Of Meeting: " + "</td>" +
                                        "<td class='text-right f-left'>" + Meeting.Meeting_Time + "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td><i class='icofont icofont-label primary'></i> " + " Status: " + "</td>" +
                                        "<td class='text-right f-left'>" + Meeting_Status.Meeting_Status__Name_En + "</td>" +
                                    "</tr>" +
                               "</tbody>" +
                            "</table>";
                MeetingInf.Controls.Add(new LiteralControl(yourHTMLstring));

                yourHTMLstring2 = "<h5>" + " Meeting Location " + "</h5>";
                LocationTitel.Controls.Add(new LiteralControl(yourHTMLstring2));

                yourHTMLstring2 = "<h6 class='m-b-5'>" + Locations.Board_Location_Name_En + "</h6> " +
                                "<p class='text-muted m-b-0'>" + Locations.Board_Location_Description_En + "</p>";
                Location.Controls.Add(new LiteralControl(yourHTMLstring2));
            }
            catch (Exception x) { }


        }

        public void ViewTopic(int Meeting_Id)
        {
            try
            {
                int i = 0;
                string yourHTMLstring = "";
                var Topic = db.M_Topic.Where(x => x.Meeting_Id == Meeting_Id).ToList();
                yourHTMLstring =  "<div class='card'>" +
                                          "<div class='card-header'>" +
                                              "<h5>Subjects</h5>" +
                                              "<div class='card-header-right'>" +
                                                 "<!--<i class='icofont icofont-spinner-alt-5'></i>-->" +
                                                  "<a class='btn btn-success btn-round' href='TopicManagment/TopicInfo.aspx?BoardID=" + BoardID + "&MeetingID=" + Meeting_Id + "' > Add Topic </a>" +
                                               "</div>" +
                                          "</div>";
                yourHTMLstring += "<div class='card-block'>"+
                                    "<div class='table-responsive'>"+
                                    "<table id ='issue-list-table' class='table dt-responsive width-100'>" +
                                      "<thead class='text-left'>" +
                                            "<tr>" +
                                            "<th>" + "Extend" + "</th>" +
                                            "<th>" + "Subject Title" + "</th>" +
                                            "<th>" + "Status" + "</th>" +
                                            "<th>" + "Action" + "</th>" +
                                            "<th>" + "Description" + "</th>" +
                                            "<th>" + "Recommendation" + "</th>" +
                                            "<th>" + "Recommendation document" + "</th>" +
                                            "<th>" + "Structure" + "</th>" +
                                        "</tr>" +
                                    "</thead>" +
                                    "<tbody class='text-left'>";
                while (i < Topic.Count)
                {
                    int statusid = 0;
                    int str_id = 0;
                    string StruName = "";
                    if(Topic[i].Structure_Id != null) { 
                    int.TryParse(Topic[i].Structure_Id.ToString(), out str_id);
                    var Structure = db.Structures.FirstOrDefault(x => x.Structure_Id == str_id);
                        StruName = Structure.Structure_Name_En;
                    }
                    yourHTMLstring += "<tr>" +
                    "<td class='txt-primary'>" + "Extend" + "</td>" +
                    "<td>" + Topic[i].Topic_Name_En + "</td>";
                    try { statusid = (int)Topic[i].Topic_Status; } catch { }
                    M_Topic_Status status = db.M_Topic_Status.FirstOrDefault(x => x.M_Topic_Status_Id == statusid);
                    if (status != null)
                        if (status.M_Topic_Status_Id == 1)
                            yourHTMLstring += "<td><label class='label label-success'>" + status.M_Topic_Status_Name_En + "</label></td>";
                        else
                            yourHTMLstring += "<td> <label class='label label-danger'>" + status.M_Topic_Status_Name_En + "</label></td>";
                    else
                        yourHTMLstring += "<td> <label class='label label-info'>Unknow </label></td>";
                    //"<td><span class='label label-danger'>" + "Close" + "</span></td>" +
                    yourHTMLstring += "<td><a href='TopicManagment/TopicInfo.aspx?BoardID="+BoardID+ "&MeetingID=" + Meeting_Id +"&TopicID="+ Topic[i].Topic_Id+ "'  ><i class='icofont icofont-ui-edit text-info h6'></i> &nbsp;&nbsp; </a>" +
                    "<a href='TopicManagment/deleteTopic.ashx?BoardId="+BoardID + "&MeetingId=" + Meeting_Id + "&TopicId=" + Topic[i].Topic_Id + "'><i class='icofont icofont-ui-delete text-danger h6'></i></a></td>" +
                    "<td>" + Topic[i].Topic_Description_En +  "</td>" +
                    "<td>" + Topic[i].Topic_Recommendation_En + "</td>" +
                    "<td>" + Topic[i].Topic_Recommendation_Doc_En + "</td>" +
                    "<td>" + StruName+ "</td>" +
                    "</tr>";
                    i += 1;
                }
                yourHTMLstring += "</tbody>" +
                               "</table>"+
                                "</div>"+
                        //<!--end of table -->
                    "</div>"+
              "</div>";
                Topics.Controls.Add(new LiteralControl(yourHTMLstring));
            }
            catch (Exception x) { }

        }

        public void MeetingMember(int Board_Id)
        {
            try
            {

                string yourHTMLstring = "";
                string img = "Profile.jpg";
                string ImgTag = "";
                string AttendeesCheck = "";
                var MemberType = db.M_Member_Type.ToList();
                for (int y = 0; y < MemberType.Count; y++)
                {
                    int i = 0;
                    yourHTMLstring = "<p class='text-muted m-b-10'>" + MemberType[y].Member_Type_Name_En + "</p>";
                    //MeetingMembersTitel.Controls.Add(new LiteralControl(yourHTMLstring));
                    int MT_Id = 0;
                    int.TryParse(MemberType[y].Member_Type_Id.ToString(), out MT_Id);
                    var BoardMember = db.M_Board_Member.Where(x => x.Board_Id == Board_Id && x.Member_Type_Id == MT_Id).ToList();
                    yourHTMLstring += "<div class='table-responsive'>" +
                                      "<table class='table table-hover'>";
                    while (i < BoardMember.Count)
                    {
                        int emp_id = 0;
                        int.TryParse(BoardMember[i].Employee_Id.ToString(), out emp_id);
                        int BoMe_Id = 0;
                        int.TryParse(BoardMember[i].Board_Member_Id.ToString(), out BoMe_Id);
                        var Employee = db.Employees.First(x => x.Employee_Id == emp_id);
                        var MemberAttendees = db.M_Attendees.FirstOrDefault(x => x.Board_Member_Id == BoMe_Id && x.Meeting_Id == MeetingID);
                        if(MemberAttendees !=  null)

                        if (MemberAttendees.Attendess_Status == 1) AttendeesCheck = "checked='checked'"; else AttendeesCheck = "";
                        else {AttendeesCheck = "";}
                        ImgTag = "<img class='img-radius img-40 align-top m-r-15'" + "src='../../../../media/Profile/" + Employee.Employee_Profile + "'alt='" + Employee.Employee_Profile + "'>";
                        yourHTMLstring += "<tr>" +
                               "<td class='b-none'>" +
                                "<a href = '#!' class='align-middle'>" +
                                    ImgTag +
                                    "<div class='d-inline-block'>" +
                                        "<h6>" + Employee.Employee_Name_En + "</h6>" +
                                        "<p class='text-muted m-b-0'>Graphic Designer</p>" +
                                    "</div>" +
                                "</a>" +
                            "</td>" +
                            "<td style = 'border: 0px' >" +
                                "<input type='checkbox' id='" + BoardMember[i].Board_Member_Id.ToString() + "'  class='js-small f-right' onchange='Attendees(this)' " + AttendeesCheck + "/>" +
                            "</td>" +
                        "</tr>";
                        i += 1;
                    }
                    yourHTMLstring += "</table></div>";
                    MeetingMembers.Controls.Add(new LiteralControl(yourHTMLstring));
                }
            }
            catch (Exception x) { }
        }

        [WebMethod]
        public static void Attendees(int Employee_Id, int Attendess_Status)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            {
                ECMSEntities db = new ECMSEntities();
                var EmpAttendees = db.M_Attendees.Where(x => x.Board_Member_Id == Employee_Id && x.Meeting_Id == MeetingID).ToList();
                if (EmpAttendees.Count > 0)
                {
                    var DelAttendees = db.M_Attendees.First(x => x.Board_Member_Id == Employee_Id && x.Meeting_Id == MeetingID);
                    db.M_Attendees.Remove(DelAttendees);
                    db.SaveChanges();
                    /* Add it to log file 
                    LogData = "data:" + JsonConvert.SerializeObject(DelAttendees, logFileModule.settings);
                    logFileModule.logfile(10, "حذف حضورالموظف", "Delete Employee Attendees", LogData);*/
                }
                M_Attendees Attendees = db.M_Attendees.Create();
                Attendees.Board_Member_Id = Employee_Id;
                Attendees.Meeting_Id = MeetingID;
                Attendees.Attendess_Status = Attendess_Status;
                Attendees.Create_Date = DateTime.Now;
                db.M_Attendees.Add(Attendees);
                db.SaveChanges();
                /* Add it to log file 
                LogData = "data:" + JsonConvert.SerializeObject(Attendees, logFileModule.settings);
                logFileModule.logfile(10, "إضافة حضورالموظف", "Add Employee Attendees", LogData);*/
            }
            catch (Exception e) { }
        }

        public void ViewVotes(int Meeting_Id)
        {
            string yourHTMLStringTrack = "";
            var Votes = db.M_Recommendation.Where(x => x.Meeting_Id == Meeting_Id).ToList();
            for (int i = 0; i < Votes.Count; i++)
            {
                int BM_Id = 0;
                int.TryParse(Votes[i].Board_Member_Id.ToString(), out BM_Id);
                var Emp = (from e in db.Employees join b in db.M_Board_Member on e.Employee_Id equals b.Employee_Id where b.Board_Member_Id == BM_Id select e).ToList();

                yourHTMLStringTrack = "<div class='sortable-moves col-xs-12'>" +
                                            "<img class='img-fluid p-absolute' src='../../../../media/Profile/" + Emp[0].Employee_Profile + "' alt=''>" +
                                            "<h6 class='d-inline-block'>" + Emp[0].Employee_Name_En + "</h6>" +
                                            "<span class='label label-default f-right'>" + Votes[0].Create_Date + "</span>" +
                                            "<div class='f-13 text-muted'>" + "Member" + "</div>" +
                                            "<h6 class='d-inline-block'>" + Votes[0].Recommendation_Description + "</h6></br>" +
                                     "</div>";
                trackVotes.Controls.Add(new LiteralControl(yourHTMLStringTrack));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Recommendation(1);
        }

        public void Recommendation(int status)
        {
            M_Recommendation Recommendation = db.M_Recommendation.Create();
            Recommendation.Meeting_Id = MeetingID;
            Recommendation.Board_Member_Id = User_Id;
            Recommendation.Recommendation_Status = status;
            Recommendation.Create_Date = DateTime.Now;
            Recommendation.Recommendation_Description = RecommendationValue.Value;
            db.M_Recommendation.Add(Recommendation);
            db.SaveChanges();
           // ViewVotes(MeetingID);
            /* Add it to log file 
                LogData = "data:" + JsonConvert.SerializeObject(Recommendation, logFileModule.settings);
                logFileModule.logfile(10, "إضافة توصية", "Add Employee Recommendation", LogData);*/
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Recommendation(0);
        }
    }
}