//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Treatment.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class M_Attendees
    {
        public int Attendees_Id { get; set; }
        public Nullable<int> Board_Member_Id { get; set; }
        public Nullable<int> Meeting_Id { get; set; }
        public Nullable<int> Attendess_Status { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
    
        public virtual M_Board_Member M_Board_Member { get; set; }
        public virtual M_Meeting M_Meeting { get; set; }
    }
}
