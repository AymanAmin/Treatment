using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes
{
    public partial class Board : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        M_Board Current_Board = new M_Board();
        bool Can_Edit = false;
        string _fileExt;
        /// <summary>
        /// Member type (1 = Supervisor , 2 = secretarial , 3 = Members)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            int board_id = 0;
            if (Request["BoardId"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");

            board_id = int.Parse(Request["BoardId"].ToString());


            Current_Board = db.M_Board.FirstOrDefault(x => x.Board_Id == board_id);
            if (Current_Board != null)
            {
                // load current board info
                load_board_info(Current_Board);
                loadDownloadAttachment(Current_Board.Board_Id);

                //Load sub boards
                List<M_Board> sub_board = db.M_Board.Where(x => x.Parent == board_id).ToList();
                if (sub_board.Count > 0)
                {
                    Classes.EditBoardPermission EBP = new Classes.EditBoardPermission();
                    SubBoard.Text = EBP.LoadBoad(sub_board, "12");
                }

                // Load member 
                List<M_Board_Member> list_member = db.M_Board_Member.Where(x => x.Board_Id == board_id).ToList();
                if (list_member.Count > 0)
                    LoadMember(list_member);

                //Load Locations
                List<M_Board_Location> Locations = db.M_Board_Location.Where(x => x.Board_Id == board_id).ToList();
                if (Locations.Count > 0)
                    LoadLocations(Locations);

                //Load Meetings
                LoadMeetings(board_id);
            }
            else
            {
                Response.Redirect("~/Pages/Admin/Eminutes/Home.aspx");
            }
        }

        private void load_board_info(M_Board Current_Board)
        {
            // Board Properties
            txtArabicName.Text = Truncate(Current_Board.Board_Name_Ar,20); ;
            txtEnglishName.Text = Truncate(Current_Board.Board_Name_En,20);
            txtCreatedDate.Text = Truncate(Current_Board.Create_Date.ToString(), 20);
            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                txtType.Text = Truncate(Current_Board.M_Board_Type.Board_Type_Name_Ar, 20);
                txtClassification.Text = Truncate(Current_Board.M_Board_Classification.Board_Classification_Name_Ar, 20);
            }
            else
            {
                txtType.Text = Truncate(Current_Board.M_Board_Type.Board_Type_Name_En, 20);
                txtClassification.Text = Truncate(Current_Board.M_Board_Classification.Board_Classification_Name_En, 20);
            }

            //Edit Board info if you are supervisor 
            Classes.EditBoardPermission EBP = new Classes.EditBoardPermission();
            Can_Edit = EBP.GetEditPermission(Current_Board);
            if (Can_Edit)
            {
                txtEditBoard.Text = "<a href='../../../../Pages/Eminutes/BoardManagment/BoardInfo.aspx?BoardId=" + Current_Board.Board_Id + "' class='text-muted m-r-10 f-16'> <i style='color:#4183d7' class='icofont icofont-edit'></i></a>";
                txtMeetingMembers.Text = "<a href='../../../../Pages/Eminutes/BoardManagment/BoardMember.aspx?BoardId=" + Current_Board.Board_Id + "' class='text-muted m-r-10 f-16'> <i style='color:#4183d7' class='icofont icofont-edit'></i></a>";
                txtEditLocations.Text = "<a href='../../../../Pages/Eminutes/BoardManagment/BoardLocations.aspx?BoardId=" + Current_Board.Board_Id + "' class='text-muted m-r-10 f-16'> <i style='color:#4183d7' class='icofont icofont-edit'></i></a>";
                txtAddMeeting.Text = "<a href='MeetingManagment/MeetingInfo.aspx?BoardID=" + Current_Board.Board_Id + "' class='text-muted m-r-10 f-16'> <i style='color:green' class='icofont icofont-ui-add'></i></a>";
            }
            else
            {
                txtEditBoard.Text = " <i class='icofont icofont-ui-note m-r-10'></i>";
                txtMeetingMembers.Text = " <i class='icofont icofont-ui-note m-r-10'></i>";
                txtEditLocations.Text = " <i class='icofont icofont-ui-note m-r-10'></i>";
                txtAddMeeting.Text = " <i class='icofont icofont-ui-note m-r-10'></i>";
            }
        }



        private void LoadMember(List<M_Board_Member> list_member)
        {
            string supervisor = string.Empty;
            string secretarial = string.Empty;
            string members = string.Empty;
            string holder_of_authority = string.Empty;

            list_member = list_member.OrderBy(x => x.Member_Type_Id).ToList();

            for (int i = 0; i < list_member.Count; i++)
            {
                //Load emp information
                Employee emp = list_member[i].Employee;
                // Load structure info
                List<Employee_Structure> emp_struc = emp.Employee_Structure.ToList();

                string str = "<tr>";
                str += "<td class='b-none'>";
                str += "<a href = '#!' class='align-middle'>";
                str += "<img src = '../../../media/Profile/" + emp.Employee_Profile + "' alt='user image' class='img-radius img-40 align-top m-r-15'>";
                str += "<div class='d-inline-block'>";
                if(SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<h6>" + emp.Employee_Name_Ar + "</h6>";
                else
                    str += "<h6>" + emp.Employee_Name_En + "</h6>";

                //check if there is structure in his information
                if (emp_struc.Count > 0)
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<p class='text-muted'>" + emp_struc[0].Structure.Structure_Name_Ar + "</p>";
                    else
                        str += "<p class='text-muted'>" + emp_struc[0].Structure.Structure_Name_En + "</p>";
                else if (emp_struc.Count > 1)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        str += "<p class='text-muted'>" + emp_struc[0].Structure.Structure_Name_Ar + "</p> , ";
                        str += " <p class='text-muted'>" + emp_struc[1].Structure.Structure_Name_Ar + "</p>";
                    }
                    else
                    {
                        str += "<p class='text-muted'>" + emp_struc[0].Structure.Structure_Name_En + "</p> , ";
                        str += " <p class='text-muted'>" + emp_struc[1].Structure.Structure_Name_En + "</p>";
                    }
                }
                else
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<p class='text-muted'> غير معروف </p>";
                    else
                        str += "<p class='text-muted'> Unknow </p>";
                }

                    str += "</div>";
                str += "</a>";
                str += "</td>";
                str += "</tr>";

                if (list_member[i].Member_Type_Id == 1)
                    supervisor += str;
                else if (list_member[i].Member_Type_Id == 2)
                    secretarial += str;
                else if (list_member[i].Member_Type_Id == 3)
                    holder_of_authority += str;
                else
                    members += str;
            }
            if (supervisor == string.Empty)
            { Div_SuperVisor.Visible = false; Div_SuperVisor_Table.Visible = false; }
            else
                txtSuperVisor.Text = supervisor;

            if (secretarial == string.Empty)
            { Div_Secretarial.Visible = false; Div_Secretarial_Table.Visible = false; }
            else
                txtSecretarial.Text = secretarial;

            if (holder_of_authority == string.Empty)
            { Div_HolderOfAuthority.Visible = false; Div_HolderOfAuthority_Table.Visible = false; }
            else
                txtHolderOfAuthority.Text = holder_of_authority;

            if (members == string.Empty)
            { Div_Members.Visible = false; Div_Members_Table.Visible = false; }
            else
                txtMembers.Text = members;

        }

        private void LoadLocations(List<M_Board_Location> Locations)
        {
            string Open_On_Map = "Open On Map", Open_Video_Link = "Open Video Link";
            string str = string.Empty;
            for (int i = 0; i < Locations.Count; i++)
            {
                str += "<div class='row m-b-25'>";
                str += "<div class='col-auto'>";
                str += "<i class='feather icon-map-pin bg-simple-c-green feed-icon'></i>";
                str += "</div>";
                str += "<div class='col'>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    Open_On_Map = "افتح علي الخريطة";
                    Open_Video_Link = "افتح رابط الاجتماع";

                    str += "<h6 class='m-b-5'>" + Locations[i].Board_Location_Name_Ar + "</h6>";
                    str += "<p class='text-muted'>" + Locations[i].Board_Location_Description_Ar + "</p>";
                }
                else
                {
                    str += "<h6 class='m-b-5'>" + Locations[i].Board_Location_Name_En + "</h6>";
                    str += "<p class='text-muted'>" + Locations[i].Board_Location_Description_En + "</p>";
                }
                if (Locations[i].Board_Location_OnMap != null && Locations[i].Board_Location_OnMap != string.Empty)
                    str += "<a href ='" + Locations[i].Board_Location_OnMap + "' target='_blank'><p class='text-muted'><i class='feather icon-map-pin m-r-10'></i>"+ Open_On_Map + "</p></a>";
                if (Locations[i].Board_Location_URLVideo != null && Locations[i].Board_Location_URLVideo != string.Empty)
                    str += "<a href ='" + Locations[i].Board_Location_URLVideo + "' target='_blank'><p class='text-muted'><i class='icofont icofont-youtube-play m-r-10'></i>"+ Open_Video_Link+"</p></a>";
                str += "</div>";
                str += "</div>";
            }
            txtLocations.Text = str;
        }

        private void LoadMeetings(int BoardId)
        {

            int statusid = 1;
            List<M_Meeting> ListMeetings = db.M_Meeting.Where(x => x.Board_Id == BoardId).ToList();
            string str = string.Empty;
            for (int i = 0; i < ListMeetings.Count; i++)
            {
                str += "<tr>";
                str += "<td class='txt-primary'>Expand</td>";
                str += "<td> <a href= '../../../../Pages/Eminutes/Meeting.aspx?MeetingID=" + ListMeetings[i].Meeting_Id + "&BoardId=" + ListMeetings[i].Board_Id + "' style='color:#00c3da;'> <i class='icofont icofont-eye-alt h6'></i>&nbsp;&nbsp;&nbsp; </a>";
                str += "<a  href='#' data-href= 'MeetingManagment/DeteteMeeting.ashx?MeetingId=" + ListMeetings[i].Meeting_Id + "&BoardId=" + ListMeetings[i].Board_Id + "' style='color:red;' data-toggle='modal' data-target='#confirm-delete'> <i class='icofont icofont-ui-delete h6'> </i></a>";
                str += "<a  href= 'MeetingManagment/UpdateMeetingStats.ashx?MeetingId=" + ListMeetings[i].Meeting_Id + "&BoardId=" + ListMeetings[i].Board_Id + "' style='color:red;' > <i class='icofont icofont-recycle text-primary h6'> </i></a>";
                str += "<a  href= 'Reports/R_Minutes.aspx?Meeting_Id=" + ListMeetings[i].Meeting_Id + "' style='color:#00c3da;' > <i class='icofont icofont-law-document text-primary h6'> </i></a></td>";

                try { statusid = (int)ListMeetings[i].Meeting_Status; } catch { }
                M_Meeting_Status status = db.M_Meeting_Status.FirstOrDefault(x => x.Meeting_Status_Id == statusid);
                if (status != null)
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        if (status.Meeting_Status_Id == 1)
                            str += "<td><label class='label label-success'>" + status.Meeting_Status__Name_Ar + "</label></td>";
                        else
                            str += "<td> <label class='label label-danger'>" + status.Meeting_Status__Name_Ar + "</label></td>";
                    }
                    else
                    {
                        if (status.Meeting_Status_Id == 1)
                            str += "<td><label class='label label-success'>" + status.Meeting_Status__Name_En + "</label></td>";
                        else
                            str += "<td> <label class='label label-danger'>" + status.Meeting_Status__Name_En + "</label></td>";
                    }

                else if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<td> <label class='label label-info'>غير معروف </label></td>";
                else
                    str += "<td> <label class='label label-info'>Unknow </label></td>";

                str += "<td>" + ListMeetings[i].Meeting_Name_En + "</td>";
                str += "<td>" + ListMeetings[i].Meeting_Name_Ar + "</td>";
                DateTime date = DateTime.Parse(ListMeetings[i].Meeting_Date.ToString());
                str += "<td>" + date.ToShortDateString() + "</td>";
                str += "<td>" + ListMeetings[i].Meeting_Time.ToString() + "</td>";
                str += "</tr>";
            }
            txtMeetings.Text = str;
        }

        private bool loadDownloadAttachment(int Board_ID)
        {
            try
            {
                string yourHTMLstring = "";
                List<M_B_Attachments> M_Attachment = new List<M_B_Attachments>();
                M_Attachment = db.M_B_Attachments.Where(x => x.Board_Id == Board_ID).ToList<M_B_Attachments>();
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
                getImageExtention = "<span class='jFiler-icon-file f-file f-image'><i class='icofont icofont-file-pdf' style='font-size: x-large;'></i></span>";
            else if (fileExtention == ".png" || fileExtention == ".jpeg" || fileExtention == ".jpg" || fileExtention == ".jpe")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(18, 132, 161);'><i class='icofont icofont-ui-image' style='font-size: x-large;'></i></span>";
            else if (fileExtention == ".doc" || fileExtention == ".docx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-video'><i class='icofont icofont-file-word' style='font-size: x-large;'></i></span>";
            else if (fileExtention == ".ppt" || fileExtention == ".pptx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: #ffc107;'><i class='icofont icofont-file-powerpoint' style='font-size: x-large;'></i></span>";
            else if (fileExtention == ".xls" || fileExtention == ".xlsx")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(33, 200, 114);'><i class='icofont icofont-file-excel' style='font-size: x-large;'></i></span>";
            else if (fileExtention == ".txt")
                getImageExtention = "<span class='jFiler-icon-file f-file f-image' style='background-color: rgb(191, 47, 139);'><i class='icofont icofont-file-text' style='font-size: x-large;'></i></span>";
            else
                getImageExtention = "<span class='jFiler-icon-file f-file f-file-ext-doc' style='background-color: rgb(56, 78, 83);'  style='font-size: x-large;'>" + fileExtention + "</span>";

            return getImageExtention;
        }

        public static string Truncate(string value, int maxLength)
        {
            if (string.IsNullOrEmpty(value)) return value;
            return value.Length <= maxLength ? value : value.Substring(0, maxLength);
        }

    }
}