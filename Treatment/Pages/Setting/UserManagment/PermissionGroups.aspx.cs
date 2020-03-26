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
    public partial class PermissionGroups : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                FillGroupPermission();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            bool result = AddGroup(txtGroup_Name.Text, txtGroup_Name_En.Text);
            if (result)
            {
                clearform();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Item was Sucessfully saved in system ! ');", true);
                FillGroupPermission();
                //Response.Redirect("~/Pages/Setting/UserManagment/PermissionGroups.aspx");
            }
        }

        void clearform ()
        {
            txtGroup_Name.Text = string.Empty;
            txtGroup_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                Group group = db.Groups.Create();
                group.Group_Name_Ar = arabic_name;
                group.Group_Name_En = english_name;
                db.Groups.Add(group);
                db.SaveChanges();
                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }

        private void FillGroupPermission()
        {
            List<Group> GroupList = db.Groups.ToList();
            ddlFiller.dropDDL(ddlGroups, "Group_Id", "Group_Name_Ar", GroupList, "Select Group");
            //if (GroupList.Count > 0)
                //ddlGroups.SelectedIndex = 1;
        }

        protected void ddlGroups_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Group_Id = int.Parse(ddlGroups.SelectedValue.ToString());
                PermissionGroupGridView.Selection.UnselectAll();
                List<Permission_Group> Group_Permission_List = db.Permission_Group.Where(x => x.Group_Id == Group_Id).ToList();
                for(int i = 0; i < Group_Permission_List.Count; i++)
                {
                    PermissionGroupGridView.Selection.SelectRowByKey(Group_Permission_List[i].Permission_Id);
                }  
            }
            catch { }

        }

        protected void SaveChanges_Click(object sender, EventArgs e)
        {
            try
            {
                int Group_Id = int.Parse(ddlGroups.SelectedValue.ToString());
                var Permision_Ids = PermissionGroupGridView.GetSelectedFieldValues("Permission_Id");
                db.Database.ExecuteSqlCommand("Delete Permission_Group where Group_Id = " + Group_Id);
                for (int i = 0; i < Permision_Ids.Count; i++)
                {
                    Permission_Group per_group = db.Permission_Group.Create();
                    per_group.Group_Id = Group_Id;
                    per_group.Permission_Id = int.Parse(Permision_Ids[i].ToString());
                    db.Permission_Group.Add(per_group);
                }
                db.SaveChanges();
            }catch { }
        }
    }
}