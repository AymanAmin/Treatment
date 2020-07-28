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
            Classes.EditBoardPermission EBP = new Classes.EditBoardPermission();
            txtBoard.Text = EBP.LoadBoad(list_board,"6");
        }

    }
}