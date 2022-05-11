using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_aud5
{
    public partial class Plakjanje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                koshnichka.DataTextField = "Text";
                koshnichka.DataValueField = "Value";

                koshnichka.DataSource = Session["koshnichka"];
                koshnichka.DataBind();

                int totalValue = 0;

                foreach(ListItem li in koshnichka.Items)
                {
                    totalValue += Convert.ToInt32(li.Value);
                }
                kupi.Text = "Kupi ($ " + totalValue.ToString() + ")";
            }
        }

        protected void kupi_Click(object sender, EventArgs e)
        {
            Response.Redirect("Final.aspx");
        }
    }
}