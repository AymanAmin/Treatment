using Treatment.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website.Classes
{
    /// <summary>
    /// Summary description for SessionWrapper
    /// </summary>
    public class SessionWrapper
    {
        public SessionWrapper()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        #region Get & Set functions

        private static T GetFromSession<T>(string key)
        {
            object obj = HttpContext.Current.Session[key];
            if (obj == null)
            {
                return default(T);
            }
            return (T)obj;
        }

        private static void SetInSession<T>(string key, T value)
        {
            HttpContext.Current.Session[key] = value;
        }

        private static T GetFromApplication<T>(string key)
        {
            return (T)HttpContext.Current.Application[key];
        }

        private static void SetInApplication<T>(string key, T value)
        {
            if (value == null)
            {
                HttpContext.Current.Application.Remove(key);
            }
            else
            {
                HttpContext.Current.Application[key] = value;
            }
        }

        #endregion


        #region Users

        #region Permissions

        #region IsLocked

        #region Language

        #region EmpStructures


        public static Employee LoggedUser
        {
            get { return GetFromSession<Employee>("LoggedUser"); }
            set
            {
                if (value == null)
                {
                    HttpContext.Current.Session.Remove("LoggedUser");
                }
                else
                {
                    SetInSession<Employee>("LoggedUser", value);
                }
            }
        }
        
        
        public static List<Permission> Permssions
        {
            get { return GetFromSession<List<Permission>>("Permission"); }
            set
            {
                if (value == null)
                {
                    HttpContext.Current.Session.Remove("Permission");
                }
                else
                {
                    SetInSession<List<Permission>>("Permission", value);
                }
            }
        }

        public static bool IsLocked
        {
            get { return GetFromSession<bool>("IsLocked"); }
            set
            {
                if (value == null)
                {
                    HttpContext.Current.Session.Remove("IsLocked");
                }
                else
                {
                    SetInSession<bool>("IsLocked", value);
                }
            }
        }

        public static List<Lanuage_Detials> Language
        {
            get { return GetFromSession<List<Lanuage_Detials>>("Language"); }
            set
            {
                if (value == null)
                {
                    HttpContext.Current.Session.Remove("Language");
                }
                else
                {
                    SetInSession<List<Lanuage_Detials>>("Language", value);
                }
            }
        }

        public static int EmpStructure
        {
            get { return GetFromSession<int>("EmpStructure"); }
            set
            {
                if (value == null)
                {
                    HttpContext.Current.Session.Remove("EmpStructure");
                }
                else
                {
                    SetInSession<int>("EmpStructure", value);
                }
            }
        }

        #endregion

        #endregion

        #endregion

        #endregion

        #endregion
    }
}

