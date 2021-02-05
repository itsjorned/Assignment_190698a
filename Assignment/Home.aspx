<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Assignment.Home" %>

<!DOCTYPE html>
<script runat="server">

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <legend>HomePage</legend>

                <br />

                <asp:Label ID="lbl_message" runat="server" EnableViewState="false" />
                <br />
                <br />

                <asp:Button ID ="btnLogout" runat="server" Text="Logout" Visible="false" OnClick="LogoutMe" />

                <p />

            </fieldset>
        </div>
    </form>
</body>
</html>
