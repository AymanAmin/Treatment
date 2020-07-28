using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes.BoardManagment
{
    public partial class BoardApprove : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        int BoardId = 0, TypeProcess=0;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Setting/Auth/Login.aspx");

            if (Request["BoardId"] != null && Request["TypeProcess"] != null)
            {
                BoardId = int.Parse(Request["BoardId"].ToString());
                TypeProcess = int.Parse(Request["TypeProcess"].ToString());
                bool res = UpdateBoardStatus(BoardId, TypeProcess);
                if(res)
                    Response.Redirect("~/Pages/Eminutes/BoardManagment/BoardApprove.aspx");
            }
            /*if (!IsPostBack)
            {
            }*/
            db.Configuration.LazyLoadingEnabled = true;
            List<M_Board> ListBoards = db.M_Board.OrderByDescending(x => x.Create_Date).ToList();
            LoadBoard(ListBoards);
        }

        public bool UpdateBoardStatus(int board_id,int type_process)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                M_Board board = db.M_Board.Find(board_id);
                if (board == null)
                    return false;

                board.Board_Status_Id = type_process;
                db.Entry(board).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                return true;


                /*Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(board, logFileModule.settings);
                logFileModule.logfile(10, "تغير حالة المجلس/اللجنة", "Update the board", LogData);
            }catch (Exception er) {

                /*Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(er, logFileModule.settings);
                logFileModule.logfile(10, "حدث خطاء في النظام", "An Exception has occurred", LogData);

                return false; }
        }

        private void LoadBoard(List<M_Board> ListBoards)
        {

            string str = string.Empty;
            for (int i = 0; i < ListBoards.Count; i++)
            {
                string TempstrStatus = "", NewStatus = "disabled", PendingStatus = "disabled", AvailableStatus = "disabled", CloseStatus = "disabled", DeletedStatus = "disabled";

                str += "<tr>";
                str += "<td class='txt-primary'>"+ FieldNames.getFieldName("BoardApprove-Expand", "Expand") + "</td>";

                string StatusName = ListBoards[i].M_Board_Status.Board_Status_Name_En;
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    StatusName = ListBoards[i].M_Board_Status.Board_Status_Name_Ar;

                if (ListBoards[i].Board_Status_Id == 1)// New
                { TempstrStatus += "<td> <label class='label label-success'>" + StatusName + "</label></td>"; PendingStatus = string.Empty; AvailableStatus = string.Empty; DeletedStatus = string.Empty; }
                else if (ListBoards[i].Board_Status_Id == 2) // Pending
                { TempstrStatus += "<td> <label class='label' style='background-color:#452a74;'>" + StatusName + "</label></td>"; AvailableStatus = string.Empty; DeletedStatus = string.Empty; }
                else if (ListBoards[i].Board_Status_Id == 3) // Available
                { TempstrStatus += "<td> <label class='label label-info'>" + StatusName + "</label></td>"; CloseStatus = string.Empty; DeletedStatus = string.Empty; }
                else if (ListBoards[i].Board_Status_Id == 4) // Closed
                { TempstrStatus += "<td> <label class='label' style='background-color:black;'>" + StatusName + "</label></td>"; AvailableStatus = string.Empty; DeletedStatus = string.Empty; }
                else // Deleted
                { TempstrStatus += "<td> <label class='label label-danger'>" + StatusName + "</label></td>"; AvailableStatus = string.Empty; CloseStatus = string.Empty; }

                str += "<td class='text-left'> ";
                if (NewStatus == string.Empty || true) str += "<a href= '../../../../Pages/Eminutes/BoardManagment/BoardApprove.aspx?BoardId=" + ListBoards[i].Board_Id + "&TypeProcess=1' class='" + NewStatus + "' style='color:green;font-size: 20px;'> <i class='icofont icofont-newspaper'></i>&nbsp;&nbsp; </a>";
                if (PendingStatus == string.Empty || true) str += "<a href= '../../../../Pages/Eminutes/BoardManagment/BoardApprove.aspx?BoardId=" + ListBoards[i].Board_Id + "&TypeProcess=2' class='text-warning " + PendingStatus + "' style='font-size: 20px;'> <i class='icofont icofont-wall-clock'> </i>&nbsp;&nbsp; </a>";
                if (AvailableStatus == string.Empty || true) str += "<a href= '../../../../Pages/Eminutes/BoardManagment/BoardApprove.aspx?BoardId=" + ListBoards[i].Board_Id + "&TypeProcess=3' class='" + AvailableStatus + "' style='color:#00c3da;font-size: 20px;'> <i class='icofont icofont-contrast'> </i>&nbsp;&nbsp; </a>";
                if (CloseStatus == string.Empty || true) str += "<a href= '../../../../Pages/Eminutes/BoardManagment/BoardApprove.aspx?BoardId=" + ListBoards[i].Board_Id + "&TypeProcess=4' class='" + CloseStatus + "' style='color:black;font-size: 20px;'> <i class='icofont icofont-ui-close'> </i> &nbsp;&nbsp; </a>";
                if (DeletedStatus == string.Empty || true) str += "<a href= '../../../../Pages/Eminutes/BoardManagment/BoardApprove.aspx?BoardId=" + ListBoards[i].Board_Id + "&TypeProcess=5' class='" + DeletedStatus + "' style='color:red;font-size: 20px;'> <i class='icofont icofont-ui-delete'> </i></a>";
                str += "</td> ";

                // Add Status after action

                str += TempstrStatus;
                

                str += "<td> <a href= '../../../../Pages/Eminutes/Board.aspx?BoardId=" + ListBoards[i].Board_Id + "'>" + ListBoards[i].Board_Name_Ar + "</a></td>";
                str += "<td> <a href= '../../../../Pages/Eminutes/Board.aspx?BoardId=" + ListBoards[i].Board_Id + "'>" + ListBoards[i].Board_Name_En + "</a></td>";
                str += "<td>" + ListBoards[i].Board_Description_Ar + "</td>";
                str += "<td>" + ListBoards[i].Board_Description_En + "</td>";
                str += "</tr>";
            }
            txtBoardsTable.Text = str;
        }
    }
}