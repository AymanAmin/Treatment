using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Website.Classes;
using Treatment.Entity;

namespace Treatment.Pages.Treatment
{
    public partial class Tree : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int parent = 0;
            bool IsJob = false;
            bool Is_Manager = false;

            int.TryParse(Parent.SelectedValue.ToString(), out parent);
             IsJob = IsJobTitle.Checked;
             Is_Manager = IsManager.Checked;

            bool result = insert_tree_record(Name_Ar.Text, Name_En.Text, parent, IsJob, Is_Manager);
            if (result)
            {
                ASPxTreeList1.DataBind();
                Parent.DataBind();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The new Structure was Sucessfully saved in system ! ');", true);

            }
        }

        private bool insert_tree_record(string Name_Ar,string Name_En, int parent_id,bool IsJob,bool IsManager)
        {
            try
            {
                Structure stru = db.Structures.Create();
                stru.Structure_Name_Ar = Name_Ar;
                stru.Structure_Name_En = Name_En;
                stru.Structure_Parent = parent_id;
                stru.Is_Job_Title = IsJob;
                stru.Is_Manager = IsManager;
                db.Structures.Add(stru);
                db.SaveChanges();
            }
            catch { return false; }
            return true;
        }

        protected void ASPxTreeList1_NodeDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxTreeList1.DataBind();
            Parent.DataBind();
            TreeDataSourceView.DataBind();
        }

        protected void ASPxTreeList1_NodeDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxTreeList1.DataBind();
            Parent.DataBind();
            TreeDataSourceView.DataBind();
        }
    }
}