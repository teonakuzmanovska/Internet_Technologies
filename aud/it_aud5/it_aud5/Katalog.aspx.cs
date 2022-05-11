using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_aud5
{
    public partial class Katalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void StruchnaLiteratura_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proizvodi.aspx?catId=1&name=Struchna+Literatura");
        }

        protected void Beletristika_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proizvodi.aspx?catId=2&name=Beletristika");
        }

        protected void Magazini_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proizvodi.aspx?catId=3&name=Magazini");
        }
    }
}