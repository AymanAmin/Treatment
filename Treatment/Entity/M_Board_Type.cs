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
    
    public partial class M_Board_Type
    {
        public M_Board_Type()
        {
            this.M_Board = new HashSet<M_Board>();
        }
    
        public int Board_Type_Id { get; set; }
        public string Board_Type_Name_Ar { get; set; }
        public string Board_Type_Name_En { get; set; }
    
        public virtual ICollection<M_Board> M_Board { get; set; }
    }
}
