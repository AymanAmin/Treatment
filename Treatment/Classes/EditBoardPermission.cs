using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Classes
{
    public class EditBoardPermission
    {
        public bool GetEditPermission(M_Board board)
        {
            try
            {
                M_Board_Member member = board.M_Board_Member.Where(x => x.Employee_Id == SessionWrapper.LoggedUser.Employee_Id).FirstOrDefault();
                if ((member.Member_Type_Id == 1 || member.Member_Type_Id == 2) && (board.Board_Status_Id == 3))
                    return true;
                else
                    return false;
            }
            catch { return false; }
        }

        public string LoadBoad(List<M_Board> list_board,string width)
        {
            bool Can_Edit = false;
            string str = string.Empty;
            string color = string.Empty;
            for (int i = 0; i < list_board.Count; i++)
            {
                if (list_board[i].Board_Status_Id == 5)
                    continue;

                List<M_Meeting> List_M = list_board[i].M_Meeting.Where(x => x.Meeting_Date >= DateTime.Now).OrderByDescending(y => y.Meeting_Date).ToList();
                Can_Edit = GetEditPermission(list_board[i]);

                if (list_board[i].Board_Type_Id == 1)
                    color = "info";
                else
                    color = "warning";

                DateTime date = DateTime.Parse(list_board[i].Create_Date.ToString());
                str += "<div class='col-sm-" + width + "'>" +
                    "<div class='card card-border-" + color + "'>" +
                    "<div class='card-header'>";
                if(SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "' class='card-title'><strong>" + list_board[i].Board_Name_Ar + "</strong> (" + list_board[i].M_Board_Status.Board_Status_Name_Ar + ")</a>";
                else
                    str += "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "' class='card-title'><strong>" + list_board[i].Board_Name_En + "</strong> (" + list_board[i].M_Board_Status.Board_Status_Name_En + ")</a>";
                str += "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "'><span class='label label-" + color + " f-right' >" + date.ToLongDateString() + "</span></a>";
                str += "</div>" +
                    "<div class='card-block'>" +
                        "<div class='row'>" +
                            "<div class='col-sm-12'>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "'><p class='task-detail'>" + list_board[i].Board_Description_Ar + ".</p></a>";
                else
                    str += "<a href='Board.aspx?BoardId=" + list_board[i].Board_Id + "'><p class='task-detail'>" + list_board[i].Board_Description_En + ".</p></a>";
                if (List_M.Count > 0)
                {
                    DateTime nextmeeting_date = DateTime.Parse(List_M[0].Meeting_Date.ToString());
                    string nextmeeting = nextmeeting_date.ToShortDateString();
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<a href='Meeting.aspx?BoardId="+ List_M[0].Board_Id + "&MeetingID=" + List_M[0].Meeting_Id + "'><p class='task-due'><strong>Next Meeting : </strong> " + nextmeeting + "</p></a>";
                    else
                        str += "<a href='Meeting.aspx?BoardId=" + List_M[0].Board_Id + "&MeetingID=" + List_M[0].Meeting_Id + "'><p class='task-due'><strong>الاجتماع التالي : </strong> " + nextmeeting + "</p></a>";
                }

                           str += "</div>" +
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
                    string Edit_Member = "Edit Member", Add_Meeting = "Add Meeting",Edit_Board = "Edit Board";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        Edit_Member = "الأعضاء";
                        Add_Meeting = "إضافة اجتماع";
                        Edit_Board = "تعديل المجلس";
                    }
                        str += "<div class='dropdown-secondary dropdown'>";
                    str += "<a href='BoardManagment/BoardMember.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#6a5590;'> "+ Edit_Member + " </a>&nbsp;";
                    str += "</div>";
                    str += "<div class='dropdown-secondary dropdown'>";
                    str += "<a href='MeetingManagment/MeetingInfo.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#583f82;'> "+ Add_Meeting + " </a>&nbsp;";
                    str += "</div>";
                    str += "<div class='dropdown-secondary dropdown'>";
                    str += "<a href='BoardManagment/BoardInfo.aspx?BoardId=" + list_board[i].Board_Id + "' class='btn btn-primary btn-mini waves-effect waves-light' style='background-color:#452a74;'> "+ Edit_Board + "  </a>&nbsp;";
                    str += "</div>";
                }
                str += "</div>";
                str += "</div>";

                str += "</div>";
                str += "</div>";
            } 
           return str;
        }
    }
}