using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Treatment.Classes;
using Website.Classes;
using System.Globalization;

namespace Treatment.Pages.Eminutes.BoardManagment
{
    public partial class BoardInfo : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        bool IsUpdate = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            int board_id = 0;
            M_Board boardinfo = null;
            if (Request["BoardId"] != null)
            {
                board_id = int.Parse(Request["BoardId"].ToString());
                boardinfo = db.M_Board.FirstOrDefault(x => x.Board_Id == board_id);
                if (boardinfo != null)
                {
                    Save.Text = "Update";
                    IsUpdate = true;
                }
                else
                    Save.Text = "Save";
            }

            if (!IsPostBack)
            {
                fillDropDown();
                if (boardinfo != null)
                    LoadInfo(boardinfo);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (IsUpdate)
               update();
            else
            {
                string str = string.Empty;
                try
                {
                    // Create Board info
                    M_Board board = db.M_Board.Create();

                    board.Board_Name_Ar = txtArabicName.Text;
                    board.Board_Name_En = txtEnglishName.Text;

                    board.Board_Description_Ar = txtArabicDescription.Text;
                    board.Board_Description_En = txtEnglishDescription.Text;

                    board.Board_Type_Id = int.Parse(txtTypeofBoard.SelectedValue.ToString());
                    board.Board_Status = int.Parse(txtStatusofBoard.SelectedValue.ToString());
                    board.Board_Classification_Id = int.Parse(txtClassification.SelectedValue.ToString());
                    board.Parent = int.Parse(txtParent.SelectedValue.ToString());

                    board.Create_Date = DateTime.Now;

                    if (txtTypeofBoard.SelectedValue == "2" && (txtStartDate.Value.ToString() == "" || txtStartDate.Value.ToString() == ""))
                    {
                        LtrMessage.Text = "<div class='alert alert-warning' role='alert'>Please Select start date & end date...</div>";
                        return;
                    }
                    else if ((txtTypeofBoard.SelectedValue == "2"))
                    {
                        board.Start_Date = DateTime.Parse(txtStartDate.Value.ToString());
                        board.End_Date = DateTime.Parse(txtEndDate.Value.ToString());
                    }

                    db.M_Board.Add(board);
                    db.SaveChanges();

                    clear();
                }
                catch { LtrMessage.Text = "<div class='alert alert-danger' role='alert'>System Error...</div>"; }
            }
        }

        private bool update()
        {
            int board_id = int.Parse(Request["BoardId"].ToString());
            string str = string.Empty;
            try
            {
                // Create Board info
                M_Board board = db.M_Board.Find(board_id);

                board.Board_Name_Ar = txtArabicName.Text;
                board.Board_Name_En = txtEnglishName.Text;

                board.Board_Description_Ar = txtArabicDescription.Text;
                board.Board_Description_En = txtEnglishDescription.Text;

                board.Board_Type_Id = int.Parse(txtTypeofBoard.SelectedValue.ToString());
                board.Board_Status = int.Parse(txtStatusofBoard.SelectedValue.ToString());
                board.Board_Classification_Id = int.Parse(txtClassification.SelectedValue.ToString());
                board.Parent = int.Parse(txtParent.SelectedValue.ToString());

                board.Create_Date = DateTime.Now;

                if (txtTypeofBoard.SelectedValue == "1")
                {
                    board.Start_Date = null;
                    board.End_Date = null;
                }
                else if ((txtStartDate.Value.ToString() == "" || txtEndDate.Value.ToString() == ""))
                {
                    LtrMessage.Text = "<div class='alert alert-warning' role='alert'>Please Select start date & end date...</div>";
                    return false;
                }
                else
                {
                    board.Start_Date = DateTime.Parse(txtStartDate.Value.ToString());
                    board.End_Date = DateTime.Parse(txtEndDate.Value.ToString());
                }

                db.Entry(board).State = System.Data.EntityState.Modified;
                db.SaveChanges();

            }
            catch { LtrMessage.Text = "<div class='alert alert-danger' role='alert'>System Error...</div>"; return false; }
            LtrMessage.Text = "<div class='alert alert-success' role='alert'>Board update successfully..</div>";
            return true;
        }

        private void fillDropDown()
        {
            List<M_Board_Type> ListBoardType = db.M_Board_Type.ToList();
            ddlFiller.dropDDL(txtTypeofBoard, "Board_Type_Id", "Board_Type_Name_En", ListBoardType, "Select Type");

           /* List<M_Board_Status> ListBoardStatus = db.M_Board_Status.ToList();
            ddlFiller.dropDDL(txtStatusofBoard, "Board_Status_Id", "Board_Status_Name_En", ListBoardStatus, "Select Status");*/

            List<M_Board_Classification> ListBoardClassification = db.M_Board_Classification.ToList();
            ddlFiller.dropDDL(txtClassification, "Board_Classification_Id", "Board_Classification_Name_En", ListBoardClassification, "Select Classification");

            List<M_Board> ListBoard = db.M_Board.ToList();
            ddlFiller.dropDDL(txtParent, "Board_Id", "Board_Name_En", ListBoard, "Select Parent");
        }

        private void clear()
        {
            txtArabicName.Text = "";
            txtEnglishName.Text = "";
            txtArabicDescription.Text = "";
            txtEnglishDescription.Text = "";
            txtStatusofBoard.SelectedValue = "0";
            txtTypeofBoard.SelectedValue = "0";
            txtClassification.SelectedValue = "0";
            txtParent.SelectedValue = "0";
            txtStartDate.Value = "";
            txtEndDate.Value = "";

            LtrMessage.Text = "<div class='alert alert-success' role='alert'>Board saved successfully..</div>";
        }

        private void LoadInfo(M_Board boardinfo)
        {
            try
            {
                txtArabicName.Text = boardinfo.Board_Name_Ar;
                txtEnglishName.Text = boardinfo.Board_Name_En;
                txtArabicDescription.Text = boardinfo.Board_Description_Ar;
                txtEnglishDescription.Text = boardinfo.Board_Description_En;
                txtStatusofBoard.SelectedValue = boardinfo.Board_Status.ToString();
                txtTypeofBoard.SelectedValue = boardinfo.Board_Type_Id.ToString();
                txtClassification.SelectedValue = boardinfo.Board_Classification_Id.ToString();
                txtParent.SelectedValue = boardinfo.Parent.ToString();

                try
                {
                    DateTime startDate = DateTime.Parse(boardinfo.Start_Date.ToString());
                    DateTime endDate = DateTime.Parse(boardinfo.End_Date.ToString());

                    txtStartDate.Value = string.Format("{0:yyyy-MM-dd}", startDate);
                    txtEndDate.Value = string.Format("{0:yyyy-MM-dd}", endDate);

                }catch { }
            }
            catch { }
        }
    }
}