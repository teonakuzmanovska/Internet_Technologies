using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_lab2
{
    public partial class task1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!this.IsPostBack)
            {
                string[] meseci = { "Januari", "Fevruari", "Mart", "April", "Maj", "Juni", 
                    "Juli", "Avgust", "Septemvri", "Oktomvri", "Noemvri", "Dekemvri" };
                
                ddlMesec.DataSource = meseci;
                ddlMesec.DataBind();
                
                for (var i = 1; i <= 31; i++)
                {
                    ddlDen.Items.Add(i.ToString());
                }

                for(var i=2022; i<=2026; i++)
                {
                    ddlGodina.Items.Add(i.ToString());
                }

                for(var i=0; i<= 24; i++)
                {
                    string chas = "0";
                    string vreme = ":00";
                    if(i.ToString().Length < 2)
                        chas = chas + i.ToString();
                    else 
                        chas = i.ToString();

                    vreme = chas + vreme;

                    ddlVreme.Items.Add(vreme);
                }
            }
           
        }

        protected void btnPodnesi_Click(object sender, EventArgs e)
        {
            lblPatnik.Text = txtIme.Text + " " + txtPrezime.Text;
            lblSredstvo.Text = lstSredstvo.SelectedItem.Text;
            lblOd.Text = ddlOd.SelectedItem.Text;
            lblDo.Text = ddlDo.SelectedItem.Text;
            lblVreme.Text = ddlVreme.SelectedItem.Text;

            lblZona.Text = rblZona.SelectedItem.Text;
            lblKlasa.Text = rblKlasa.SelectedItem.Text;
            lblPosluga.Text = cblPosluga.SelectedItem.Text;

            imgSlika.ImageUrl = lstSredstvo.SelectedItem.Value;

            pnlPanela1.Visible = true;
        }
    }
}