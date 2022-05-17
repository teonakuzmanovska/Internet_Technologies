using it_aud6_mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace it_aud6_mvc.Controllers
{
    public class MoviesController : Controller
    {
        public static Movie movie = new Movie(){ Name="Shrek", DownloadUrl="download", ImageUrl= "https://m.media-amazon.com/images/M/MV5BZDE2ZjIxYzUtZTJjYS00OWQ0LTk2NGEtMDliYmI3MzMwYjhkXkEyXkFqcGdeQWFsZWxvZw@@._V1_QL75_UX500_CR0,0,500,281_.jpg", Rating=5};
        public static List<Client> clients = new List<Client>(){
        new Client(){ Name="Teona", Age=21, Address="VSB", Phone=070000000, Legitimation=1 },
        new Client(){ Name="Kalin", Age=14, Address="VSB", Phone=071111111, Legitimation=2 },
        new Client(){ Name="David", Age=13, Address="SRB", Phone=072222222, Legitimation=3 },
        new Client(){ Name="Bojana", Age=11, Address="SRB", Phone=077777777, Legitimation=4 }
        }; 
        // GET: Movies
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Random()
        {
            MovieRentals movieRentals = new MovieRentals();

            movieRentals.movie = movie;
            movieRentals.clients = clients;

            return View(movieRentals);
        }

        public ActionResult ShowClient(int id)
        {
            var client = clients.ElementAt(id);
            return View(client);
        }
    }
}