
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace JobsInABA.DAL.Entities
{

using System;
    using System.Collections.Generic;
    
public partial class Education
{

    public int EducationID { get; set; }

    public int UserID { get; set; }

    public string InstituteName { get; set; }

    public string Degree { get; set; }

    public string Description { get; set; }

    public Nullable<System.DateTime> StartDate { get; set; }

    public Nullable<System.DateTime> EndDate { get; set; }

    public Nullable<bool> IsActive { get; set; }

    public Nullable<bool> IsDelete { get; set; }



    public virtual User User { get; set; }

}

}
