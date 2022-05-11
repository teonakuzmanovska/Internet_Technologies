using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_lab2
{
    public partial class task2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void podnesi_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(iskustvo.Text) < 5)
            {
                poraka.Text = "Nemate dovolno iskustvo";
            }
            else
                poraka.Text = "Dobrodojdovte " + ime.Text;
        }
    }
}