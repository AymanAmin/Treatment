using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;

namespace Treatment.Pages.Eminutes
{
    public partial class Home : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBoad();
        }

        private void LoadBoad()
        {
            List<M_Board> list_board = db.M_Board.Where(x => x.Parent == 0).ToList();
            string str = string.Empty;
            string color = string.Empty;
            for (int i = 0; i < list_board.Count; i++)
            {
                if (list_board[i].Board_Type_Id == 1)
                    color = "info";
                else
                    color = "warning";

                DateTime date = DateTime.Parse(list_board[i].Create_Date.ToString());
                str += "<div class='col-sm-6'>" +
                    "<div class='card card-border-"+ color + "'>" +
                    "<div class='card-header'>" +
                        "<a href = '#' class='card-title'><strong>"+ list_board[i].Board_Name_En + "</strong> </a>" +
                        "<span class='label label-default f-right' style='background: linear-gradient(to right, #452a74, #fafafa)'>" + date.ToLongDateString() + "</span>" +
                    "</div>" +
                    "<div class='card-block'>" +
                        "<div class='row'>" +
                            "<div class='col-sm-12'>" +
                               "<p class='task-detail'>" + list_board[i].Board_Description_En + ".</p>" +
                                "<p class='task-due'><strong>Next Meeting : </strong><strong class='label label-info'>" + date + "</strong></p>" +
                           "</div>" +
                        "</div>" +
                    "</div>" +
                    "<div class='card-footer'>" +
                        "<div class='task-list-table'>" +
                            "<a href = '#!'> " +
                                "<img class='img-fluid img-radius' src='../../../../Theme/files/assets/images/avatar-1.jpg' alt='1'/></a>" +
                            "<a href = '#!'> " +
                                "<img class='img-fluid img-radius' src='../../../../Theme/files/assets/images/avatar-2.jpg' alt='1'/></a>" +
                            "<a href = '#!'><i class='icofont icofont-plus'></i></a>" +
                        "</div>" +
                        "<div class='task-board'>" +
                            "<div class='dropdown-secondary dropdown'>" +
                                "<button class='btn btn-primary btn-mini waves-effect waves-light' type='button' > Edit Member </button>&nbsp;" +
                            "</div>" +
                            "<div class='dropdown-secondary dropdown'>" +
                                "<button class='btn btn-primary btn-mini waves-effect waves-light' type='button' > Manage Meeting </button>&nbsp;" +
                            "</div>" +
                            "<div class='dropdown-secondary dropdown'>" +
                                "<button class='btn btn-primary btn-mini waves-effect waves-light' type='button' > Manage Board </button>&nbsp;" +
                            "</div>" +

                        "</div>" +
                   "</div>" +
                "</div>" +
            "</div>";
            }
            txtBoard.Text = str;
        }
    }
}