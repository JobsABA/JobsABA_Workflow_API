using JobsInABA.BL.DTOs;
using JobsInABA.BL.DTOs.Assemblers;
using JobsInABA.DAL.Entities;
using JobsInABA.DAL.Repositories;
using System;
using System.Collections.Generic;

namespace JobsInABA.BL
{
    public class JobBL : IDisposable
    {
        JobsRepo _JobRepos;

        private JobsRepo jobRepos
        {
            get
            {
                if (_JobRepos == null) _JobRepos = new JobsRepo();
                return _JobRepos;
            }
        }

        public JobDTO Get(int id)
        {
            JobDTO oJobDTO = null;
            if (id > 0)
            {
                oJobDTO = JobAssembler.ToDTO(jobRepos.GetJob(id));
            }

            return oJobDTO;
        }

        public IEnumerable<JobDTO> Get()
        {
            IEnumerable<JobDTO> oJob = JobAssembler.ToDTOs(jobRepos.GetJobs());

            return oJob;
        }

        public IEnumerable<JobDTO> GetJobsBySearch(string companyName, string jobTitle, string location, int? from, int? to)
        {
            IEnumerable<JobDTO> oJob = JobAssembler.ToDTOs(jobRepos.GetJobsBySearch(companyName,jobTitle,location, from, to));

            return oJob;
        }

        public JobDTO Create(JobDTO modelDTO)
        {
            if (modelDTO != null)
            {
                return JobAssembler.ToDTO(jobRepos.CreateJob(JobAssembler.ToEntity(modelDTO)));
            }

            return null;
        }

        public JobDTO Update(JobDTO modelDTO)
        {
            JobDTO returnUserMap = null;
            if (modelDTO != null && modelDTO.JobID > 0)
            {
                jobRepos.UpdateJob(0, JobAssembler.ToEntity(modelDTO));
                returnUserMap = modelDTO;
            }

            return returnUserMap;
        }

        public bool Delete(int id)
        {
            Boolean isDeleted = false;

            if (id > 0)
            {
                try
                {
                    jobRepos.DeleteJob(id);
                }
                catch
                {
                    return false;
                }
            }
            return isDeleted;
        }

        public void Dispose()
        {
            _JobRepos.Dispose();
        }
    }
}