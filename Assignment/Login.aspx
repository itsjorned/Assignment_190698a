<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="tb_username" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="tb_password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click" Height="28px" />
            <br />
            <br />
            <asp:Label ID="lbl_message" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
