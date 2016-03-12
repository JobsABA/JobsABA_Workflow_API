using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Net;
using System.Web.Http;
using System.Web.Http.Description;
using JobsInABA.Workflows;
using JobsInABA.Workflows.Models;
using System;
using System.Linq;

namespace Api.Controllers
{
    public class BusinessesController : ApiController
    {
        private BusinessWorkflows db = new BusinessWorkflows();

        // GET: api/Businesses
        public IEnumerable<BusinessDataModel> GetBusinesses()
        {
            return db.Get();
        }

        public IEnumerable<BusinessDataModel> GetBusinessesBySearch(string companyname, string city, int? from, int? to)
        {
            return db.GetBusinessesBySearch(companyname, city, from, to);
        }

        public IEnumerable<string> GetBusinessNames()
        {
            return db.Get().Select(p => p.Name);
        }

        public IEnumerable<BusinessDataModel> GetBusinessesByPaging(int from, int to)
        {
            return db.Get().Skip(from).Take(to - from);
        }

        // GET: api/Businesses/5
        [ResponseType(typeof(BusinessDataModel))]
        public IHttpActionResult GetBusiness(int id)
        {
            BusinessDataModel BusinessDataModel = db.Get().FirstOrDefault(p => p.BusinessID == id);
            if (BusinessDataModel == null)
            {
                return NotFound();
            }

            return Ok(BusinessDataModel);
        }


        // PUT: api/Businesses/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBusiness(int id, BusinessDataModel business)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != business.BusinessID)
            {
                return BadRequest();
            }

            try
            {
                db.Update(business);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BusinessExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Businesses
        [ResponseType(typeof(BusinessDataModel))]
        public IHttpActionResult PostBusiness(BusinessDataModel business)
        {
            //business = new BusinessDataModel();
            ////business.BusinessID = 1;
            //business.Name = "ABCD solutions pVT LTD";
            //business.Abbreviation = "Think Big";
            //business.StartDate = DateTime.Now;
            //business.BusinessTypeID = 7;
            //business.IsActive = true;
            //business.IsDeleted = false;
            //business.insuser = 50;
            //business.insdt = DateTime.Now;
            //business.upduser = 50;
            //business.upddt = DateTime.Now;

            //business.BusinessUserMapTypeCodeId = 7;
            //business.BusinessUserId = 50;

            ////business.BusinessAddressID = 1;
            //business.BusinessAddressTitle = "Zip";
            //business.BusinessAddressLine1 = "Business Line 1";
            //business.BusinessAddressLine2 = "Business Line 2";
            //business.BusinessAddressLine3 = "Business Line 3";
            //business.BusinessAddressCity = "Ahmedabad";
            //business.BusinessAddressState = "Gujarat";
            //business.BusinessAddressZipCode = "360001";
            //business.BusinessAddressCountryID = 2;
            //business.BusinessAddressAddressTypeID = 7;
            //business.Addresses.Add(new JobsInABA.BL.DTOs.AddressDTO()
            //{
            //    Title = "New Line",
            //    Line1 = "New Line 1",
            //    Line2 = "New Line 2 ",
            //    Line3 = "New Line 3",
            //    City = "Ahmedabad",
            //    CountryID = 2,
            //    State = "Gujarat",
            //    ZipCode = "360001",
            //    AddressTypeID = 7
            //});

            ////business.BusinessEmailID = 1;
            //business.BusinessEmailAddress = "test32@gmail.com";
            //business.BusinessEmailTypeID = 7;

            ////business.BusinessPhoneID = 1;
            //business.BusinessPhoneCountryID = 2;
            //business.BusinessPhoneNumber = "8866000000";
            //business.BusinessPhoneExt = "+91";
            //business.BusinessPhoneTypeID = 7;
            //business.BusinessPhoneAddressbookID = 34;

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Create(business);

            return CreatedAtRoute("DefaultApi", new { id = business.BusinessID }, business);
        }

        // DELETE: api/Businesses/5
        [ResponseType(typeof(BusinessDataModel))]
        public IHttpActionResult DeleteBusiness(int id)
        {
            var business = db.Delete(id);

            return Ok(business);
        }

        private bool BusinessExists(int id)
        {
            return (db.Get(id) != null);
        }
    }
}