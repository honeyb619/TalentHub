using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using TalentSearchWebApp.Models;

namespace TalentSearchWebApp.Common
{
    public class JadeEmail
    {
        public static void sendEmail(MailMessage message)
        {
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.Host = "smtpauth.umbrellar.nz";
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Timeout = 10000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential("info@jadetalent.co.nz", "versace1"); //info@jadetalent.co.nz versace1
            message.BodyEncoding = UTF8Encoding.UTF8;
            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            client.Send(message);
        }

        public static void SendEnquiryMessage(ContactUsMail emailObj)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(emailObj.EmailId);
            message.Body = emailObj.Message;
            message.Subject = emailObj.Subject;
            message.To.Add(new MailAddress("stacey@jadetalent.co.nz"));
            message.IsBodyHtml = true;
            JadeEmail.sendEmail(message);
        }

        public static void SendForgotPassword(string emailaddress, string messageBody)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("info@jadetalent.co.nz");
            message.To.Add(new MailAddress(emailaddress));
            message.Body = messageBody;
            message.IsBodyHtml = true;
            message.Subject = "Admin Password";
            JadeEmail.sendEmail(message);
        }

        public static void SendMessage(string messageBody, string subject = null)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("info@jadetalent.co.nz");
            message.To.Add(new MailAddress("stacey@jadetalent.co.nz"));
            message.Body = messageBody;
            message.IsBodyHtml = true;
            message.Subject = subject ?? "Selected Profiles";
            JadeEmail.sendEmail(message);
        }

        public static void SendBulkMessage(string emailaddress, string subject, string messageBody)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("info@jadetalent.co.nz");
            string[] recipents = emailaddress.Split(',');
            foreach (var recipent in recipents)
            {
                message.To.Add(new MailAddress(recipent));
            }
            message.Body = messageBody;
            message.IsBodyHtml = true;
            message.Subject = subject;
            JadeEmail.sendEmail(message);
        }


    }
}