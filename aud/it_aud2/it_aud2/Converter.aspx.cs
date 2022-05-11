using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_aud2
{
    public partial class Converter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                List<ListItem> listItems = new List<ListItem>();

                ListItem listItem1 = new ListItem("Eur", "62");
                ListItem listItem2 = new ListItem("Dollar", "55");

                listItems.Add(listItem1);
                listItems.Add(listItem2);

                ListaValuti.DataSource = listItems;

                ListaValuti.DataTextField = "Text";
                ListaValuti.DataValueField = "Value";

                ListaValuti.DataBind();
            }

        }

        protected void DodadiValuta_Click(object sender, EventArgs e)
        {
            var text = ImeNaValuta.Text;
            var value = VrednostNaValuta.Text;

            bool isNumber = Double.TryParse(value, out double realValue);

            if (!string.IsNullOrEmpty(text) && isNumber)
            {
                ListaValuti.Items.Add(new ListItem(text, value));
                brojNaValuti();
            }

            ImeNaValuta.Text = "";
            VrednostNaValuta.Text = "";
        }

        protected void IzbrishiValuta_Click(object sender, EventArgs e)
        {
            if(ListaValuti.SelectedIndex != -1)
            {
                ListaValuti.Items.Remove(ListaValuti.SelectedItem);
                brojNaValuti();
                Status.Text = "";
                Rezultat.Text = "";
            }
            else
            {
                Status.Text = "Nemate odbrano valuta";
            }
        }

        private void brojNaValuti()
        {
            BrojNaValuti.Text = ListaValuti.Items.Count.ToString();
        }

        protected void ListaValuti_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedItem = ListaValuti.SelectedItem;

            var text = selectedItem.Text;
            var value = selectedItem.Value;

            var insertValue = ZaKonvertiranje.Text;

            bool isNumber = Double.TryParse(value, out double realValue);
            bool isDouble = Double.TryParse(insertValue, out double realInsertValue);

            if (!string.IsNullOrEmpty(text) && isNumber && isDouble)
            {
                Rezultat.Text = (realInsertValue * realValue) + " ДЕН";
                Status.Text = "";
            }

            else
            {
                Rezultat.Text = "";
            }

        }
    }
}