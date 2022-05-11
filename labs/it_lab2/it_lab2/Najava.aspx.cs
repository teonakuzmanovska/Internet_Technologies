using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_lab2
{
    public partial class Najava : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //    if (Convert.ToInt32(ViewState["obidi"]) == 3)
            //    {
            //        btnPodnesi.Enabled = false;
            //        lblObidi.Text = "Ja nadminavte kvotata na dozvoleni obidi";
            //    }
            //}
            
        }

        protected void btnPodnesi_Click(object sender, EventArgs e)
        {
            if(txtLozinka.Text == "mb")
            {
                Session["korisnik"] = txtKorisnik.Text;
                Response.Redirect("GlavnaStranica.aspx");
            }
        }

        protected void txtLozinka_TextChanged(object sender, EventArgs e)
        {
            if (ViewState["obidi"] == null)
            {
                ViewState["obidi"] = 1;
            }

            else if (Convert.ToInt32(ViewState["obidi"]) == 3)
            {
                btnPodnesi.Enabled = false;
                lblObidi.Text = "Ja nadminavte kvotata na dozvoleni obidi";
            }

            else
            {
                ViewState["obidi"] = Convert.ToInt32(ViewState["obidi"]) + 1;
            }

            //lblObidi.Text = ViewState["obidi"].ToString();
        }
    }
}