﻿using JobsInABA.DAL.Repositories;
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
        [HttpPut]
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

    }

    public class SignIn
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
