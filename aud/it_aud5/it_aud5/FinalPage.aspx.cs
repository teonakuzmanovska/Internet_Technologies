using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_aud5
{
    public partial class Final : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            kupeni.DataTextField = "Text";
            kupeni.DataValueField = "Value";

            kupeni.DataSource = Session["koshnichka"];
            kupeni.DataBind();

            int total = 0;

            foreach(ListItem li in kupeni.Items)
            {
                total += Convert.ToInt32(li.Value);
            }

            vkupno.Text = "Vkupno ($ " + total.ToString() +")";
        }
    }
}