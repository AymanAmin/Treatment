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


        #region Session Names

        #region Users


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
        
        
        public static Nullable<int> OrdId
        {
            get { return GetFromSession<Nullable<int>>("OrdId"); }
            set
            {
                if (value == null)
                {
                    HttpContext.Current.Session.Remove("OrdId");
                }
                else
                {
                    SetInSession<Nullable<int>>("OrdId", value);
                }
            }
        }

        #endregion

        #endregion
    }


}