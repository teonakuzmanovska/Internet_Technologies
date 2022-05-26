using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace it_lab4_mvc.Models
{
    public class Friend
    {
        [Required]
        [Range(0, 200)]
        public int id { get; set; }
        [Required]
        public string Ime { get; set; }
        [Required]
        public string MestoZhiveenje { get; set; }
    }
}