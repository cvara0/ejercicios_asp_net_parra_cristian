<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formulario.aspx.cs" Inherits="proyecto_clase_2.formulario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <div style="text-align: left">
            <asp:Label ID="Label1" runat="server" Text="Encuesta Clase 2" Font-Bold="True" Font-Size="18pt"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="¿Esta conforme con la clase de hoy?" Font-Bold="True" Font-Size="14pt"></asp:Label>
            <br />
            
            <asp:RadioButton ID="RadioButton1" runat="server" Text="Si" AutoPostBack="True" GroupName="RadioButtons" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="RadioButton2" runat="server" Text="No" AutoPostBack="True" GroupName="RadioButtons" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Aspectos a mejorar" Font-Bold="True" Font-Size="14pt"></asp:Label>
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Ninguno" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"/>
            <br />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="Marco teórico" AutoPostBack="True" />
            <br />
            <asp:CheckBox ID="CheckBox3" runat="server" Text="Trabajos prácticos" AutoPostBack="True" />
            <br />
            <asp:CheckBox ID="CheckBox4" runat="server" Text="Más tiempo de clase" AutoPostBack="True" />
            <br />
            <asp:CheckBox ID="CheckBox5" runat="server" Text="Menos tiempo de clase" AutoPostBack="True" />
            <br />
            <asp:CheckBox ID="CheckBox6" runat="server" Text="Atención docente" AutoPostBack="True" />
            <br />
            <asp:CheckBox ID="CheckBox7" runat="server" Text="Interacción docente-alumno" AutoPostBack="True" />
            <br />
            <asp:CheckBox ID="CheckBox8" runat="server" Text="Interacción alumno-alumno" AutoPostBack="True" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Continuar" OnClick="Button1_Click" />
          
        </div>
        
    </form>
</body>
</html>
