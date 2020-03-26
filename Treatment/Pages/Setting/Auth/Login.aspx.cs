using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Classes;
using Treatment.Entity;

namespace Treatment.Pages.Setting.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
           bool result =  auth_Login(txtEmail.Text, txtPassword.Text);
            if (result)
                Response.Redirect("");
            else
                return;
       }

        private bool auth_Login(string username, string password)
        {

            return true;
        }
    }
}