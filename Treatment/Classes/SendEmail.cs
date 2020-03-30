using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace Website.Classes
{ 
    public class SendEmail
    {
        string System_email = "ECMS.REU@gmail.com";
        string System_password = "admin123!@#";
        string System_Name = "ECMS System";

        public bool NewMail(string SendTo, string Message, string Subject)
        {
            try
            {
                bool res = IsValidEmail(SendTo);
                if (!res)
                    return false;

                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress(System_email, System_Name);
                mail.To.Add(SendTo);
                mail.Subject = Subject;
                mail.Body = Message;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential(System_email, System_password);
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);


            }
            catch (Exception er) { return false; }
            return true;
        }

        public bool ResetEmail(string SendTo, string NewPassword, string server_name)
        {
            bool res = IsValidEmail(SendTo);
            if (!res)
                return false;

            string restEmail_Message = string.Empty;
            restEmail_Message += "<head>";
            restEmail_Message += "<title> Rest Email</title>";
            restEmail_Message += "<meta content = 'text/html; charset=utf-8' http-equiv='Content-Type'> ";
            restEmail_Message += "<meta content = 'width=device-width' name='viewport'> ";
            restEmail_Message += "<style type = 'text/css'> ";
            restEmail_Message += "@font-face { ";
            restEmail_Message += "font -family: &#x27;Postmates Std&#x27;;";
            restEmail_Message += "font -weight: 600; ";
            restEmail_Message += "font -style: normal; ";
            restEmail_Message += "src: local(&#x27;Postmates Std Bold&#x27;), url(https://s3-us-west-1.amazonaws.com/buyer-static.postmates.com/assets/email/postmates-std-bold.woff) format(&#x27;woff&#x27;);";
            restEmail_Message += "}";

            restEmail_Message += " @font-face {";
            restEmail_Message += "font-family: &#x27;Postmates Std&#x27;;";
            restEmail_Message += "font-weight: 500;";
            restEmail_Message += "font-style: normal;";
            restEmail_Message += "src: local(&#x27;Postmates Std Medium&#x27;), url(https://s3-us-west-1.amazonaws.com/buyer-static.postmates.com/assets/email/postmates-std-medium.woff) format(&#x27;woff&#x27;);";
            restEmail_Message += "}";

            restEmail_Message += "@font-face {";
            restEmail_Message += "font-family: &#x27;Postmates Std&#x27;;";
            restEmail_Message += "font-weight: 400;";
            restEmail_Message += "font-style: normal;";
            restEmail_Message += "src: local(&#x27;Postmates Std Regular&#x27;), url(https://s3-us-west-1.amazonaws.com/buyer-static.postmates.com/assets/email/postmates-std-regular.woff) format(&#x27;woff&#x27;);";
            restEmail_Message += "}";
            restEmail_Message += "</style>";
            restEmail_Message += "<style media = 'screen and (max-width: 680px)'> ";
            restEmail_Message += "@media screen and(max-width: 680px)";
            restEmail_Message += "{";
            restEmail_Message += ".page-center {";
            restEmail_Message += "padding-left: 0 !important;";
            restEmail_Message += "padding-right: 0 !important;";
            restEmail_Message += "}";

            restEmail_Message += ".footer-center {";
            restEmail_Message += "padding-left: 20px !important;";
            restEmail_Message += "padding-right: 20px !important;";
            restEmail_Message += "}";
            restEmail_Message += "}";
            restEmail_Message += "</style>";
            restEmail_Message += "</head>";
            restEmail_Message += "<body style = 'background-color: #f4f4f5;'> ";
            restEmail_Message += "<table cellpadding='0' cellspacing='0' style='width: 100%; height: 100%; background-color: #f4f4f5; text-align: center;'>";
            restEmail_Message += "<tbody><tr>";
            restEmail_Message += "<td style = 'text-align: center;'> ";
            restEmail_Message += "<table align='center' cellpadding='0' cellspacing='0' id='body' style='background-color: #fff; width: 100%; max-width: 680px; height: 100%;'>";
            restEmail_Message += "<tbody><tr>";
            restEmail_Message += "<td>";
            restEmail_Message += "<table align = 'center' cellpadding='0' cellspacing='0' class='page-center' style='text-align: left; padding-bottom: 88px; width: 100%; padding-left: 120px; padding-right: 120px;'>";
            restEmail_Message += "<tbody><tr>";
            restEmail_Message += "<td style = 'padding-top: 24px;'> ";
            restEmail_Message += "<img src='http://www.home.riyadh.edu.sa/rau/wp-content/uploads/2018/02/reu-new-logo-e1518419362430.png' style='width: 56px;'>";
            restEmail_Message += "</td>";
            restEmail_Message += "</tr>";
            restEmail_Message += "<tr>";
            restEmail_Message += "<td colspan = '2' style='padding-top: 72px; -ms-text-size-adjust: 100%; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: 100%; color: #000000; font-family: 'Postmates Std', 'Helvetica', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 48px; font-smoothing: always; font-style: normal; font-weight: 600; letter-spacing: -2.6px; line-height: 52px; mso-line-height-rule: exactly; text-decoration: none;'>Reset your password</td>";
            restEmail_Message += "</tr>";
            restEmail_Message += "<tr>";
            restEmail_Message += "<td style = 'padding-top: 48px; padding-bottom: 48px;'> ";
            restEmail_Message += "<table cellpadding='0' cellspacing='0' style='width: 100%'>";
            restEmail_Message += "<tbody><tr>";
            restEmail_Message += "<td style = 'width: 100%; height: 1px; max-height: 1px; background-color: #d9dbe0; opacity: 0.81'></td> ";
            restEmail_Message += "</tr> ";
            restEmail_Message += "</tbody></table> ";
            restEmail_Message += "</td> ";
            restEmail_Message += "</tr> ";
            restEmail_Message += "<tr> ";
            restEmail_Message += "<td style='-ms-text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: 100%; color: #9095a2; font-family: 'Postmates Std', 'Helvetica', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 16px; font-smoothing: always; font-style: normal; font-weight: 400; letter-spacing: -0.18px; line-height: 24px; mso-line-height-rule: exactly; text-decoration: none; vertical-align: top; width: 100%;'>";
            restEmail_Message += " You're receiving this e-mail because you requested a password reset for your ECMS System account.";
            restEmail_Message += "</td>";
            restEmail_Message += "</tr>";
            restEmail_Message += "<tr>";
            restEmail_Message += "<td style = 'padding-top: 24px; -ms-text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: 100%; color: #9095a2; font-family: 'Postmates Std', 'Helvetica', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 16px; font-smoothing: always; font-style: normal; font-weight: 400; letter-spacing: -0.18px; line-height: 24px; mso-line-height-rule: exactly; text-decoration: none; vertical-align: top; width: 100%;'>";
            restEmail_Message += "Your old password is :  <strong>"+NewPassword+"</strong>. Please Change this password as soon as possible.";
            restEmail_Message += "</td>";
            restEmail_Message += "</tr>";
            restEmail_Message += "<tr>";
            restEmail_Message += "<td>";
            restEmail_Message += "<a href='"+server_name+ "/Pages/Setting/Auth/Login.aspx' style='margin-top: 36px; -ms-text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: 100%; color: #ffffff; font-family: 'Postmates Std', 'Helvetica', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 12px; font-smoothing: always; font-style: normal; font-weight: 600; letter-spacing: 0.7px; line-height: 48px; mso-line-height-rule: exactly; text-decoration: none; vertical-align: top; width: 220px; background-color: #00cc99; border-radius: 28px; display: block; text-align: center; text-transform: uppercase' target='_blank'>";
            restEmail_Message += "Login to ECMS System";
            restEmail_Message += "</a> ";
            restEmail_Message += "</td>";
            restEmail_Message += "</tr>";
            restEmail_Message += "</tbody></table>";
            restEmail_Message += "</td>";
            restEmail_Message += "</tr>";
            restEmail_Message += "</tbody></table>";
            restEmail_Message += "</body>";
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress(System_email, System_Name);
                mail.To.Add(SendTo);
                mail.Subject = "ECMS - Reset Password";
                mail.Body = restEmail_Message;
                mail.IsBodyHtml = true;
                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential(System_email, System_password);
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);


            }
            catch (Exception er) { return false; }
            return true;
        }

        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

    }
}