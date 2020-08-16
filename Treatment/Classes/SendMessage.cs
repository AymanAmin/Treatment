using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Website.Classes;
using Treatment.Entity;
using ElectronicSubmission;

namespace Treatment.Classes
{
    public class SendMessage
    {
        public bool SendSMS(int CaseNo, Employee Emp)
        {
            SendSMS send_sms = new SendSMS();

            string MessageTextEn = string.Empty;
            string MessageTextAr = string.Empty;

            try
            {
                switch (CaseNo)
                {
                    case 1:// CreateNewAcount
                        MessageTextEn = "Create Account for user"+ Emp.Employee_Name_Ar + "\n The password is"+Emp.Employee_Password;
                        MessageTextAr = "Create Account for user" + Emp.Employee_Name_Ar;
                        send_sms.SendMessage(MessageTextAr + "\n" + MessageTextEn, Emp.Employee_Phone);
                        break;
                    case 2:// ResetPassword
                        MessageTextEn = "";
                        MessageTextAr = "";
                        send_sms.SendMessage(MessageTextAr + "\n" + MessageTextEn, Emp.Employee_Phone);
                        break;
                    case 3:// NewTreatment
                        MessageTextEn = "";
                        MessageTextAr = "";
                        send_sms.SendMessage(MessageTextAr + "\n" + MessageTextEn, Emp.Employee_Phone);
                        break;
                    case 4:// Meeting
                        MessageTextEn = "";
                        MessageTextAr = "";
                        send_sms.SendMessage(MessageTextAr + "\n" + MessageTextEn, Emp.Employee_Phone);
                        break;
                    case 5:// vote
                        MessageTextEn = "";
                        MessageTextAr = "";
                        send_sms.SendMessage(MessageTextAr + "\n" + MessageTextEn, Emp.Employee_Phone);
                        break;
                    default: // code block

                        break;
                }

            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool SendEmail(int CaseNo, Employee Emp, string sever_name)
        {
            SendEmail send = new SendEmail();
            string MessageTextEn = string.Empty;
            string MessageTextAr = string.Empty;
            bool result = false;
            try
            {
                switch (CaseNo)
                {
                    case 1:// CreateNewAcount
                        MessageTextEn = "Create Account for user" + Emp.Employee_Name_Ar + "\n The password is" + Emp.Employee_Password;
                        MessageTextAr = "Create Account for user" + Emp.Employee_Name_Ar;
                        result = send.TextEmail("Create Account", Emp.Employee_Email, MessageTextAr + "<br /><br />" + MessageTextEn, sever_name);
                        break;
                    case 2:// ResetPassword
                        MessageTextEn = "";
                        MessageTextAr = "";
                        result = send.TextEmail("Reset Password", Emp.Employee_Email, MessageTextAr + "<br /><br />" + MessageTextEn, sever_name);
                        break;
                    case 3:// NewTreatment
                        MessageTextEn = "";
                        MessageTextAr = "";
                        result = send.TextEmail("New Treatment", Emp.Employee_Email, MessageTextAr + "<br /><br />" + MessageTextEn, sever_name);
                        break;
                    case 4:// Meeting
                        MessageTextEn = "";
                        MessageTextAr = "";
                        result = send.TextEmail("Meeting", Emp.Employee_Email, MessageTextAr + "<br /><br />" + MessageTextEn, sever_name);
                        break;
                    case 5:// vote
                        MessageTextEn = "";
                        MessageTextAr = "";
                        result = send.TextEmail("Vote", Emp.Employee_Email, MessageTextAr + "<br /><br />" + MessageTextEn, sever_name);
                        break;
                    default: // code block

                        break;
                }

            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}