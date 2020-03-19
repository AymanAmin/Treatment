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
            
            List<Structure> structList = db.Structures.ToList();
            ddlFiller.dropDDL(ddlParent, "Structure_Id", "Structure_Name", structList, "Select Parent");
            if (structList.Count > 0)
                ddlParent.SelectedIndex = 1;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            insert_tree_record(Name.Text , int.Parse(ddlParent.SelectedValue.ToString()));
        }

        private bool insert_tree_record(string name , int parent_id)
        {
            try
            {
                Structure stru = db.Structures.Create();
                stru.Structure_Name = name;
                stru.Structure_Parent = parent_id;
                db.Structures.Add(stru);
                db.SaveChanges();

            }
            catch { return false; }
            return true;
        }
    }
}