
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
    
public partial class JobApplication
{

    public JobApplication()
    {

        this.JobApplicationStates = new HashSet<JobApplicationState>();

    }


    public int JobApplicationID { get; set; }

    public int JobID { get; set; }

    public int ApplicantUserID { get; set; }

    public System.DateTime ApplicationDate { get; set; }



    public virtual Job Job { get; set; }

    public virtual User User { get; set; }

    public virtual ICollection<JobApplicationState> JobApplicationStates { get; set; }

    public virtual User User1 { get; set; }

}

}
