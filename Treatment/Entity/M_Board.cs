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
    
    public partial class M_Board
    {
        public M_Board()
        {
            this.M_Board_Location = new HashSet<M_Board_Location>();
            this.M_Board_Member = new HashSet<M_Board_Member>();
            this.M_Meeting = new HashSet<M_Meeting>();
            this.M_B_Attachments = new HashSet<M_B_Attachments>();
        }
    
        public int Board_Id { get; set; }
        public string Board_Name_Ar { get; set; }
        public string Board_Name_En { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
        public Nullable<System.DateTime> Start_Date { get; set; }
        public Nullable<System.DateTime> End_Date { get; set; }
        public string Board_Description_Ar { get; set; }
        public string Board_Description_En { get; set; }
        public Nullable<int> Parent { get; set; }
        public Nullable<int> Board_Status_Id { get; set; }
        public Nullable<int> Board_Type_Id { get; set; }
        public Nullable<int> Board_Classification_Id { get; set; }
    
        public virtual ICollection<M_Board_Location> M_Board_Location { get; set; }
        public virtual M_Board_Classification M_Board_Classification { get; set; }
        public virtual M_Board_Status M_Board_Status { get; set; }
        public virtual M_Board_Type M_Board_Type { get; set; }
        public virtual ICollection<M_Board_Member> M_Board_Member { get; set; }
        public virtual ICollection<M_Meeting> M_Meeting { get; set; }
        public virtual ICollection<M_B_Attachments> M_B_Attachments { get; set; }
    }
}
