<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ver.aspx.cs" Inherits="proyecto_clase_2.ver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Resultados de la encuesta" Font-Size="18pt"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Conformidad con la clase" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Conformes ------ "></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="No conformes --- "></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Aspectos a mejorar" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Ninguno ----------------------- "></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Marco teórico ----------------- "></asp:Label>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Trabajos prácticos ------------ "></asp:Label>
            <br />
            <asp:Label ID="Label9" runat="server" Text="Más tiempo de clase ----------- "></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="Menos tiempo de clase -------- "></asp:Label>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Atención docente ------------- "></asp:Label>
            <br />
            <asp:Label ID="Label12" runat="server" Text="Interacción docente-alumno --- "></asp:Label>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Interacción alumno-alumno ---- "></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Volver al inicio" />
        </div>
    </form>
</body>
</html>
