using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;
using Newtonsoft.Json;


namespace Treatment.Pages.Setting.UserManagment
{
    public partial class Permissions : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();

        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int ParentID = 0;

            if (MainMenu.Checked){ ParentID = 0; } else {try { ParentID = int.Parse(txtParent.Text); } catch { ParentID = 0; } }

            bool result = AddPermission(txtPermission_Name.Text, txtPermission_Name_En.Text, ParentID, txtUrl_Path.Text, txtClass_Icon.Text);
            if (result)
            {
                clearform();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The new permission was Sucessfully saved in system ! ');", true);
            }
        }

        void clearform()
        {
            txtPermission_Name.Text = string.Empty;
            txtPermission_Name_En.Text = string.Empty;
            //txtParent.SelectedIndex = 1;
            txtClass_Icon.Text = string.Empty;
            txtUrl_Path.Text = string.Empty;
            MainMenu.Checked = false;
        }

        private bool AddPermission(string arabic_name,string english_name, int parent_id , string url,string icon)
        {
            try
            {
                Permission Per = db.Permissions.Create();
                Per.Permission_Name_Ar = arabic_name;
                Per.Permission_Name_En = english_name;
                Per.Parent = parent_id;
                Per.Url_Path = url;
                Per.Permission_Icon = icon;
                db.Permissions.Add(Per);
                db.SaveChanges();

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Per, logFileModule.settings);
                logFileModule.logfile(10, "إضافة صلاحية جديدة", "", LogData);

                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }
        
    }
}