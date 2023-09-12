using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto_clase_2
{
    public partial class fin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = "( Resultados guardados en: "+ Server.MapPath(".")+" )";
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("formulario.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ver.aspx");
        }
    }
}