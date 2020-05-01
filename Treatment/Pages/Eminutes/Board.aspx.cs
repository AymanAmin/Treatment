using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes
{
    public partial class Board : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        M_Board Current_Board = new M_Board();

        /// <summary>
        /// Member type (1 = Supervisor , 2 = secretarial , 3 = Members)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            int board_id = 0;
            if (Request["BoardId"] == null)
                Response.Redirect("~/Pages/Eminutes/Home.aspx");

            board_id = int.Parse(Request["BoardId"].ToString());


            Current_Board = db.M_Board.FirstOrDefault(x => x.Board_Id == board_id);
            if (Current_Board != null)
            {
                // load current board info
                load_board_info(Current_Board);

                //Load sub boards
                List<M_Board> sub_board = db.M_Board.Where(x => x.Parent == board_id).ToList();
                if (sub_board.Count > 0)
                    LoadSubBoard(sub_board);

                // Load member 
                List<M_Board_Member> list_member = db.M_Board_Member.Where(x => x.Board_Id == board_id).ToList();
                if (list_member.Count > 0)
                    LoadMember(list_member);

                //Load Locations
                List<M_Board_Location> Locations = db.M_Board_Location.Where(x => x.Board_Id == board_id).ToList();
                if (Locations.Count > 0)
                    LoadLocations(Locations);
            }
            else
            {
                Response.Redirect("~/Pages/Admin/Eminutes/Home.aspx");
            }
        }

        private void load_board_info(M_Board Current_Board)
        {
            // Board Properties
            txtArabicName.Text = Current_Board.Board_Name_Ar;
            txtEnglishName.Text = Current_Board.Board_Name_En;
            txtCreatedDate.Text = Current_Board.Create_Date.ToString();
            txtType.Text = Current_Board.M_Board_Type.Board_Type_Name_En;
            txtClassification.Text = Current_Board.M_Board_Classification.Board_Classification_Name_En;

            //Edit Board info if you are supervisor 
            if (true)
            {
                txtEditBoard.Text = "<a href='../../../../Pages/Eminutes/BoardManagment/BoardInfo.aspx?BoardId=" + Current_Board.Board_Id + "' class='text-muted m-r-10 f-16'> <i class='icofont icofont-edit'></i></a>";
                txtMeetingMembers.Text = "<a href='../../../../Pages/Eminutes/BoardManagment/BoardMember.aspx?BoardId=" + Current_Board.Board_Id + "' class='text-muted m-r-10 f-16'> <i class='icofont icofont-edit'></i></a>";
                txtEditLocations.Text = "<a href='../../../../Pages/Eminutes/BoardManagment/BoardLocations.aspx?BoardId=" + Current_Board.Board_Id + "' class='text-muted m-r-10 f-16'> <i class='icofont icofont-edit'></i></a>";
            }
            else
            {
                txtEditBoard.Text = " <i class='icofont icofont-ui-note m-r-10'></i>";
                txtMeetingMembers.Text = " <i class='icofont icofont-ui-note m-r-10'></i>";
                txtEditLocations.Text = " <i class='icofont icofont-ui-note m-r-10'></i>";
            }
        }

        private void LoadSubBoard(List<M_Board> list_board)
        {
            string str = string.Empty;
            string color = string.Empty;
            for (int i = 0; i < list_board.Count; i++)
            {
                if (list_board[i].Board_Type_Id == 1)
                    color = "info";
                else
                    color = "warning";

                DateTime date = DateTime.Parse(list_board[i].Create_Date.ToString());
                str += "<div class='col-sm-12'>" +
                    "<div class='card card-border-" + color + "'>" +
                    "<div class='card-header'>" +
                        "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "' class='card-title'><strong>" + list_board[i].Board_Name_En + "</strong> </a>" +
                        "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "'><span class='label label-" + color + " f-right' >" + date.ToLongDateString() + "</span></a>" +
                    "</div>" +
                    "<div class='card-block'>" +
                        "<div class='row'>" +
                            "<div class='col-sm-12'>" +
                                "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "'><p class='task-detail'>" + list_board[i].Board_Description_En + ".</p></a>" +
                                "<a href='Meeting.aspx?MeetingId=1'><p class='task-due'><strong>Next Meeting : </strong> " + date + "</p></a>" +
                           "</div>" +
                        "</div>" +
                    "</div>" +
                    "<div class='card-footer'>" +
                    "<div class='task-list-table'>";
                // Add Member Profile Pic
                List<M_Board_Member> List_board_member = list_board[i].M_Board_Member.Where(x => x.Member_Type_Id != 3).ToList();
                for (int k = 0; k < List_board_member.Count; k++)
                {
                    str += " <a href = '#'>" +
                           "<img class='img-fluid img-radius' data-toggle='tooltip' data-placement='top' title='" + List_board_member[k].Employee.Employee_Name_En + "' src='../../../../media/Profile/" + List_board_member[k].Employee.Employee_Profile + "' alt=''/></a>";
                    //str += "<a href = '#'><i class='icofont icofont-plus'></i></a>";
                }

                str += "</div>" +
                        "<div class='task-board'>" +
                            "<div class='dropdown-secondary dropdown'>" +
                                "<a href='BoardManagment/BoardMember.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#6a5590;'> Edit Member </a>&nbsp;" +
                            "</div>" +
                            "<div class='dropdown-secondary dropdown'>" +
                                "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#583f82;'> Add Meeting </a>&nbsp;" +
                            "</div>" +
                            "<div class='dropdown-secondary dropdown'>" +
                                "<a href='BoardManagment/BoardInfo.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#452a74;'> Edit Board  </a>&nbsp;" +
                            "</div>" +

                        "</div>" +
                   "</div>" +
                "</div>" +
            "</div>";
            }
            SubBoard.Text = str;
        }

        private void LoadMember(List<M_Board_Member> list_member)
        {
            string supervisor = string.Empty;
            string secretarial = string.Empty;
            string members = string.Empty;

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
                str += "<h6>" + emp.Employee_Name_En + "</h6>";

                //check if there is structure in his information
                if (emp_struc.Count > 0)
                    str += "<p class='text-muted m-b-0'>" + emp_struc[0].Structure.Structure_Name_En + "</p>";
                else if (emp_struc.Count > 1)
                {
                    str += "<p class='text-muted m-b-0'>" + emp_struc[0].Structure.Structure_Name_En + "</p> , ";
                    str += " <p class='text-muted m-b-0'>" + emp_struc[1].Structure.Structure_Name_En + "</p>";
                }
                else
                    str += "<p class='text-muted m-b-0'> Unknow </p>";

                str += "</div>";
                str += "</a>";
                str += "</td>";
                str += "</tr>";

                if (list_member[i].Member_Type_Id == 1)
                    supervisor += str;
                else if (list_member[i].Member_Type_Id == 2)
                    secretarial += str;
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

            if (members == string.Empty)
            { Div_Members.Visible = false; Div_Members_Table.Visible = false; }
            else
                txtMembers.Text = members;

        }

        private void LoadLocations(List<M_Board_Location> Locations)
        {
            string str = string.Empty;
            for (int i = 0; i < Locations.Count; i++)
            {
                str += "<div class='row m-b-25'>";
                str += "<div class='col-auto p-r-0'>";
                str += "<i class='feather icon-map-pin bg-simple-c-green feed-icon'></i>";
                str += "</div>";
                str += "<div class='col'>";
                str += "<h6 class='m-b-5'>"+ Locations[i].Board_Location_Name_En + "</h6>";
                str += "<p class='text-muted m-b-0'>" + Locations[i].Board_Location_Description_En + "</p>";
                if (Locations[i].Board_Location_OnMap != null && Locations[i].Board_Location_OnMap != string.Empty)
                    str += "<a href ='" + Locations[i].Board_Location_OnMap + "' target='_blank'><p class='text-muted m-b-0'><i class='feather icon-map-pin m-r-10'></i>Open On Map</p></a>";
                str += "</div>";
                str += "</div>";
            }
            txtLocations.Text = str;
        }
    }
}