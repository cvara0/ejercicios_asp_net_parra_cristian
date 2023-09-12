using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto_clase_2
{
    public partial class ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<int> listaDeTodosEnteros = new List<int>();
            if (File.Exists($"{Server.MapPath(".")}/resultados.txt"))
            {
                StreamReader streamReader = new StreamReader($"{Server.MapPath(".")}/resultados.txt");
                List<string> listaDeTodosCadena = new List<string>(streamReader.ReadToEnd().Split('\n'));
                streamReader.Close();
                listaDeTodosCadena.RemoveAt(listaDeTodosCadena.Count - 1);
                listaDeTodosEnteros = listaDeTodosCadena.Select(int.Parse).ToList();
                //recortar lista todos cadena 2 primeros para conformidad el resto para aspectos
                List<int> listaConformidad = listaDeTodosEnteros.GetRange(0,2);

                List<int> listaAspectos = listaDeTodosEnteros.GetRange(2, listaDeTodosEnteros.Count-2);

                int sumaConformidad = listaConformidad.Sum();
                int sumaAspectos = listaAspectos.Sum();
                List<string> listaPorcentajesConformidad = new List<string>();
                List<string> listaPorcentajesAspectos = new List<string>();
                
                foreach (float item in listaConformidad)
                {
                    listaPorcentajesConformidad.Add((item/sumaConformidad).ToString("0.00%"));
                }
                foreach (float item in listaAspectos)
                {
                    listaPorcentajesAspectos.Add((item / sumaAspectos).ToString("0.00%"));
                }
                Label3.Text += listaPorcentajesConformidad[0];
                Label4.Text += listaPorcentajesConformidad[1];
                Label6.Text += listaPorcentajesAspectos[0];
                Label7.Text += listaPorcentajesAspectos[1];
                Label8.Text += listaPorcentajesAspectos[2];
                Label9.Text += listaPorcentajesAspectos[3];
                Label10.Text += listaPorcentajesAspectos[4];
                Label11.Text += listaPorcentajesAspectos[5];
                Label12.Text += listaPorcentajesAspectos[6];
                Label13.Text += listaPorcentajesAspectos[7];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("formulario.aspx");
        }
    }
}