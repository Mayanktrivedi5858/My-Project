using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HappyTechCompany.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Please enter the username.")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Please enter the password.")]
        public string Password { get; set; }
    }
}