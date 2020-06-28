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
    public partial class Home : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        bool Can_Edit = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            List<M_Board> list_board = new List<M_Board>();
            List<M_Board_Member> ListBoardMember = db.M_Board_Member.Where(x => x.Employee_Id == SessionWrapper.LoggedUser.Employee_Id).ToList();
            for (int i = 0; i < ListBoardMember.Count; i++)
            {
                list_board.Add(ListBoardMember[i].M_Board);
            }
            LoadBoad(list_board);
        }
       
        private void LoadBoad(List<M_Board> list_board)
        {
            string str = string.Empty;
            string color = string.Empty;
            for (int i = 0; i < list_board.Count; i++)
            {
                Can_Edit = GetEditPermission(list_board[i]);
                if (list_board[i].Board_Type_Id == 1)
                    color = "info";
                else
                    color = "warning";

                DateTime date = DateTime.Parse(list_board[i].Create_Date.ToString());
                str += "<div class='col-sm-6'>" +
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
                List<M_Board_Member> List_board_member = list_board[i].M_Board_Member.Where(x => x.Member_Type_Id != 4).ToList();
                for (int k = 0; k < List_board_member.Count; k++)
                {
                    str += " <a href = '#'>" +
                           "<img class='img-fluid img-radius' data-toggle='tooltip' data-placement='top' title='" + List_board_member[k].Employee.Employee_Name_En + "' src='../../../../media/Profile/" + List_board_member[k].Employee.Employee_Profile + "' alt=''/></a>";
                    //str += "<a href = '#'><i class='icofont icofont-plus'></i></a>";
                }

                str += "</div>";
                str += "<div class='task-board'>";
                if (Can_Edit)
                {
                    str += "<div class='dropdown-secondary dropdown'>";
                    str += "<a href='BoardManagment/BoardMember.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#6a5590;'> Edit Member </a>&nbsp;";
                    str += "</div>";
                    str += "<div class='dropdown-secondary dropdown'>";
                    str += "<a href='MeetingManagment/MeetingInfo.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#583f82;'> Add Meeting </a>&nbsp;";
                    str += "</div>";
                    str += "<div class='dropdown-secondary dropdown'>";
                    str += "<a href='BoardManagment/BoardInfo.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#452a74;'> Edit Board  </a>&nbsp;";
                    str += "</div>";
                }
                str += "</div>";
                str += "</div>";

                str += "</div>";
                str += "</div>";
            }
            txtBoard.Text = str;
        }

        public bool GetEditPermission(M_Board board)
        {
            try
            {
                M_Board_Member member = board.M_Board_Member.Where(x => x.Employee_Id == SessionWrapper.LoggedUser.Employee_Id).FirstOrDefault();
                if (member.Member_Type_Id == 1 || member.Member_Type_Id == 2)
                    return true;
                else
                    return false;
            }
            catch { return false; }
        }
    }
}