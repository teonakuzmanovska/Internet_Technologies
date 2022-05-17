using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace it_aud6_mvc.Models
{
    public class Client
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int Phone { get; set; }
        public int Legitimation { get; set; }
        public int Age { get; set; }

    }
}