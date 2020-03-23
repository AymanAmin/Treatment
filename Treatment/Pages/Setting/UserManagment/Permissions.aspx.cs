using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Setting.UserManagment
{
    public partial class Permissions : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int ParentID = 0;

            if (MainMenu.Checked){ ParentID = 0; } else {try { ParentID = int.Parse(txtParent.Text); } catch { ParentID = 0; } }

            bool result = AddPermission(txtPermission_Name.Text, txtPermission_Name_En.Text, ParentID, txtUrl_Path.Text);
            if (result)
            {
                Response.Redirect("~/Pages/Setting/UserManagment/Permissions.aspx");
            }
        }

        private bool AddPermission(string arabic_name,string english_name, int parent_id , string url)
        {
            try
            { 
                Permission Per = db.Permissions.Create();
                Per.Permission_Name = arabic_name;
                Per.Permission_Name_En = english_name;
                Per.Parent = parent_id;
                Per.Url_Path = url;
                db.Permissions.Add(Per);
                db.SaveChanges();

                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }

       /* private void FillParent()
        {
            List<Permission> structList = db.Permissions.ToList();
            ddlFiller.dropDDL(txtParent, "Structure_Id", "Structure_Name", structList, "Select Parent");
            if (structList.Count > 0)
                ddlParent.SelectedIndex = 1;
        }*/
    }
}