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
    
    public partial class M_Topic
    {
        public int Topic_Id { get; set; }
        public Nullable<int> Meeting_Id { get; set; }
        public string Topic_Name_Ar { get; set; }
        public string Topic_Name_En { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
        public string Topic_Description_Ar { get; set; }
        public string Topic_Description_En { get; set; }
        public Nullable<int> Topic_Status { get; set; }
        public string Topic_Recommendation_Ar { get; set; }
        public string Topic_Recommendation_En { get; set; }
        public string Topic_Recommendation_Doc_Ar { get; set; }
        public string Topic_Recommendation_Doc_En { get; set; }
        public Nullable<int> Structure_Id { get; set; }
    
        public virtual M_Meeting M_Meeting { get; set; }
        public virtual Structure Structure { get; set; }
    }
}
