using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace it_aud8_mvc.Models
{
    public class MovieClient
    {
        public int MovieId { get; set; }
        public int ClientId { get; set; }

        public Movie movie { get; set; }
        public List<Client> clients { get; set; }

        public MovieClient()
        {
            clients = new List<Client>();
        }
    }
}