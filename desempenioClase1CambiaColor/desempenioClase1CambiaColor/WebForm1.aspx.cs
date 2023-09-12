using System;
using System.Linq;
using System.Web.UI.WebControls;
using System.Drawing;

namespace desempenioClase1CambiaColor
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Color[] todosColores=typeof(Color).GetProperties()
                .Where(p => p.PropertyType==typeof(Color))
                .Select(p=> (Color)p.GetValue(null)).ToArray();
            if (!IsPostBack) {
                foreach (Color c in todosColores) { 
                    ListItem amarillo= new ListItem(c.Name, c.Name);
                    DropDownList1.Items.Add(amarillo);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.BackColor= Color.FromName(DropDownList1.SelectedValue);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        { 
            Button1.BackColor = Color.FromName(DropDownList1.SelectedValue);
        }
    }
}