using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab_prog_3_tp_3_registros_contables
{
    public partial class Principal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add(new ListItem("0"));
                DropDownList1.Items.Add(new ListItem("1"));
            }
        }

        //seccion cuentas -------------------------------------------------------------------

        //boton agregar cuenta -------------------------------------------------------------------
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool es_repetido = false;
            ListBox2.Items.Clear();
            foreach (ListItem item in ListBox1.Items)
            {
                if (item.Text.ToLower().Equals(TextBox1.Text.ToLower()))
                {
                    es_repetido = true;
                    Label8.Text = "Ya existe el elemento";
                    break;
                } 
            }
           
            if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrWhiteSpace(TextBox1.Text) && !es_repetido)
            {
                int result = SqlDataSource1.Insert();
                if (result != 0)
                {
                    Label8.Text = TextBox1.Text.ToString() + " agregado con exito";
                    TextBox1.Text = "";
                }
                else
                {
                    Label8.Text = "No se pudo completar la operación";
                }
            }
            else
            {
                Label8.Text = es_repetido? "Ya existe el elemento" : "No se permiten campos vacios";
            }
        }

        //permite seleccionar y trae uno seleccionado de la lista al textbox para cuentas-----------------------------
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {     
                TextBox1.Text = reader["descripcion"].ToString();
                Label10.Text= reader["descripcion"].ToString();
                Label9.Visible = true;
                Label10.Visible = true;
            }
            else
            {
                Label9.Visible = false;
                Label10.Visible = false;
            }
        }

        //boton eliminar cuenta-------------------------------------------------------------------
        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Delete();
            if (result != 0)
            {
                Label8.Text = "Eliminado id:" + ListBox1.SelectedValue.ToString() + " -> " + TextBox1.Text;
                TextBox1.Text = "";
                ListBox2.Items.Clear();
            }
            else
            {
                Label8.Text = "No se pudo eliminar el elemento";
            }
        }

        //boton actualizar cuenta-------------------------------------------------------------------
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                SqlDataSource1.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue.ToString();
                SqlDataSource1.UpdateParameters["descripcion"].DefaultValue = TextBox1.Text;
                int result = SqlDataSource1.Update();
                if (result != 0)
                {
                    Label8.Text = "Actualizado id:" + ListBox1.SelectedValue.ToString() + " -> " + TextBox1.Text;
                    TextBox1.Text = "";
                }
                else
                {
                    Label8.Text = "No se pudo actualizar el elemento";
                }
            }
            else
            {
                Label8.Text = "No se permiten campos vacios";
            }


        }

        //boton buscar cuenta-------------------------------------------------------------------
        protected void Button4_Click(object sender, EventArgs e)
        {
            ListBox2.Items.Clear();
            foreach (ListItem item in ListBox1.Items)
            {
                if (!item.Text.ToLower().Contains(TextBox1.Text))
                {
                    item.Attributes.Add("Style","display:none");
                    
                } 
            }
        }
 
        //seccion registros contables -------------------------------


        //boton agregar registro -------------------------------------------------------------------
        protected void Button5_Click(object sender, EventArgs e)
        {
           
            if (!string.IsNullOrEmpty(TextBox2.Text) && !string.IsNullOrWhiteSpace(TextBox2.Text))
            {
                int result = SqlDataSource3.Insert();
                if (result != 0)
                {
                    Label17.Text = "registro agregado con exito";
                    TextBox2.Text = "";
                }
                else
                {
                    Label17.Text = "No se pudo agregar el registro";
                }
            }
            else
            {
                Label17.Text ="No se permiten campos vacios";
            }

        }

        //permite seleccionar y trae uno seleccionado de la lista al textbox para registros-----------------------------
        protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource4.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                TextBox2.Text = reader["monto"].ToString();
                DropDownList1.Items.Clear();
                string tipo = reader["tipo"].ToString();
                DropDownList1.Items.Add(new ListItem(tipo.Equals("True") ? "1" : "0"));
                DropDownList1.Items.Add(new ListItem(tipo.Equals("True") ? "0" : "1"));
            }
        }

        //boton eliminar registro-------------------------------------------------------------------
        protected void Button7_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource3.Delete();
            if (result != 0)
            {
                Label17.Text = "Eliminado id:" + ListBox2.SelectedValue.ToString() + " --- monto: " + TextBox2.Text;
                TextBox2.Text = "";
            }
            else
            {
                Label17.Text = "No se pudo eliminar el elemento";
            }
        }

        //boton actualizar registro -------------------------------------------------------------------
        protected void Button8_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                int result = SqlDataSource3.Update();
                if (result != 0)
                {
                    Label17.Text = "Actualizado id:" + ListBox2.SelectedValue.ToString() + " --- monto: " + TextBox2.Text + " --- tipo: " + DropDownList1.Text;
                    TextBox2.Text = "";
                }
                else
                {
                    Label17.Text = "No se pudo actualizar el elemento";
                }
            }
            else
            {
                Label17.Text = "No se permiten campos vacios";
            }


        }

        //boton buscar registro-------------------------------------------------------------------
        protected void Button6_Click(object sender, EventArgs e)
        {

            foreach (ListItem item in ListBox2.Items)
            {
                if (!item.Text.ToLower().Contains(TextBox2.Text) || !item.Text[item.Text.Length - 1].Equals(DropDownList1.Text[0]))
                {
                    item.Attributes.Add("Style", "display:none");
                }
            }
        }
    }
}