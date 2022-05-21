using it_lab3_mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace it_lab3_mvc.Controllers
{
    public class FriendController : Controller
    {

        public static List<Friend> friends = new List<Friend>() {
        new Friend(){ Ime="Teona", MestoZhiveenje="VSB"},
        new Friend(){ Ime="Kalin", MestoZhiveenje="VSB"}
        };
        // GET: Friend
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetAllFriends()
        {
            return View(friends);
        }
        public ActionResult NewFriend()
        {
            Friend friend = new Friend();
            return View(friend);
        }
        [HttpPost]
        public ActionResult InsertNewFriend(Friend friend)
        {
            if (!ModelState.IsValid)
            {
                return View("NewFriend", friend);
            }
            else
            {
                friends.Add(friend);
                return View("GetAllFriends", friends);
            }
        }
        public ActionResult EditFriend(int id)
        {
            var friend = friends.ElementAt(id);
            friend.id = id;
            return View(friend);
        }
        [HttpPost]
        public ActionResult EditFriend(Friend friend)
        {
            if (!ModelState.IsValid)
            {
                return View("NewFriend", friend);
            }
            var forUpdate = friends.ElementAt(friend.id);
            forUpdate.Ime = friend.Ime;
            forUpdate.MestoZhiveenje = friend.MestoZhiveenje;

            return View("GetAllFriends", friends);
        }

        public ActionResult DeleteFriend(int id)
        {
            friends.RemoveAt(id);
            return View("GetAllFriends", friends);
        }
    }
}