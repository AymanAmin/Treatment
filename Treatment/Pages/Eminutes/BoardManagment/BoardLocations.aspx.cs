using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Eminutes.BoardManagment
{
    public partial class BoardLocations : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        bool IsUpdate = false;
        int board_id = 0;
        int Location_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillDropDown();
            }

            if (Request["BoardId"] != null)
            {
                board_id = int.Parse(Request["BoardId"].ToString());
                txtBoard.SelectedValue = board_id.ToString();
                txtBoard.Enabled = false;
                if (Request["LocationId"] != null)
                {
                    Location_id = int.Parse(Request["LocationId"].ToString());
                    Save.Text = "Update";
                    IsUpdate = true;
                }
            }

            if (!IsPostBack)
            {
                if (IsUpdate)
                    FillData(Location_id);
                LoadLocations();
            }
        }

        private void fillDropDown()
        {
            List<M_Board> ListBoard = db.M_Board.ToList();
            ddlFiller.dropDDL(txtBoard, "Board_Id", "Board_Name_En", ListBoard, "Select Board");
        }

        private void FillData(int locationid)
        {
            M_Board_Location Location = db.M_Board_Location.FirstOrDefault(x => x.Board_Location_Id == locationid);
            if (Location != null)
            {
                txtArabicName.Text = Location.Board_Location_Name_Ar;
                txtEnglishName.Text = Location.Board_Location_Name_En;
                txtMapLocation.Text = Location.Board_Location_OnMap;
                txtEnglishDescription.Text = Location.Board_Location_Description_En;
                txtArabicDescription.Text = Location.Board_Location_Description_Ar;
            }
            else
            {
                Save.Text = "Save";
                IsUpdate = true;
            }
        }

        private void LoadLocations()
        {
            int boardid = int.Parse(txtBoard.SelectedValue);
            List<M_Board_Location> ListLocations = db.M_Board_Location.Where(x => x.Board_Id == boardid).ToList();
            string str = string.Empty;
            for (int i = 0; i < ListLocations.Count; i++)
            {
                str += "<tr>";
                str += "<td class='txt-primary'>Expand</td>";
                str += "<td> <a href= '../../../../Pages/Eminutes/BoardManagment/BoardLocations.aspx?BoardId=" + ListLocations[i].Board_Id + "&LocationId=" + ListLocations[i].Board_Location_Id + "' style='color:#00c3da;'> <i class='icofont icofont-ui-edit'></i>&nbsp;&nbsp; </a>";
                str += "<a href= '../../../../Pages/Eminutes/BoardManagment/BoardLocations.aspx?BoardId=" + ListLocations[i].Board_Id + "&LocationId=" + ListLocations[i].Board_Location_Id + "' style='color:red;'> <i class='icofont icofont-ui-delete'> </i></a></td>";
                str += "<td>" + ListLocations[i].Board_Location_Name_Ar + "</td>";
                str += "<td>" + ListLocations[i].Board_Location_Name_En + "</td>";
                str += "<td>" + ListLocations[i].Board_Location_OnMap + "</td>";
                str += "<td>" + ListLocations[i].Board_Location_Description_Ar + "</td>";
                str += "<td>" + ListLocations[i].Board_Location_Description_En + "</td>";

                str += "</tr>";
            }
            txtLocations.Text = str;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (IsUpdate)
                UpdateLocation();
            else
            {
                try
                {
                    M_Board_Location locations = db.M_Board_Location.Create();
                    locations.Board_Id = int.Parse(txtBoard.SelectedValue);
                    locations.Board_Location_Name_Ar = txtArabicName.Text;
                    locations.Board_Location_Name_En = txtEnglishName.Text;
                    locations.Board_Location_Description_Ar = txtArabicDescription.Text;
                    locations.Board_Location_Description_En = txtEnglishDescription.Text;
                    locations.Board_Location_OnMap = txtMapLocation.Text;

                    db.M_Board_Location.Add(locations);
                    db.SaveChanges();
                    LtrMessage.Text = "<div class='alert alert-success' role='alert'>Location Added successfully..</div>";
                    LoadLocations();
                    Clear();
                }
                catch { LtrMessage.Text = "<div class='alert alert-danger' role='alert'>System Error...</div>"; }
            }
        }

        private void UpdateLocation()
        {
            try
            {
                M_Board_Location locations = db.M_Board_Location.FirstOrDefault(x => x.Board_Location_Id == Location_id);
                locations.Board_Location_Name_Ar = txtArabicName.Text;
                locations.Board_Location_Name_En = txtEnglishName.Text;
                locations.Board_Location_Description_Ar = txtArabicDescription.Text;
                locations.Board_Location_Description_En = txtEnglishDescription.Text;
                locations.Board_Location_OnMap = txtMapLocation.Text;

                db.Entry(locations).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                LtrMessage.Text = "<div class='alert alert-success' role='alert'>Location Updated successfully..</div>";
                LoadLocations();
            }
            catch { LtrMessage.Text = "<div class='alert alert-danger' role='alert'>System Error...</div>"; }
        }

        private void Clear()
        {
            txtArabicName.Text = string.Empty;
            txtEnglishName.Text = string.Empty;
            txtMapLocation.Text = string.Empty;
            txtEnglishDescription.Text = string.Empty;
            txtArabicDescription.Text = string.Empty;

        }
    }
}
