<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="lab_prog_3_tp_3_registros_contables.Principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Registros Contables App - Parra Cristian VR" style="text-align: center; font-size: x-large;"></asp:Label>
            <br />
            <asp:Label ID="Label18" runat="server" Text="----------------------------------------------------------"></asp:Label>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Cuentas" style="font-size: x-large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Entrada / Seleccionado: "></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="153px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="Button4" runat="server" Text="Buscar" OnClick="Button4_Click" Width="70px" />
            <br />
            
            <br />
            <asp:Button ID="Button2" runat="server" Text="Actualizar" style="margin-left: 0px" Width="70px" OnClick="Button2_Click" />
             &nbsp;
             <asp:Button ID="Button3" runat="server" Text="Eliminar" OnClick="Button3_Click" Width="70px" />
            &nbsp;
            <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" Width="70px" />
            <br />
            
            <asp:Label ID="Label8" runat="server"></asp:Label>

            <br />
            <asp:ListBox ID="ListBox1" runat="server" Width="222px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Height="80px"></asp:ListBox>
            
            <br />
            <asp:Label ID="Label19" runat="server" Text="----------------------------------------------------------"></asp:Label>
            <br />
            <asp:Label ID="Label14" runat="server" style="font-size: x-large" Text="Registros Contables"></asp:Label>
            
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Cuenta: "></asp:Label>
            
            <asp:Label ID="Label10" runat="server" style="font-size: x-large"></asp:Label>
            
            <br />
            
            <br />
            
            <asp:Label ID="Label11" runat="server" Text="Entrada / Seleccionado"></asp:Label>
            
            <br />
            <asp:Label ID="Label12" runat="server" Text="Monto: "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" Width="60px"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="Label15" runat="server" Text="Tipo: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Width="60
                px">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" Text="Buscar" OnClick="Button6_Click" Width="70px" />
            <br />
            <br />
            <asp:Button ID="Button7" runat="server" Text="Eliminar" OnClick="Button7_Click" Width="70px" />
            &nbsp;
            <asp:Button ID="Button8" runat="server" Text="Actualizar" Width="70px" OnClick="Button8_Click" />
            &nbsp;&nbsp;<asp:Button ID="Button5" runat="server" Text="Agregar registro" Width="111px" OnClick="Button5_Click" />
            <br />
            <asp:Label ID="Label17" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label16" runat="server" Text="ID --- Monto --- Tipo"></asp:Label>
            <br />
            <asp:ListBox ID="ListBox2" runat="server" Height="82px" Width="227px" DataSourceID="SqlDataSource3" DataTextField="todos" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged"></asp:ListBox>
            
            <br />
            
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tp_3CadenaConexion %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @idCuenta" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" ProviderName="<%$ ConnectionStrings:tp_3CadenaConexion.ProviderName %>" SelectCommand="SELECT * FROM [Cuentas] ORDER BY [descripcion]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tp_3CadenaConexion %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([id] = @idCuenta)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:tp_3CadenaConexion %>" SelectCommand="SELECT id,monto,tipo,CONCAT(CONVERT(VARCHAR, id), ' --- ', CONVERT(VARCHAR, monto), ' --- ', CONVERT(VARCHAR, tipo)) AS todos
 FROM [RegistrosContables] WHERE ([idCuenta] = @idCuenta)" InsertCommand="INSERT INTO [RegistrosContables] ([monto],[tipo],[idCuenta]) VALUES (CONVERT(INT,@monto),CONVERT(BIT,@tipo),@idCuenta)" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" UpdateCommand="UPDATE [RegistrosContables] SET [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="ListBox2" Name="id" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="monto" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="tipo" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" DefaultValue="" Name="idCuenta" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="monto" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="tipo" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ListBox2" Name="id" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:tp_3CadenaConexion %>" SelectCommand="SELECT * FROM [RegistrosContables] WHERE ([id] = @id)">
            <InsertParameters>
                <asp:ControlParameter ControlID="ListBox2" Name="id" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox2" Name="id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
