using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_lab2
{
    public partial class GlavnaStranica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                labela.Text = "Dobrodojde " + Session["korisnik"];
            }
        }
    }
}