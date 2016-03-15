using Api.Services;
using JobsInABA.DAL.Repositories;
using JobsInABA.Web.Services;
using JobsInABA.Workflows;
using JobsInABA.Workflows.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Security;

namespace Api.Controllers
{
    public class AccountController : ApiController
    {
        private UserWorkflows db = new UserWorkflows();

        public HttpResponseMessage Post([FromUri]string filename)
        {
            var task = this.Request.Content.ReadAsStreamAsync();
            task.Wait();
            Stream requestStream = task.Result;

            try
            {
                Stream fileStream = File.Create(HttpContext.Current.Server.MapPath("~/" + filename));
                requestStream.CopyTo(fileStream);
                fileStream.Close();
                requestStream.Close();
            }
            catch (IOException)
            {
                throw new HttpResponseException(HttpStatusCode.InternalServerError);
            }

            HttpResponseMessage response = new HttpResponseMessage();
            response.StatusCode = HttpStatusCode.Created;
            return response;
        }

        [Route("api/account/SignIn")]
        [HttpPost]
        [ResponseType(typeof(UserDataModel))]
        public IHttpActionResult SignIn(SignIn signIn)
        {
            if (signIn.Username == null || signIn.Password == null)
                return StatusCode(HttpStatusCode.BadRequest);

            //var user = db.Get().FirstOrDefault(p => p.UserName == username && p.UserAccountPassword == password);
            var user = db.CanLogIn(signIn.Username, signIn.Password);

            if (user == null)
            {
                return NotFound();
            }
            else if (user.IsActive)
            {
                return Ok(user);
            }
            else
            {
                return Ok(0);
            }
        }

        [Route("api/account/ForgotPassword")]
        [HttpPost]
        [ResponseType(typeof(UserDataModel))]
        public IHttpActionResult ForgotPassword(ForgotPassword forgotPassword)
        {
            if (!string.IsNullOrEmpty(forgotPassword.ForgotEmailAddress))
            {
                //if (new UserWorkflows().Get().Count(p => p.UserName == forgotPassword.ForgotEmailAddress) > 0)
                if (new UserWorkflows().Get().Count(p => p.UserEmailAddress == forgotPassword.ForgotEmailAddress) > 0)
                {
                    //string link = username+"_"+DateTime.Now.ToShortTimeString();
                    string link = Membership.GeneratePassword(8, 2);
                    EmailService.SendPasswordResetEmail(forgotPassword.ForgotEmailAddress, link);
                    return Ok();
                }
                else
                    return NotFound();
            }
            else
                return NotFound();

            
        }

        public IHttpActionResult EmailExist(string username)
        {
            if (new UserWorkflows().Get().Count(p => p.UserName == username) > 0)
            {
                return Ok();
            }
            else
                return NotFound();
        }
    }
}
