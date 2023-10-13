using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace des1_lab_prog3
{
    public partial class AutosYMarcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        //inserta marca
        protected void Button5_Click(object sender, EventArgs e)
        {
                if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrWhiteSpace(TextBox1.Text))
                {
                    SqlDataSourceMarcas1.Insert();
                    Label4.Text = TextBox1.Text + " ya fue agregado con éxito";
                }
                else
                {
                    Label4.Text = "No se permiten campos vacíos";
                }
   
        }

        //buscar marca
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                string palabraClave = TextBox1.Text.Trim();
                SqlDataSourceMarcas1.SelectCommand = "SELECT * FROM Marcas WHERE nombre LIKE '%' + @palabraClave + '%'";
                SqlDataSourceMarcas1.SelectParameters.Clear();
                SqlDataSourceMarcas1.SelectParameters.Add("palabraClave", palabraClave);
                GridView1.DataBind();
                if (GridView1.Rows.Count == 0)
                {
                    Label4.Text = "No se encontró la marca, puede agregarla";
                }
            }
            else
            {
                Label4.Text = "Mostrando todas las marcas";
                SqlDataSourceMarcas1.SelectCommand = "SELECT * FROM Marcas";
                SqlDataSourceMarcas1.SelectParameters.Clear();
                GridView1.DataBind();
            }
        }

        //actualizala tabla modelos segun marca seleccionada
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label5.Text = GridView1.SelectedRow.Cells[1].Text;
            string idMarcas = GridView1.SelectedValue.ToString();
            SqlDataSourceModelos1.SelectCommand = "SELECT id,nombre FROM Modelos WHERE idMarcas=@idMarcas";
            SqlDataSourceModelos1.SelectParameters.Clear();
            SqlDataSourceModelos1.SelectParameters.Add("idMarcas", idMarcas);
            GridView2.DataBind();

        }

       

        //inserta modelo
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedValue!=null)
            {
                if (!string.IsNullOrEmpty(TextBox2.Text) && !string.IsNullOrWhiteSpace(TextBox2.Text))
                {
                    SqlDataSourceModelos1.Insert();
                    Label7.Text = TextBox2.Text + " ya fue agregado con éxito";
                }
                else
                {
                    Label7.Text = "No se permiten campos vacíos";
                }
            }
            else
            {
                Label7.Text = "Seleccione una marca";
            }
            
        }


       

        //buscar modelo
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedValue != null)
            {

                if (!string.IsNullOrEmpty(TextBox2.Text) && !string.IsNullOrWhiteSpace(TextBox2.Text))
                {
                    string palabraClave = TextBox2.Text.Trim();
                    string idMarcas = GridView1.SelectedValue.ToString();
                    SqlDataSourceModelos1.SelectCommand = "SELECT id,nombre FROM Modelos WHERE nombre LIKE '%' + @palabraClave + '%' AND idMarcas=@idMarcas";
                    SqlDataSourceModelos1.SelectParameters.Clear();
                    SqlDataSourceModelos1.SelectParameters.Add("idMarcas", idMarcas);
                    SqlDataSourceModelos1.SelectParameters.Add("palabraClave", palabraClave);

                    GridView2.DataBind();
                    if (GridView2.Rows.Count == 0)
                    {
                        Label7.Text = "No se encontró el modelo, puede agregarlo";
                    }
                }
                else
                {
                    Label7.Text = "Mostrando todos los modelos de la marca";
                    string idMarcas = GridView1.SelectedValue.ToString();
                    SqlDataSourceModelos1.SelectCommand = "SELECT id,nombre FROM Modelos WHERE idMarcas=@idMarcas";
                    SqlDataSourceModelos1.SelectParameters.Clear();
                    SqlDataSourceModelos1.SelectParameters.Add("idMarcas", idMarcas);
                    GridView2.DataBind();
                }
            }
            else
            {
                Label7.Text = "Seleccione una marca";
                
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("TodosLosModelos.aspx");
        }

        ///seguir con todos los modelos de todas las marcas


    }
}