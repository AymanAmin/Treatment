
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
    
public partial class Group
{

    public Group()
    {

        this.Employees = new HashSet<Employee>();

        this.Permission_Group = new HashSet<Permission_Group>();

    }


    public int Group_Id { get; set; }

    public string Group_Name_Ar { get; set; }

    public string Group_Name_En { get; set; }



    public virtual ICollection<Employee> Employees { get; set; }

    public virtual ICollection<Permission_Group> Permission_Group { get; set; }

}

}
