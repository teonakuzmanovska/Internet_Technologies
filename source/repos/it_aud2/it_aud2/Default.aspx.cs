using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_aud2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PrikazhiGrad_Click(object sender, EventArgs e)
        {
            //ListItem selectedItem = ListaGradovi.SelectedItem;

            ListItemCollection selectedItems = ListaGradovi.Items;

            SelektiranGrad.Text = "";
            Oddalechenost.Text = "";

            foreach (ListItem item in selectedItems)
            {
                if (item.Selected)
                {
                    SelektiranGrad.Text += "<br/>" + item.Text;
                    Oddalechenost.Text += "<br/>" + item.Value + "km.";
                }
                
            }
            
        }
    }
}