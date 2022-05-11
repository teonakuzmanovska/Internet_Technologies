using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab1
{
    public partial class World : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static int prodadeniKarti = 0;
        static int promet = 0;

        static int kartiShalter1 = 0;
        static int kartiShalter2 = 0;
        static int kartiShalter3 = 0;

        static int prometShalter1 = 0;
        static int prometShalter2 = 0;
        static int prometShalter3 = 0;

        protected void Vnesi_Click(object sender, EventArgs e)
        {
            Int32.TryParse(Grad.SelectedValue, out int cenaGrad);
            Int32.TryParse(Shalter.SelectedValue, out int brojShalter);

            if (brojShalter == 1)
            {
                prometShalter1 += cenaPoShalter(cenaGrad);
                kartiShalter1 += 1;
            }

            if (brojShalter == 2)
            {
                prometShalter2 += cenaPoShalter(cenaGrad);
                kartiShalter2 += 1;
            }

            if (brojShalter == 3)
            {
                prometShalter3 += cenaPoShalter(cenaGrad);
                kartiShalter3 += 1;
            }

            prodadeniKarti += 1;
            promet += cenaPoShalter(cenaGrad);

            vkupenPromet.Text = promet.ToString();
            vkupnoKarti.Text = prodadeniKarti.ToString();


            uspeshnost.Text = (prodadeniKarti / (kartiShalter1 + kartiShalter2 + kartiShalter3) * 100).ToString() + "%";

            Ime.Text = "";
            Prezime.Text = "";
            Vozrast.Text = "";
        }

        private int cenaPoShalter(int cenaGrad)
        {
            var cenaShalter = 2000;
            cenaShalter *= cenaGrad;

            return cenaShalter;
        }

        protected void ProveriShalteri_Click(object sender, EventArgs e)
        {
            Int32.TryParse(ShalterProverka.SelectedValue, out int brojShalter);

            if (brojShalter == 1)
            {
                kartiPoShalter.Text = "1: " + kartiShalter1.ToString();
                prometPoShalter.Text = "1: " + prometShalter1.ToString();
            }

            if (brojShalter == 2)
            {
                kartiPoShalter.Text = "2: " + kartiShalter2.ToString();
                prometPoShalter.Text = "2: " + prometShalter2.ToString();
            }

            if (brojShalter == 3)
            {
                kartiPoShalter.Text = "3: " + kartiShalter3.ToString();
                prometPoShalter.Text = "3: " + prometShalter3.ToString();
            }
        }
    }
}