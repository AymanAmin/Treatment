using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes
{
    public partial class Meeting : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        int BoardID = 0;
        static int MeetingID = 0;
        int User_Id = 0;
        string _fileExt;
        bool Can_Edit;
        EditBoardPermission boardClass = new EditBoardPermission();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            if (Request["BoardId"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");
            else
                BoardID = int.Parse(Request["BoardId"].ToString());

            if (Request["MeetingID"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");
            else
                MeetingID = int.Parse(Request["MeetingID"].ToString());


            if (SessionWrapper.LoggedUser.Language_id == 1)
                translateValidationArabic();

           
            M_Board B = db.M_Board.FirstOrDefault(x => x.Board_Id == BoardID);
			
            Can_Edit = boardClass.GetEditPermission(B);
            User_Id = SessionWrapper.LoggedUser.Employee_Id;
            MeetingInfo(MeetingID);
            loadDownloadAttachment(MeetingID);
            ViewTopic(MeetingID);
            MeetingMember(BoardID);
            ViewVotes(MeetingID);
            RecommendationPermission(MeetingID, User_Id);
        }

        public void MeetingInfo(int Meeting_Id)
        {
            try
            {
                string yourHTMLstring = "";
                string yourHTMLstring2 = "";
                var Meeting = db.M_Meeting.FirstOrDefault(x => x.Meeting_Id == Meeting_Id);
                var Boards = db.M_Board.FirstOrDefault(x => x.Board_Id == Meeting.Board_Id);
                var Meeting_Status = db.M_Meeting_Status.FirstOrDefault(x => x.Meeting_Status_Id == Meeting.Meeting_Status);
                var Locations = db.M_Board_Location.FirstOrDefault(x => x.Board_Location_Id == Meeting.Board_Location_Id);

                //var meet = (from m in db.M_Meeting join b in db.M_Board on m.Board_Id equals b.Board_Id where m.Meeting_Id == Meeting_Id select (m));
                if (Can_Edit) 
                    yourHTMLstring = "<a href = '../../../../Pages/Eminutes/MeetingManagment/MeetingInfo.aspx?BoardId=" + Meeting.Board_Id + "&" + "MeetingID=" + Meeting.Meeting_Id + "' class='text-muted m-r-10 f-16'> <i class='icofont icofont-edit' style='color:#4183d7'></i></a>";
                else
                    yourHTMLstring = " <i class='icofont icofont-ui-note m-r-10'></i>";

                MeetingInfTitel.Text = yourHTMLstring;

                if (SessionWrapper.LoggedUser.Language_id == 1)
                    BoardName.InnerText = Boards.Board_Name_Ar;
                else
                    BoardName.InnerText = Boards.Board_Name_En;

                EnglishName.InnerText = Meeting.Meeting_Name_En;

                ArabicName.InnerText = Meeting.Meeting_Name_Ar;
                string MDate = DateTime.Parse(Meeting.Meeting_Date.ToString()).Date.ToString("yyyy-MM-dd");
                MeetingDateInfo.InnerText = MDate;

                TimeOfMeeting.InnerText = Meeting.Meeting_Time.ToString();

                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Status.InnerText = Meeting_Status.Meeting_Status__Name_Ar;
                else
                    Status.InnerText = Meeting_Status.Meeting_Status__Name_En;




                if (Can_Edit)
                    yourHTMLstring2 = "<a href = '../../../../Pages/Eminutes/MeetingManagment/MeetingInfo.aspx?BoardId=" + Meeting.Board_Id + "&" + "MeetingID=" + Meeting.Meeting_Id + "' class='text-muted m-r-10 f-16'> <i class='icofont icofont-edit' style='color:#4183d7'></i></a>";
                else
                    yourHTMLstring2 = " <i class='icofont icofont-ui-note m-r-10'></i>";

                LocationTitel.Text = yourHTMLstring2;
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    yourHTMLstring2 = "<h6 class='m-b-5'>" + Locations.Board_Location_Name_Ar + "</h6> " +
                                      "<p class='text-muted'>" + Locations.Board_Location_Description_Ar + "</p>";
                }
                else
                {
                    yourHTMLstring2 = "<h6 class='m-b-5'>" + Locations.Board_Location_Name_En + "</h6> " +
                                      "<p class='text-muted'>" + Locations.Board_Location_Description_En + "</p>";
                }

                if (Locations.Board_Location_OnMap != null && Locations.Board_Location_OnMap != string.Empty)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        yourHTMLstring2 += "<a href ='" + Locations.Board_Location_OnMap + "' target='_blank'><p class='text-muted'><i class='feather icon-map-pin m-r-3'></i>افتح الخريطة</p></a>";
                    else
                        yourHTMLstring2 += "<a href ='" + Locations.Board_Location_OnMap + "' target='_blank'><p class='text-muted'><i class='feather icon-map-pin m-r-3'></i>Open On Map</p></a>";
                }

                Location.Controls.Add(new LiteralControl(yourHTMLstring2));
            }
            catch (Exception x) { }


        }

        private bool loadDownloadAttachment(int Meeting_ID)
        {
            try
            {
                string yourHTMLstring = "";
                List<M_M_Attachments> M_Attachment = new List<M_M_Attachments>();
                M_Attachment = db.M_M_Attachments.Where(x => x.Meeting_Id == Meeting_ID).ToList<M_M_Attachments>();
                if (M_Attachment.Count > 0) AttachmentFile.Visible = true; else AttachmentFile.Visible = false;
                for (int i = 0; i < M_Attachment.Count; i++)
                {
                    _fileExt = System.IO.Path.GetExtension(M_Attachment[i].Path);
                    yourHTMLstring = "<div class='col-md-3'>" +
                                     "<div class='card thumb-block'>" +
                                            "<a href='../../../../Pages/Eminutes/media/M_Attachments/" + M_Attachment[i].Path + "' target='_blank'>" +
                                                getFileImages(_fileExt) +
                                            "</a>" +
                                            "<div class='card-footer text-center'>" +
                                                "<a href='../../../../Pages/Eminutes/media/M_Attachments/" + M_Attachment[i].Path + "' target='_blank'>" + M_Attachment[i].FileName + "</a>" +
                                             "</div>" +
                                             "</div>" +
                                       "</div>";
                    downloadAttachment.Controls.Add(new LiteralControl(yourHTMLstring));
                }

            }
            catch { string messageForm = "Erorr to save data in system"; return false; }
            return true;
        }

        private string getFileImages(string fileExtention)
        {
            string getImageExtention = "";
            if (fileExtention == ".pdf")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image'><i class='icofont icofont-file-pdf'></i></span>";
            else if (fileExtention == ".png" || fileExtention == ".jpeg" || fileExtention == ".jpg" || fileExtention == ".jpe")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(18, 132, 161);'><i class='icofont icofont-ui-image'></i></span>";
            else if (fileExtention == ".doc" || fileExtention == ".docx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-video'><i class='icofont icofont-file-word'></i></span>";
            else if (fileExtention == ".ppt" || fileExtention == ".pptx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: #ffc107;'><i class='icofont icofont-file-powerpoint'></i></span>";
            else if (fileExtention == ".xls" || fileExtention == ".xlsx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(33, 200, 114);'><i class='icofont icofont-file-excel'></i></span>";
            else if (fileExtention == ".txt")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(191, 47, 139);'><i class='icofont icofont-file-text'></i></span>";
            else
                getImageExtention = "<span class='jFiler-icon-file f-file f-file-ext-doc' style='background-color: rgb(56, 78, 83);'>" + fileExtention + "</span>";

            return getImageExtention;
        }

        public void ViewTopic(int Meeting_Id)
        {
            try
            {
                int i = 0;
                string yourHTMLstring = "";
                string AddTopicText = "Add Topic";

                if (SessionWrapper.LoggedUser.Language_id == 1) AddTopicText = "إضافة موضوع";

                var Topic = db.M_Topic.Where(x => x.Meeting_Id == Meeting_Id).ToList();
                if (Can_Edit)
                   yourHTMLstring = "<a href='TopicManagment/TopicInfo.aspx?BoardID=" + BoardID + "&MeetingID=" + Meeting_Id + "' class='text-muted m-r-10 f-16'> <i style='color:green' class='icofont icofont-ui-add'></i></a>" + AddTopicText + "</a>";
                else
                    yourHTMLstring = " <i class='icofont icofont-ui-note m-r-10'></i>";

                AddTopic.Controls.Add(new LiteralControl(yourHTMLstring));

                yourHTMLstring = "";
                while (i < Topic.Count)
                {
                    int statusid = 0;
                    int str_id = 0;
                    string StruName = "";
                    if (Topic[i].Structure_Id != null) {
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
                        {
                            if (SessionWrapper.LoggedUser.Language_id == 1)
                                yourHTMLstring += "<td><label class='label label-success'>" + status.M_Topic_Status_Name_Ar + "</label></td>";
                            else
                                yourHTMLstring += "<td><label class='label label-success'>" + status.M_Topic_Status_Name_En + "</label></td>";

                        }
                        else
                        {
                            if (SessionWrapper.LoggedUser.Language_id == 1)
                                yourHTMLstring += "<td> <label class='label label-danger'>" + status.M_Topic_Status_Name_Ar + "</label></td>";
                            else
                                yourHTMLstring += "<td> <label class='label label-danger'>" + status.M_Topic_Status_Name_En + "</label></td>";

                        }
                    else
                        yourHTMLstring += "<td> <label class='label label-info'>Unknow </label></td>";
                    //"<td><span class='label label-danger'>" + "Close" + "</span></td>" +
                    yourHTMLstring += "<td><a href='TopicManagment/TopicInfo.aspx?BoardID=" + BoardID + "&MeetingID=" + Meeting_Id + "&TopicID=" + Topic[i].Topic_Id + "'  ><i class='icofont icofont-ui-edit text-info h6'></i> &nbsp;&nbsp; </a>" +
                    "<a href='#' data-href='TopicManagment/deleteTopic.ashx?BoardId=" + BoardID + "&MeetingId=" + Meeting_Id + "&TopicId=" + Topic[i].Topic_Id + "' data-toggle='modal' data-target='#confirm-delete'><i class='icofont icofont-ui-delete text-danger h6'></i></a></td>" +
                    "<td>" + Topic[i].Topic_Description_En + "</td>" +
                    "<td>" + Topic[i].Topic_Recommendation_En + "</td>" +
                    "<td>" + Topic[i].Topic_Recommendation_Doc_En + "</td>" +
                    "<td>" + StruName + "</td>" +
                    "</tr>";
                    i += 1;
                }
                Topics.Text = yourHTMLstring;
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
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        yourHTMLstring = "<p class='text-muted m-b-10'>" + MemberType[y].Member_Type_Name_Ar + "</p>";
                    else
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
                        var Employee = db.Employees.FirstOrDefault(x => x.Employee_Id == emp_id);
                        var MemberAttendees = db.M_Attendees.FirstOrDefault(x => x.Board_Member_Id == BoMe_Id && x.Meeting_Id == MeetingID);
                        if (MemberAttendees != null) { 
                            if (MemberAttendees.Attendess_Status == 1) AttendeesCheck = "checked='checked'"; else AttendeesCheck = "";
                        }else { AttendeesCheck = ""; }
                        ImgTag = "<img class='img-radius img-40 align-top m-r-15'" + "src='../../../../media/Profile/" + Employee.Employee_Profile + "'alt='" + Employee.Employee_Profile + "'>";
                        yourHTMLstring += "<tr>" +
                               "<td class='b-none'>" +
                                "<a href = '#!' class='align-middle'>" +
                                    ImgTag +
                                    "<div class='d-inline-block'>";
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            yourHTMLstring += "<h6>" + Employee.Employee_Name_Ar + "</h6>";
                        else
                            yourHTMLstring += "<h6>" + Employee.Employee_Name_En + "</h6>";

                        //"<p class='text-muted'>Graphic Designer</p>" +
                        yourHTMLstring += "</div>" +
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
                db.Configuration.LazyLoadingEnabled = false;
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
                //Add it to log file 
                LogData = "data:" + JsonConvert.SerializeObject(Attendees, logFileModule.settings);
                logFileModule.logfile(10, "إضافة حضورالموظف", "Add Employee Attendees", LogData);
            }
            catch (Exception e) { }
        }

        public void ViewVotes(int Meeting_Id)
        {

    

            string yourHTMLStringTrack, isTrackBorder = "";
            string TypeOfVote = "";
            var Votes = db.M_Recommendation.Where(x => x.Meeting_Id == Meeting_Id).ToList();
            if (Votes.Count > 0) {
                ShowRecommendation.Visible = true;
                trackVotes.Controls.Clear();
            } else { ShowRecommendation.Visible = false; }
            for (int i = 0; i < Votes.Count; i++)
            {
                if (Votes[i].Recommendation_Status == 1)
                {
                    isTrackBorder = "border-left:3px solid #0ac282";
                    if (SessionWrapper.LoggedUser.Language_id == 1) TypeOfVote = "<lable class='label label-success'>موافق</lable>"; else TypeOfVote = "<lable class='label label-success'>Approve</lable>";
                } else if (Votes[i].Recommendation_Status == 2)
                {
                    isTrackBorder = "border-left:3px solid #fe9365";
                    if (SessionWrapper.LoggedUser.Language_id == 1) TypeOfVote = "<lable class='label label-warning'>متحفظ</lable>"; else TypeOfVote = "<lable class='label label-warning'>Discreet</lable>";
                }
                else if (Votes[i].Recommendation_Status == 3)
                {
                    isTrackBorder = "border-left:3px solid #eb3422";
                    if (SessionWrapper.LoggedUser.Language_id == 1) TypeOfVote = "<lable class='label label-danger'>غير موافق</lable>"; else TypeOfVote = "<lable class='label label-danger'>Not Approve</lable>";
                }
                else if (Votes[i].Recommendation_Status == 4)
                {
                    isTrackBorder = "border-Top:3px solid #0ac282";
                    if (SessionWrapper.LoggedUser.Language_id == 1) TypeOfVote = "<lable class='label label-success'>قبول</lable>"; else TypeOfVote = "<lable class='label label-success'>Approvel</lable>";
                }
                else if (Votes[i].Recommendation_Status == 5)
                {
                    isTrackBorder = "border-Top:3px solid #eb3422";
                    if (SessionWrapper.LoggedUser.Language_id == 1) TypeOfVote = "<lable class='label label-danger'>رفض</lable>"; else TypeOfVote = "<lable class='label label-danger'>Not Approvel</lable>";
                }
                // isTrackBorder = "0px solid #fe9365";
                int BM_Id = 0;
                int.TryParse(Votes[i].Board_Member_Id.ToString(), out BM_Id);
                var Emp = (from e in db.Employees join b in db.M_Board_Member on e.Employee_Id equals b.Employee_Id join l in db.M_Member_Type on b.Member_Type_Id equals l.Member_Type_Id where b.Board_Member_Id == BM_Id select new { e, l }).ToList();

                yourHTMLStringTrack = "<div class='sortable-moves col-xs-12' style='" + isTrackBorder + "'>" +
                                            "<img class='img-fluid p-absolute' src='../../../../media/Profile/" + Emp[0].e.Employee_Profile + "' alt=''>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    yourHTMLStringTrack += "<h6 class='d-inline-block'>" + Emp[0].e.Employee_Name_Ar + " - " + TypeOfVote + "</h6>";
                else
                    yourHTMLStringTrack += "<h6 class='d-inline-block'>" + Emp[0].e.Employee_Name_En + " - " + TypeOfVote + "</h6>";

                yourHTMLStringTrack += "<span class='label label-default f-right' style='background: linear-gradient(to right, #452a74, #f6f7fb);'>" + Votes[i].Create_Date + "</span>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    yourHTMLStringTrack += "<div class='f-13 text-muted'>" + Emp[0].l.Member_Type_Name_Ar + "</div>";
                else
                    yourHTMLStringTrack += "<div class='f-13 text-muted'>" + Emp[0].l.Member_Type_Name_En + "</div>";

                yourHTMLStringTrack += "<h6 class='d-inline-block'>" + Votes[i].Recommendation_Description + "</h6></br>" +
        "</div>";
                trackVotes.Controls.Add(new LiteralControl(yourHTMLStringTrack));
            }
        }



        public void Recommendation(int status)
        {
            int U_M_B = 0;
            db.Configuration.LazyLoadingEnabled = false;

            var UMB = db.M_Board_Member.FirstOrDefault(x => x.Board_Id == BoardID && x.Employee_Id == User_Id);
            int.TryParse(UMB.Board_Member_Id.ToString(), out U_M_B);

            M_Recommendation Recommendation = db.M_Recommendation.Create();
            Recommendation.Meeting_Id = MeetingID;
            Recommendation.Board_Member_Id = U_M_B;
            Recommendation.Recommendation_Status = status;
            Recommendation.Create_Date = DateTime.Now;
            if (status < 4) Recommendation.Recommendation_Description = RecommendationValue.Value; else Recommendation.Recommendation_Description = ApprovalR.Value;
            db.M_Recommendation.Add(Recommendation);
            db.SaveChanges();
            RecommendationValue.InnerText = string.Empty;
            AddRecommendation.Visible = false;
            ApprovalRecommendation.Visible = false;
            ViewVotes(MeetingID);

            //Add it to log file 
            LogData = "data:" + JsonConvert.SerializeObject(Recommendation, logFileModule.settings);
            logFileModule.logfile(10, "إضافة توصية", "Add Employee Recommendation", LogData);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Recommendation(1);
        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            Recommendation(2);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Recommendation(3);
        }

        protected void Approval_Click(object sender, EventArgs e)
        {
            Recommendation(4);
        }

        protected void NotApproval_Click(object sender, EventArgs e)
        {
            Recommendation(5);
        }

        public void translateValidationArabic()
        {

            Button1.Text = "موافق";
            Button2.Text = "غير موافق";
            Button3.Text = "متحفظ";

            Approval.Text = "موافق";
            NotApproval.Text = "غير موافق";

        }


        public void RecommendationPermission(int Meeting_Id,int User_Id)
        {
            int BoardID, U_M_B= 0;
            bool Can_Approval = false;
            var Meeting = db.M_Meeting.FirstOrDefault(x => x.Meeting_Id == Meeting_Id);
            
            int.TryParse(Meeting.Board_Id.ToString(), out BoardID);
            var UMB = db.M_Board_Member.FirstOrDefault(x => x.Board_Id == BoardID && x.Employee_Id== User_Id);
            int.TryParse(UMB.Board_Member_Id.ToString(), out U_M_B);

            if (UMB.Member_Type_Id == 3) Can_Approval = true; else Can_Approval = false;
           DateTime M_Date = DateTime.Parse(Meeting.Meeting_Date.ToString());
            M_Date = M_Date.Date.AddDays(2);
            DateTime Date = DateTime.Now.Date;
            if (M_Date <= Date && Meeting.Meeting_Status == 2)
            {
                var B_M = db.M_Board_Member.Where(x => x.Board_Id == BoardID).ToList();
                for (int i = 0; i < B_M.Count; i++)
                {
                    int M_id = B_M[i].Board_Member_Id;
                    M_Recommendation Rec = db.M_Recommendation.FirstOrDefault(x => x.Meeting_Id == Meeting_Id && x.Board_Member_Id == M_id);
                    if (Rec == null)
                    {
                        M_Recommendation Recommendation = db.M_Recommendation.Create();
                        Recommendation.Meeting_Id = MeetingID;
                        Recommendation.Board_Member_Id = M_id;
                        Recommendation.Recommendation_Status = 1;
                        Recommendation.Create_Date = DateTime.Now;
                        Recommendation.Recommendation_Description = "auto Recommendation";
                        db.M_Recommendation.Add(Recommendation);
                        db.SaveChanges();
                    }
                }
                ViewVotes(Meeting_Id);
            }

            if (Meeting!=null &&Meeting.Meeting_Status == 2)
            {
               M_Recommendation Rec = db.M_Recommendation.FirstOrDefault(x => x.Meeting_Id == Meeting_Id && x.Board_Member_Id == U_M_B);
                if(Rec != null)AddRecommendation.Visible = false;else AddRecommendation.Visible = true;
            }

            var Votes = db.M_Recommendation.Where(x => x.Meeting_Id == Meeting_Id).ToList();
            var B_Member = db.M_Board_Member.Where(x => x.Board_Id == BoardID).ToList();
            M_Recommendation ApprovalReco = db.M_Recommendation.FirstOrDefault(x => x.Meeting_Id== Meeting_Id && ( x.Recommendation_Status == 4 || x.Recommendation_Status == 5));

            if (Votes.Count == B_Member.Count && Can_Approval &&  ApprovalReco == null)
            {
                ApprovalRecommendation.Visible = true;
                AddRecommendation.Visible = false;
            }
            else
            {
                ApprovalRecommendation.Visible = false;
            }

            

        }
    }
}