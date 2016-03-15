using Microsoft.AspNet.Identity;
using System.Net;
using System.Net.Mail;
//using SendGrid;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Data;
using System.Text;
using System.IO;

namespace Api.Services
{
    public static class EmailService
    {
        public static void SendPasswordResetEmail(string toEmail)
        {
            var domain = HttpContext.Current.Request.Url.Authority;
            StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("/EmailTemplate/ConfirmRegistration.html"));
            string readFile = reader.ReadToEnd();
            string myString = "";
            myString = readFile;
            myString = myString.Replace("{USERNAME}", toEmail);
            myString = myString.Replace("{VERIFICATION_LINK}", "http://" + domain + "/api/User/ConfirmRegistration?q=" + toEmail);

            // MailMessage class is present is System.Net.Mail namespace 
            MailMessage mailMessage = new MailMessage();
            MailAddress fromMail = new MailAddress("hardikmansaraa@gmail.com");
            mailMessage.From = fromMail;
            mailMessage.To.Add(toEmail);
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = myString.ToString();
            mailMessage.Subject = "Email Verification";

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "hardikmansaraa@gmail.com",//input your username 
                Password = "9898502525"
            };

            smtpClient.Send(mailMessage);
        }

        public static void SendPasswordResetEmail(string toEmail, string link)
        {
            var domain = HttpContext.Current.Request.Url.Authority;
            StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("/EmailTemplate/ConfirmRegistration.html"));
            string readFile = reader.ReadToEnd();
            string myString = link;

            //MailMessage class is present is System.Net.Mail namespace 
            MailMessage mailMessage = new MailMessage();
            MailAddress fromMail = new MailAddress("hardikmansaraa@gmail.com");
            mailMessage.From = fromMail;
            mailMessage.To.Add(toEmail);
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = myString.ToString();
            mailMessage.Subject = "Email Verification";

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "hardikmansaraa@gmail.com",//input your username 
                Password = "9898502525"
            };

            smtpClient.Send(mailMessage);
        }
    }
}