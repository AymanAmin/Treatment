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
    
    public partial class M_Board_Location
    {
        public M_Board_Location()
        {
            this.M_Meeting = new HashSet<M_Meeting>();
        }
    
        public int Board_Location_Id { get; set; }
        public string Board_Location_Name_Ar { get; set; }
        public string Board_Location_Name_En { get; set; }
        public Nullable<int> Board_Id { get; set; }
        public string Board_Location_Description_Ar { get; set; }
        public string Board_Location_Description_En { get; set; }
        public string Board_Location_OnMap { get; set; }
        public string Board_Location_URLVideo { get; set; }
    
        public virtual M_Board M_Board { get; set; }
        public virtual ICollection<M_Meeting> M_Meeting { get; set; }
    }
}
