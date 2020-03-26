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
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int parent = 0;

            int.TryParse(Parent.SelectedValue.ToString(), out parent);


            bool result = insert_tree_record(Name_Ar.Text, Name_En.Text, parent);
            if (result)
            {
                ASPxTreeList1.DataBind();
                Parent.DataBind();
            }
        }

        private bool insert_tree_record(string Name_Ar,string Name_En, int parent_id)
        {
            try
            {
                Structure stru = db.Structures.Create();
                stru.Structure_Name_Ar = Name_Ar;
                stru.Structure_Name_En = Name_En;
                stru.Structure_Parent = parent_id;
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