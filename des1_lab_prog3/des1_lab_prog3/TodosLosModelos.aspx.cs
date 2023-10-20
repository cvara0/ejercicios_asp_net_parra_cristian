using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace des1_lab_prog3
{
    public partial class TodosLosModelos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                string palabraClave = TextBox1.Text.Trim();
                SqlDataSourceTodos.SelectCommand = "SELECT Automoviles.id AS 'ID Modelo',Automoviles.modelo AS 'Modelo',AutomovilMarcas.id AS 'ID Marca',AutomovilMarcas.nombre AS 'Marca' FROM Automoviles INNER JOIN AutomovilMarcas ON Automoviles.idAutomovilMarca = AutomovilMarcas.id WHERE Automoviles.modelo LIKE '%' + @palabraClave + '%'";
               
                SqlDataSourceTodos.SelectParameters.Clear();
                SqlDataSourceTodos.SelectParameters.Add("palabraClave", palabraClave);

                GridView1.DataBind();
                if (GridView1.Rows.Count == 0)
                {
                    Label2.Text = "No se encontró el modelo";
                }
            }
            else
            {
                Label2.Text = "Mostrando todos los modelos";
                SqlDataSourceTodos.SelectCommand = "SELECT Automoviles.id AS 'ID Modelo',Automoviles.modelo AS 'Modelo',AutomovilMarcas.id AS 'ID Marca',AutomovilMarcas.nombre AS 'Marca' FROM Automoviles INNER JOIN AutomovilMarcas ON Automoviles.idAutomovilMarca=AutomovilMarcas.id";
                GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            Label2.Text = "Mostrando todos los modelos";
            SqlDataSourceTodos.SelectCommand = "SELECT Automoviles.id AS 'ID Modelo',Automoviles.modelo AS 'Modelo',AutomovilMarcas.id AS 'ID Marca',AutomovilMarcas.nombre AS 'Marca' FROM Automoviles INNER JOIN AutomovilMarcas ON Automoviles.idAutomovilMarca=AutomovilMarcas.id";
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AutosYMarcas.aspx");
        }
    }
}