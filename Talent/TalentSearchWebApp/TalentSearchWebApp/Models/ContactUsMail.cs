using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TalentSearchWebApp.Models
{
    public class ContactUsMail
    {
        public string Name { get; set; }
        [Required]
        public string EmailId { get; set; }
        [Required]
        public string Subject { get; set; }
        [Required]
        public string Message { get; set; }
    }
}