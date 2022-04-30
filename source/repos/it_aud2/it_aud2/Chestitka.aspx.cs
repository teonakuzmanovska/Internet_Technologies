using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace it_aud2
{
    public partial class Chestitka : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Background.Items.Add(new ListItem("Green"));
            Background.Items.Add(new ListItem("Blue"));
            Background.Items.Add(new ListItem("Red"));
            Background.Items.Add(new ListItem("Pink")); 

            Font.Items.Add(new ListItem("Times New Roman"));
            Font.Items.Add(new ListItem("Arial"));

            FontColor.Items.Add(new ListItem("Green"));
            FontColor.Items.Add(new ListItem("Blue"));
            FontColor.Items.Add(new ListItem("Red"));
            FontColor.Items.Add(new ListItem("Pink"));

            // zoshto kastirame vo int?

            Border.Items.Add(new ListItem(BorderStyle.Dotted.ToString(), ((int)BorderStyle.Dotted).ToString()));
            Border.Items.Add(new ListItem(BorderStyle.Dashed.ToString(), ((int)BorderStyle.Dashed).ToString()));
            Border.Items.Add(new ListItem(BorderStyle.Solid.ToString(), ((int)BorderStyle.Solid).ToString()));

            // fontsize slika

            

        }

        protected void Kreiraj_Click(object sender, EventArgs e)
        {
            Poraka.Text = Sodrzhina.Text;

            Poraka.Font.Name = Font.SelectedItem.Text;

            var success = Int32.TryParse(FontSize.Text, out int fontSize);

            if (success)
            {
                Poraka.Font.Size = fontSize;
            }

            Poraka.BackColor = Color.FromName(Background.SelectedItem.Text);
            Poraka.ForeColor = Color.FromName(FontColor.SelectedItem.Text);

            // TO-DO: sredi go error-ov
            //Poraka.BorderStyle = BorderStyle.FromName(Border.SelectedItem.Text);

            if (Slika.Checked)
            {
                Image.Visible = true;
            }

        }
    }
}