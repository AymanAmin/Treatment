using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website.Classes
{
    public class Enums
    {

        public enum brnch
        {
            Olaya = 1,
            Munisiya = 2,
            Namuthajiyah = 3,
            Qurtuba = 4
        }

        public enum EmpType
        {
            Admin = 1,
            Manager = 2,
            Technicall = 3,
            User = 4,
            DeptMang = 5
        }

        public enum OrderStat
        {
            Pending = 1,
            Accepted = 2,
            Rejected = 3,
            Admin = 4,
            Technical = 5,
            Maintain = 6,
            Finished = 7,
            Closed = 8,
            AdminReject = 9,
            SendBack = 10
        }
    }
}