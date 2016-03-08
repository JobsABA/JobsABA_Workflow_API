//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2016/02/22 - 20:58:37
//
//     Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
// </auto-generated>
//-------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace JobsInABA.BL.DTOs
{
    [DataContract()]
    public partial class JobDTO
    {
        [DataMember()]
        public Int32 JobID { get; set; }

        [DataMember()]
        public Int32 BusinessID { get; set; }

        [DataMember()]
        public String Title { get; set; }

        [DataMember()]
        public String Description { get; set; }

        [DataMember()]
        public Nullable<Int32> JobTypeID { get; set; }

        [DataMember()]
        public Boolean IsActive { get; set; }

        [DataMember()]
        public Boolean IsDeleted { get; set; }

        [DataMember()]
        public Nullable<DateTime> StartDate { get; set; }

        [DataMember()]
        public Nullable<DateTime> EndDate { get; set; }

        [DataMember()]
        public Nullable<Int32> insuser { get; set; }

        [DataMember()]
        public Nullable<DateTime> insdt { get; set; }

        [DataMember()]
        public Nullable<Int32> upduser { get; set; }

        [DataMember()]
        public Nullable<DateTime> upddt { get; set; }

        [DataMember()]
        public BusinessDTO Business { get; set; }

        [DataMember()]
        public Int32 Business_BusinessID { get; set; }

        [DataMember()]
        public List<JobApplicationDTO> JobApplications { get; set; }

        [DataMember()]
        public List<Int32> JobApplications_JobApplicationID { get; set; }

        [DataMember()]
        public TypeCodeDTO TypeCode { get; set; }

        [DataMember()]
        public Int32 TypeCode_TypeCodeID { get; set; }

        public JobDTO()
        {
        }

        public JobDTO(Int32 jobID, Int32 businessID, String title, String description, Nullable<Int32> jobTypeID, Boolean isActive, Boolean isDeleted, Nullable<DateTime> startDate, Nullable<DateTime> endDate, Nullable<Int32> insuser, Nullable<DateTime> insdt, Nullable<Int32> upduser, Nullable<DateTime> upddt, Int32 business_BusinessID, List<Int32> jobApplications_JobApplicationID, Int32 typeCode_TypeCodeID)
        {
			this.JobID = jobID;
			this.BusinessID = businessID;
			this.Title = title;
			this.Description = description;
			this.JobTypeID = jobTypeID;
			this.IsActive = isActive;
			this.IsDeleted = isDeleted;
			this.StartDate = startDate;
			this.EndDate = endDate;
			this.insuser = insuser;
			this.insdt = insdt;
			this.upduser = upduser;
			this.upddt = upddt;
			this.Business_BusinessID = business_BusinessID;
			this.JobApplications_JobApplicationID = jobApplications_JobApplicationID;
			this.TypeCode_TypeCodeID = typeCode_TypeCodeID;
        }
    }
}
