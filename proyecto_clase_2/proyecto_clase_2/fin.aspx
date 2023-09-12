<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fin.aspx.cs" Inherits="proyecto_clase_2.fin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div style="text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Gracias por responder!" Font-Bold="True" Font-Size="16pt"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Ver resultados" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Volver" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
