using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace it_aud9_mvc.Models
{
    public class MoviesDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DownloadUrl { get; set; }
        public string ImageUrl { get; set; }
        public float Rating { get; set; }
    }
}