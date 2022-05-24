using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace it_aud9_mvc.Models
{
    public class Movie
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string DownloadUrl { get; set; }
        public string ImageUrl { get; set; }
        public float Rating { get; set; }
        public virtual ICollection<Client> clients { get; set; }

        public Movie()
        {
            clients = new List<Client>();
        }
    }
}