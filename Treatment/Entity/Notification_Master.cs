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
    
    public partial class Notification_Master
    {
        public int Notification_Id { get; set; }
        public Nullable<System.DateTime> Notification_Date { get; set; }
        public string Notification_Description_Ar { get; set; }
        public string Notification_Description_En { get; set; }
        public Nullable<bool> Is_Read { get; set; }
        public Nullable<System.DateTime> Date_Read { get; set; }
        public Nullable<int> From_Employee_Structure_Id { get; set; }
        public Nullable<int> To_Employee_Structure_Id { get; set; }
        public Nullable<int> Master_Id { get; set; }
        public string Notification_Link { get; set; }
        public Nullable<bool> Is_Show_Reply { get; set; }
        public Nullable<System.DateTime> Date_Show_Reply { get; set; }
        public Nullable<int> Notification_Show_Id { get; set; }
    
        public virtual Employee_Structure Employee_Structure { get; set; }
        public virtual Employee_Structure Employee_Structure1 { get; set; }
        public virtual Notification_Show Notification_Show { get; set; }
    }
}