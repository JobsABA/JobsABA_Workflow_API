using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using JobsInABA.DAL.Entities;
using AutoMapper;

namespace JobsInABA.DAL.Repositories
{
    public class BusinessRepo : IDisposable
    {
        JobsInABAEntities _DBContext;
        private JobsInABAEntities DBContext
        {
            get
            {
                if (_DBContext == null) _DBContext = new JobsInABAEntities();

                return _DBContext;
            }
        }

        public Business GetBusinessByID(Int32 Id)
        {
            Business oBusiness = null;

            using (DBContext)
            {
                try
                {
                    oBusiness = DBContext.Businesses.Where(p => p.BusinessID == Id)
                    .Include(o => o.BusinessAddresses
                                        .Select(ua => ua.Address)
                                        .Select(ad => ad.TypeCode)
                                        .Select(typ => typ.ClassType)
                        )
                        .Include(p => p.Achievements)
                        .Include(p => p.Experiences)
                        .Include(p => p.BusinessImages
                                        .Select(k => k.Image))
                        .Include(o => o.BusinessAddresses
                                        .Select(ua => ua.Address)
                                        .Select(ad => ad.Country)
                        )
                        .Include(o => o.BusinessEmails
                                        .Select(ue => ue.Email)
                                        .Select(e => e.TypeCode)
                                        .Select(typ => typ.ClassType)
                        )
                        .Include(o => o.BusinessPhones
                                        .Select(up => up.Phone)
                                        .Select(p => p.TypeCode)
                                        .Select(typ => typ.ClassType)
                        ).Include(o => o.BusinessPhones
                                            .Select(up => up.Phone))
                        .Include(o => o.Experiences)
                        .Include(o => o.Achievements)
                        .Include(o => o.BusinessImages)
                        .Include(o => o.Jobs.Select(p => p.JobApplications))
                        .FirstOrDefault();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return oBusiness;
        }

        public IEnumerable<Business> GetBusinesss()
        {
            List<Business> oBusinesss = new List<Business>();

            try
            {
                oBusinesss = DBContext.Businesses
                    .Include(o => o.BusinessAddresses
                                        .Select(ua => ua.Address)
                                        .Select(ad => ad.TypeCode)
                                        .Select(typ => typ.ClassType)
                        )
                        .Include(p => p.Achievements)
                        .Include(p => p.Experiences)
                        .Include(p => p.BusinessImages
                                        .Select(k => k.Image))
                        .Include(o => o.BusinessAddresses
                                        .Select(ua => ua.Address)
                                        .Select(ad => ad.Country)
                        )
                        .Include(o => o.BusinessEmails
                                        .Select(ue => ue.Email)
                                        .Select(e => e.TypeCode)
                                        .Select(typ => typ.ClassType)
                        )
                        .Include(o => o.BusinessPhones
                                        .Select(up => up.Phone)
                                        .Select(p => p.TypeCode)
                                        .Select(typ => typ.ClassType)
                        ).Include(o => o.BusinessPhones.Select(up => up.Phone))
                            .Include(o => o.Experiences)
                            .Include(o => o.Achievements)
                            .Include(o => o.BusinessImages)
                            .Include(o => o.Jobs.Select(p => p.JobApplications))
                            .ToList();
            }
            catch (Exception ex)
            {
                //Log Exception.
            }

            return oBusinesss;
        }

        public Business CreateBusiness(Business oBusiness)
        {
            Business oBusinessReturn = null;

            using (DBContext)
            {
                try
                {
                    oBusinessReturn = DBContext.Businesses.Add(oBusiness);
                    DBContext.SaveChanges();
                }
                catch (Exception ex)
                {
                    //Log Exception.
                }
            }

            return oBusinessReturn;
        }

        public Business UpdateBusiness(Business oBusiness)
        {
            Business oBusinessReturn = null;
            if (oBusiness != null && oBusiness.BusinessID > 0)
            {
                using (DBContext)
                {
                    Business u = this.GetBusinessByID(oBusiness.BusinessID);

                    if (u != null)
                    {
                        Mapper.Map<Business, Business>(oBusiness, u);
                        DBContext.SaveChanges();
                        oBusinessReturn = u;
                    }
                }
            }

            return oBusinessReturn;
        }

        public bool DeleteBusiness(int BusinessID)
        {

            Boolean isDeleted = false;
            using (DBContext)
            {
                Business u = this.GetBusinessByID(BusinessID);

                if (u != null)
                {
                    DBContext.Businesses.Remove(u);
                    DBContext.SaveChanges();
                    isDeleted = true;
                }
            }

            return isDeleted;
        }

        public void Dispose()
        {
            _DBContext.Dispose();
        }

        public IEnumerable<Business> GetBusinessesBySearch(string searchText, int from, int to)
        {
            List<Business> oBusinesss = new List<Business>();

            try
            {
                oBusinesss = DBContext.Businesses
                    .Include(o => o.BusinessAddresses
                                        .Select(ua => ua.Address)
                                        .Select(ad => ad.TypeCode)
                                        .Select(typ => typ.ClassType)
                        )
                        .Include(p => p.Achievements)
                        .Include(p => p.Experiences)
                        .Include(p => p.BusinessImages
                                        .Select(k => k.Image))
                        .Include(o => o.BusinessAddresses
                                        .Select(ua => ua.Address)
                                        .Select(ad => ad.Country)
                        )
                        .Include(o => o.BusinessEmails
                                        .Select(ue => ue.Email)
                                        .Select(e => e.TypeCode)
                                        .Select(typ => typ.ClassType)
                        )
                        .Include(o => o.BusinessPhones
                                        .Select(up => up.Phone)
                                        .Select(p => p.TypeCode)
                                        .Select(typ => typ.ClassType)
                        ).Include(o => o.BusinessPhones.Select(up => up.Phone))
                            .Include(o => o.Experiences)
                            .Include(o => o.Achievements)
                            .Include(o => o.BusinessImages)
                            .Include(o => o.Jobs.Select(p => p.JobApplications))
                            .Where(p => p.Name == searchText ||
                    p.Abbreviation == searchText)
                    .Skip(from).Take(to - from)
                            .ToList();
            }
            catch (Exception ex)
            {
                //Log Exception.
            }

            return oBusinesss;
        }
    }
}
