using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Maintainance.Email
{
    public partial class SendingEmail : System.Web.UI.Page
    {
        // username and password for gmail
        string Email = "DrrReEmail@gmail.com";
        string Password = "DrrReEmail123!@#";
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserEmail = Request["Email"];
            string Message = Request["Message"];
            string Subject = Request["Subject"];
            string Name = Request["Name"];

            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress(Email);
                mail.To.Add("info@drr-re.com");
                mail.Subject = "Mail From Drr_re WebSite";
                mail.Body = " The Email : " + UserEmail + "\n The Subject : " + Subject + "\n The Name : " + Name + "\n The Message : " + Message;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential(Email, Password);
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                Response.Redirect("http://drr-re.com/");
            }
            catch (Exception er) { Response.Redirect("http://drr-re.com/"); }
            Response.Redirect("http://drr-re.com/");
        }
    }
}