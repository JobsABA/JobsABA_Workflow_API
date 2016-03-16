using Api.Services;
using JobsInABA.Workflows;
using JobsInABA.Workflows.Models;
using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;

namespace Api.Controllers
{
    public class AccountController : ApiController
    {
        private UserWorkflows db = new UserWorkflows();

        public HttpResponseMessage PostFile()
        {
            string path=string.Empty;
            HttpRequestMessage request = this.Request;
            if (!request.Content.IsMimeMultipartContent())
            {
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.UnsupportedMediaType));
            }

            string root = System.Web.HttpContext.Current.Server.MapPath("~/App_Data/uploads");
            var provider = new MultipartFormDataStreamProvider(root);

            var task = request.Content.ReadAsMultipartAsync(provider).
                ContinueWith<HttpResponseMessage>(o =>
                {
                    FileInfo finfo = new FileInfo(provider.FileData.First().LocalFileName);

                    string guid = Guid.NewGuid().ToString();
                    path = guid + "_" + provider.FileData.First().Headers.ContentDisposition.FileName.Replace("\"", "");

                    File.Move(finfo.FullName, Path.Combine(root, path));

                    return new HttpResponseMessage()
                    {
                        Content = new StringContent("File uploaded.")
                    };
                }
            );
            return Request.CreateResponse(HttpStatusCode.BadRequest, path); 
        }

        [Route("api/account/SignIn")]
        [HttpPost]
        [ResponseType(typeof(UserDataModel))]
        public IHttpActionResult SignIn(SignIn signIn)
        {
            signIn.Username = "hardikMandanka";
            signIn.Password = "123123";
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

        public IHttpActionResult ForgotPassword(string username)
        {
            if (new UserWorkflows().Get().Count(p => p.UserName == username) > 0)
            {
                string link = username + "_" + DateTime.Now.ToShortTimeString();
                //string link = Membership.GeneratePassword(8, 2);
                EmailService.SendPasswordResetEmail(username, link);
                return Ok();
            }
            else
                return NotFound();
        }

        public IHttpActionResult ActivateUser(string username)
        {
            if (new UserWorkflows().ActivateUser(username))
                return Ok();
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
