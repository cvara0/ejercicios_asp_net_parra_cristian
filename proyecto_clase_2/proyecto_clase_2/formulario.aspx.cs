using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.IO;

namespace proyecto_clase_2
{
    public partial class formulario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Enabled = false;

            Button1.Enabled = (
                   CheckBox1.Checked 
                || CheckBox2.Checked 
                || CheckBox3.Checked
                || CheckBox4.Checked
                || CheckBox5.Checked
                || CheckBox6.Checked
                || CheckBox7.Checked
                || CheckBox8.Checked
                ) 
                && (RadioButton1.Checked || RadioButton2.Checked);
        }

        public List<int> getListaDeTodos(){
            List<int> listaDeTodos = new List<int>
            {
                RadioButton1.Checked ? 1 : 0,
                RadioButton2.Checked ? 1 : 0,
                CheckBox1.Checked ? 1 : 0,
                CheckBox2.Checked ? 1 : 0,
                CheckBox3.Checked ? 1 : 0,
                CheckBox4.Checked ? 1 : 0,
                CheckBox5.Checked ? 1 : 0,
                CheckBox6.Checked ? 1 : 0,
                CheckBox7.Checked ? 1 : 0,
                CheckBox7.Checked ? 1 : 0
            };

            return listaDeTodos;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            List<int> listaEnteros = new List<int>();
            if (File.Exists($"{Server.MapPath(".")}/resultados.txt"))
            {
                StreamReader streamReader = new StreamReader($"{Server.MapPath(".")}/resultados.txt");
                List<string> listaCadena =new List<string>(streamReader.ReadToEnd().Split('\n'));
                listaCadena.RemoveAt(listaCadena.Count-1);
                listaEnteros = listaCadena.Select(int.Parse).ToList();
                streamReader.Close();
            }
            else
            {
                listaEnteros = Enumerable.Repeat(0, 10).ToList();
            }

            StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/resultados.txt");
           
            List<int> listaAspectos = getListaDeTodos();

            for (int i = 0; i < listaAspectos.Count; i++)
            {
                streamWriter.WriteLine(listaAspectos[i] + listaEnteros[i]);
            }
            streamWriter.Close();
           Response.Redirect("fin.aspx");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                CheckBox2.Enabled = false;
                CheckBox3.Enabled = false;
                CheckBox4.Enabled = false;
                CheckBox5.Enabled = false;
                CheckBox6.Enabled = false;
                CheckBox7.Enabled = false;
                CheckBox8.Enabled = false;

                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
                CheckBox7.Checked = false;
                CheckBox8.Checked = false;
            }
            else
            {
                CheckBox2.Enabled = true;
                CheckBox3.Enabled = true;
                CheckBox4.Enabled = true;
                CheckBox5.Enabled = true;
                CheckBox6.Enabled = true;
                CheckBox7.Enabled = true;
                CheckBox8.Enabled = true;
            }
        }


    }
}