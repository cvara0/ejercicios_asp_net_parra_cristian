<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutosYMarcas.aspx.cs" Inherits="des1_lab_prog3.AutosYMarcas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: left">
            <asp:Label ID="Label1" runat="server" Text="Marcas y Modelos de Automóviles" style="font-size: x-large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="----- Marcas -----" style="font-weight: 700; font-size: x-large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Buscar/Agregar Marca" style="font-size: small"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Buscar" Width="60px" OnClick="Button1_Click" />
            &nbsp;
            <asp:Button ID="Button5" runat="server" Text="Agregar" OnClick="Button5_Click" Width="60px" />
            <br />
            <asp:Label ID="Label4" runat="server" ></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceMarcas1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="id" >
                    <HeaderStyle Font-Italic="False" Font-Strikeout="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nombre" HeaderText="Marca" SortExpression="nombre" />
                    <asp:CommandField ButtonType="Button" DeleteText="X" EditText="E" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <asp:Label ID="Label8" runat="server" Text="----- Modelos -----" style="font-weight: 700; font-size: x-large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Marca --> "></asp:Label>
            <asp:Label ID="Label5" runat="server" style="font-size: x-large" ></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Buscar/Agregar Modelo" style="font-size: small"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp; <asp:Button ID="Button2" runat="server" Text="Buscar" Width="60px" OnClick="Button2_Click" />
            &nbsp;
            <asp:Button ID="Button4" runat="server" Text="Agregar" Width="60px" OnClick="Button4_Click" />
            <br />
            <asp:Label ID="Label7" runat="server"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceModelos1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" DeleteText="X" EditText="E" ButtonType="Button" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <br />
            <asp:Button ID="Button3" runat="server" Text="Ver todos los modelos de todas las marcas" Width="275px" OnClick="Button3_Click" />
            <br />
        </div>
        <br />
        <asp:SqlDataSource ID="SqlDataSourceMarcas1" runat="server" ConnectionString="<%$ ConnectionStrings:lab_prog_3_des_1ConnectionString %>" SelectCommand="SELECT * FROM [Marcas] ORDER BY nombre" DeleteCommand="DELETE FROM [Marcas] WHERE [id] = @id" InsertCommand="INSERT INTO [Marcas] ([nombre]) SELECT UPPER(@nombre) WHERE NOT EXISTS (SELECT * FROM Marcas WHERE nombre=@nombre)" UpdateCommand="UPDATE [Marcas] SET [nombre] = UPPER(@nombre) WHERE [id] = @id AND NOT EXISTS (SELECT * FROM Marcas WHERE nombre=@nombre)">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSourceModelos1" runat="server" ConnectionString="<%$ ConnectionStrings:lab_prog_3_des_1ConnectionString %>" DeleteCommand="DELETE FROM [Modelos] WHERE [id] = @id" InsertCommand="INSERT INTO [Modelos] ([nombre], [idMarcas]) SELECT UPPER(@nombre), @idMarcas WHERE NOT EXISTS (SELECT * FROM Modelos WHERE nombre=@nombre AND idMarcas=@idMarcas)" SelectCommand="SELECT id,nombre FROM [Modelos] WHERE idMarcas=@idMarcas" UpdateCommand="UPDATE [Modelos] SET [nombre] = UPPER(@nombre), [idMarcas] = @idMarcas WHERE [id] = @id AND NOT EXISTS (SELECT * FROM Modelos WHERE nombre=@nombre)">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="nombre" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="GridView1" Name="idMarcas" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="idMarcas" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:ControlParameter ControlID="GridView1" Name="idMarcas" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GridView2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
