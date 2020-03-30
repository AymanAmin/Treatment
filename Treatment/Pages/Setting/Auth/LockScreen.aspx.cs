using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Website.Classes;

namespace Treatment.Pages.Setting.Auth
{ 
    public partial class LockScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionWrapper.IsLocked = true;
        }

        protected void Unlock_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text.Equals(SessionWrapper.LoggedUser.Employee_Password))
            {
                SessionWrapper.IsLocked = false;
                Response.Redirect("~/");
            }
        }
    }
}