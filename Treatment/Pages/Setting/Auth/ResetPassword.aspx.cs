﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Treatment.Entity;
using Website.Classes;

namespace Treatment.Pages.Setting.Auth
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        ECMSEntities db = new ECMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btRest_Click(object sender, EventArgs e)
        {
            bool restult =  rest_account(txtEmail.Text);
            if(!restult)
            {
                return;
            }
        }

        private bool rest_account(string email)
        {
            Employee emp = db.Employees.Where(x => x.Employee_Email == email).FirstOrDefault();
            if (emp != null)
            {
                string sever_name = Request.Url.Authority.ToString();
                SendEmail send = new SendEmail();
                bool result = send.ResetEmail(emp.Employee_Email, emp.Employee_Password, sever_name);
                if (result)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "show_model_sucess();", true);
                    txtEmail.Text = "";
                    return true;
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "show_model_error();", true);
                    return false;
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " show_model_notfound();", true);
                return false;
            }
        }
    }
}