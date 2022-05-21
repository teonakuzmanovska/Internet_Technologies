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
    public static List<Movie> movies = new List<Movie>() {
        new Movie(){ Name="Shrek", DownloadUrl="download", ImageUrl= "https://m.media-amazon.com/images/M/MV5BZDE2ZjIxYzUtZTJjYS00OWQ0LTk2NGEtMDliYmI3MzMwYjhkXkEyXkFqcGdeQWFsZWxvZw@@._V1_QL75_UX500_CR0,0,500,281_.jpg", Rating=5}
        };

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

        public ActionResult GetAllMovies()
        {
            return View(movies);
        }

        public ActionResult NewMovie()
        {
            Movie movie = new Movie();
            return View(movie);
        }

        public ActionResult NewClient()
        {
            Client client = new Client();
            return View(client);
        }

        [HttpPost]
        public ActionResult InsertNewClient(Client client)
        {
            if (!ModelState.IsValid)
            {
                return View("NewClient", client);
            }
            clients.Add(client);
            return View("GetAllMovies", movies);
        }

        [HttpPost]
        public ActionResult InsertNewMovie(Movie movie)
        {
            if (!ModelState.IsValid)
            {
                return View("NewMovie", movie);
            }
            movies.Add(movie);
            return View("GetAllMovies", movies);
        }

        public ActionResult EditMovie(int id)
        {
            var movie = movies.ElementAt(id);
            movie.Id = id;
            return View(movie);
        }
        [HttpPost]
        public ActionResult EditMovie(Movie movie)
        {
            if (!ModelState.IsValid)
            {
                return View("NewMovie", movie);
            }
            var forUpdate = movies.ElementAt(movie.Id);
            forUpdate.Name = movie.Name;
            forUpdate.ImageUrl = movie.ImageUrl;
            forUpdate.DownloadUrl = movie.DownloadUrl;
            forUpdate.Rating = movie.Rating;

            return View("GetAllMovies", movies);
        }
        public ActionResult DeleteMovie(int id)
        {
            movies.RemoveAt(id);
            return View("GetAllMovies", movies);
        }
        public ActionResult ShowMovie(int id)
        {
            MovieRentals movieRentals = new MovieRentals();

            movieRentals.movies = movies.ElementAt(id);
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