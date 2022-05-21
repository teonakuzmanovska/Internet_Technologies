using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace it_aud6_mvc.Models
{
    public class Client
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public int Phone { get; set; }
        [Required]
        public int Legitimation { get; set; }
        [Required]
        [Range(1,99,ErrorMessage ="Age must be between 1 and 99")]
        public int Age { get; set; }

    }
}