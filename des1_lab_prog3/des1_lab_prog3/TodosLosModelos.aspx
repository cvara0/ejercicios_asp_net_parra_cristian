<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TodosLosModelos.aspx.cs" Inherits="des1_lab_prog3.TodosLosModelos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Todos los Modelos y sus Marcas" style="font-size: x-large; "></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Buscar Modelo" style="font-size: small"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Limpiar" OnClick="Button2_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Volver" OnClick="Button3_Click" />
            <br />
            <asp:Label ID="Label2" runat="server" ></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSourceTodos" GridLines="Horizontal" style="text-align: center" AllowSorting="True">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceTodos" runat="server" ConnectionString="<%$ ConnectionStrings:lab_prog_3_des_1ConnectionString %>" DeleteCommand="DELETE FROM [Modelos] WHERE [id] = @id" InsertCommand="INSERT INTO [Modelos] ([nombre], [idMarcas]) VALUES (@nombre, @idMarcas)" SelectCommand="SELECT Modelos.id AS 'ID Modelo',Modelos.nombre AS 'Modelo',Marcas.id AS 'ID Marca',Marcas.nombre AS 'Marca' FROM Modelos INNER JOIN Marcas ON Modelos.idMarcas=Marcas.id" UpdateCommand="UPDATE [Modelos] SET [nombre] = @nombre, [idMarcas] = @idMarcas WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="idMarcas" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="idMarcas" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
