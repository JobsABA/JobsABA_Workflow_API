using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using JobsInABA.DAL.Entities;
using System;
using System.Linq;

namespace JobsInABA.DAL.Repositories
{
    public class JobsRepo : IDisposable
    {
        private JobsInABAEntities db = new JobsInABAEntities();

        public IEnumerable<Job> GetJobs()
        {
            var job = db.Jobs
                .Include(p => p.JobApplications)
                .Include(o => o.JobApplications)
                .Include(p => p.Business.BusinessUserMaps)
                .ToList();
            return job;
        }

        public Job GetJob(int id)
        {
            Job job = new Job();
            job = db.Jobs.Where(i => i.JobID == id)
            .Include(p => p.JobApplications)
                .Include(o => o.JobApplications)
                .Include(p => p.Business.BusinessUserMaps)
                .FirstOrDefault();
            return job;
        }

        public void UpdateJob(int id, Job job)
        {
            var mode = db.Jobs.FirstOrDefault(p => p.JobID == id);
            mode = job;
            db.Entry(job).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                throw;
            }
        }

        public Job CreateJob(Job job)
        {
            db.Jobs.Add(job);
            db.SaveChanges();

            return job;
        }

        public Job DeleteJob(int id)
        {
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return null;
            }

            db.Jobs.Remove(job);
            db.SaveChanges();

            return job;
        }

        private bool JobExists(int id)
        {
            return db.Jobs.Count(e => e.JobID == id) > 0;
        }

        public void Dispose()
        {
            db.Dispose();
        }

        public IEnumerable<Job> GetJobsBySearch(string searchText, int from, int to)
        {
            return db.Jobs
                .Include(p => p.JobApplications)
                .Include(o => o.JobApplications)
                .Include(p => p.Business.BusinessUserMaps)
                .ToList().Where(p => p.Description == searchText ||
                    p.Title == searchText).Skip(from).Take(to - from);

        }
    }
}