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
    
    public partial class Treatment_Type
    {
        public Treatment_Type()
        {
            this.Treatment_Master = new HashSet<Treatment_Master>();
        }
    
        public int Treatment_Type_Id { get; set; }
        public string Treatment_Type_Name_Ar { get; set; }
        public string Treatment_Type_Name_En { get; set; }
    
        public virtual ICollection<Treatment_Master> Treatment_Master { get; set; }
    }
}
