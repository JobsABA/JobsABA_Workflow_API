using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using JobsInABA.DAL.Entities;
using JobsInABA.DAL.Repositories;
using JobsInABA.Workflows;
using JobsInABA.Workflows.Models;

using System.Text;
using JobsInABA.Web.Services;
using JobsInABA.BL.DTOs;
using Api.Services;

namespace Api.Controllers
{
    public class UsersController : ApiController
    {
        private UserWorkflows db = new UserWorkflows();

        // GET: api/Users
        public IEnumerable<UserDataModel> GetUsers()
        {
            return db.Get();
        }

        public List<BusinessDTO> GetUsersWiseCompany(int id)
        {
            return db.GetUsersWiseCompany(id);
        }

        public IEnumerable<UserDataModel> GetUsersBySearch(string searchText, int from, int to)
        {
            if (string.IsNullOrEmpty(searchText))
                return db.Get();
            else
                return db.GetUsersBySearch(searchText, from, to);
        }

        public IEnumerable<UserDataModel> GetUsersByPaging(int from, int to)
        {
            var temp = db.Get().Skip(from).Take(to - from);
            return temp;
        }

        // GET: api/Users/5
        [ResponseType(typeof(UserDataModel))]
        public IHttpActionResult GetUser(int id)
        {
            UserDataModel user = db.Get().FirstOrDefault(p => p.UserID == id);
            if (user == null)
            {
                return NotFound();
            }

            return Ok(user);
        }

        // PUT: api/Users/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUser(int id, UserDataModel user)
        {
            //user = new UserDataModel();
            //user.UserID = 55;
            //user.UserEmailAddress = user.UserAccountUserName = user.UserName = "Test32@gmail.com";
            //user.FirstName = "Test32 changed";
            //user.MiddleName = "User Middle";
            //user.LastName = "User Last";
            //user.DOB = DateTime.Now;
            //user.IsActive = true;
            //user.IsDeleted = false;
            //user.insuser = 50;
            //user.insdt = DateTime.Now;
            //user.upduser = 50;
            //user.upddt = DateTime.Now;

            //user.UserAccountID = 26;
            //user.UserAccountPassword = "Password";
            //user.UserAccountIsActive = true;
            //user.UserAccountIsDeleted = false;
            //user.UserAccountinsuser = 50;
            //user.UserAccountinsdt = DateTime.Now;
            //user.UserAccountupduser = 50;
            //user.UserAccountupddt = DateTime.Now;

            //user.UserAddressID = 44;
            //user.UserAddressTitle = "Primary Address new ";
            //user.UserAddressLine1 = "New Address Line 11";
            //user.UserAddressLine2 = "New Address Line 22";
            //user.UserAddressLine3 = "New Address Line 3";
            //user.UserAddressCity = "Surat";
            //user.UserAddressState = "Gujarat";
            //user.UserAddressZipCode = "360001";
            //user.UserAddressCountryID = 2;
            //user.UserAddressAddressTypeID = 7;

            //user.UserEmailID = 35;
            //user.UserEmailTypeID = 7;

            //user.UserPhoneID = 47;
            //user.UserPhoneCountryID = 2;
            //user.UserPhoneAddressBookID = 34;
            //user.UserPhoneNumber = "8866148850";
            //user.UserPhoneExt = "+91";
            //user.UserPhoneTypeID = 7;

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user.UserID)
            {
                return BadRequest();
            }

            try
            {
                db.Update(user);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
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

        // POST: api/Users
        [ResponseType(typeof(UserDataModel))]
        public IHttpActionResult PostUser([FromBody]UserDataModel user)
        {
            //new AccountController().Put("Test13@gmail.com", "Password");
            ////GetUsersByPaging(0, 2);
            //return Ok();

            //user = new UserDataModel();
            //user.UserEmailAddress = user.UserAccountUserName = user.UserName = "Test32@gmail.com";
            //user.FirstName = "Test32";
            //user.MiddleName = "User Middle";
            //user.LastName = "User Last";
            //user.DOB = DateTime.Now;
            //user.IsActive = true;
            //user.IsDeleted = false;
            //user.insuser = 50;
            //user.insdt = DateTime.Now;
            //user.upduser = 50;
            //user.upddt = DateTime.Now;

            //user.UserAccountPassword = "Password";
            //user.UserAccountIsActive = true;
            //user.UserAccountIsDeleted = false;
            //user.UserAccountinsuser = 50;
            //user.UserAccountinsdt = DateTime.Now;
            //user.UserAccountupduser = 50;
            //user.UserAccountupddt = DateTime.Now;

            //user.UserAddressTitle = "Primary Address new ";
            //user.UserAddressLine1 = "New Address Line 11";
            //user.UserAddressLine2 = "New Address Line 22";
            //user.UserAddressLine3 = "New Address Line 3";
            //user.UserAddressCity = "Surat";
            //user.UserAddressState = "Gujarat";
            //user.UserAddressZipCode = "360001";
            //user.UserAddressCountryID = 2;
            //user.UserAddressAddressTypeID = 7;

            //user.UserEmailTypeID = 7;

            //user.UserPhoneCountryID = 2;
            //user.UserPhoneAddressBookID = 34;
            //user.UserPhoneNumber = "8866148850";
            //user.UserPhoneExt = "+91";
            //user.UserPhoneTypeID = 7;

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var objUser = db.Create(user);
            EmailService.SendPasswordResetEmail(user.UserEmailAddress);
            return CreatedAtRoute("DefaultApi", new { id = user.UserID }, objUser);
        }

        // DELETE: api/Users/5
        [ResponseType(typeof(UserDataModel))]
        public IHttpActionResult DeleteUser(int id)
        {
            return Ok(db.Delete(id));
        }

        private bool UserExists(int id)
        {
            return db.Get(id) != null;
        }


        [HttpGet]
        [Route("api/Users/ConfirmRegistration/{email}")]

        public IEnumerable<string> ConfirmRegistration(string email)
        {
            return new string[] { "value3", "value4" };
        }


    }

}