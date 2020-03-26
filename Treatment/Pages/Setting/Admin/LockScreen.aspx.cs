using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treatment.Pages.Setting.Admin
{
    public partial class LockScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IsLocked"] = true;
        }

        protected void Unlock_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text.Equals("123"))
            {
                Session["IsLocked"] = false;
                Response.Redirect("~/");
            }
        }
    }
}