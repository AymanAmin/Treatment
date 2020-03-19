using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace Maintainance.Email
{
    public class SendEmail
    {
        public bool NewMail(string SendTo,string Message)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("ayman@softwarecornerit.com");
                mail.To.Add(SendTo);
                mail.Subject = "Notificaion Mail";
                mail.Body = Message;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("ayman@softwarecornerit.com", "12465005Flash");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);


            }
            catch(Exception er) { return false; }
            return true;
        }
    }
}