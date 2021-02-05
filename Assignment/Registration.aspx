<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Assignment.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            width: 200px;
        }
        .auto-style5 {
            width: 128px;
        }
        .auto-style6 {
            width: 46px;
        }
        .auto-style8 {
            width: 348px;
        }
        .auto-style9 {
            width: 348px;
            height: 26px;
        }
        .auto-style10 {
            height: 26px;
        }
        .auto-style11 {
            width: 348px;
            height: 43px;
        }
        .auto-style12 {
            height: 43px;
        }
    </style>

     <script type="text/javascript">
         function validate() {
             var str = document.getElementById('<%=tb_password.ClientID %>').value;
             document.getElementById("lbl_pwdchecker").innerHTML = "";
             if (str.length < 8) {
                 document.getElementById("lbl_pwdchecker").innerHTML += "Password length must be at least 8 characters <br />";
                 document.getElementById("lbl_pwdchecker").style.color = "Red";
             }

             if (str.search(/[a-z]/) == -1) {
                 document.getElementById("lbl_pwdchecker").innerHTML += "Password length require at least one lowercase letter <br />";
                 document.getElementById("lbl_pwdchecker").style.color = "Red";
             }

             if (str.search(/[A-Z]/) == -1) {
                 document.getElementById("lbl_pwdchecker").innerHTML += "Password length require at least one uppercase letter <br />";
                 document.getElementById("lbl_pwdchecker").style.color = "Red";
             }

             if (str.search(/[0-9]/) == -1) {
                 document.getElementById("lbl_pwdchecker").innerHTML += "Password length require at least one number <br />";
                 document.getElementById("lbl_pwdchecker").style.color = "Red";
             }

             if (str.search(/[^A-Za-z0-9]/) == -1) {
                 document.getElementById("lbl_pwdchecker").innerHTML += "Password length require at least one special character <br />";
                 document.getElementById("lbl_pwdchecker").style.color = "Red";
             }

             if (str.length < 8 && str.search(/[a-z]/) == 1 && str.search(/[A-Z]/) == 1 && str.search(/[0-9]/) ==1 && str.search(/[^A-Za-z0-9]/) == 1) {
                 document.getElementById("lbl_pwdchecker").innerHTML += "Excellent!";
                 document.getElementById("lbl_pwdchecker").style.color = "Blue";
             }
         }

     </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            Registration<br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lbl_fName" runat="server" Text="First Name:"></asp:Label>
                        <br />
                    </td>
                    <td>
                        <asp:TextBox ID="tb_fname" runat="server" CssClass="auto-style3" Width="300px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lbl_lName" runat="server" Text="Last Name:"></asp:Label>
                        <br />
                    </td>
                    <td>
                        <asp:TextBox ID="tb_lname" runat="server" CssClass="auto-style3" Width="300px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Credit Card Number:<br />
                    </td>
                    <td>
                        <asp:TextBox ID="tb_creditNo" runat="server" CssClass="auto-style3" Width="300px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Expiry Date:<br />
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tb_creditExpiry" runat="server" CssClass="auto-style3" Width="120px"></asp:TextBox>
                        <br />
                    </td>
                    <td class="auto-style6">CVV:<br />
                    </td>
                    <td>
                        <asp:TextBox ID="tb_creditCVV" runat="server" CssClass="auto-style3" Width="118px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Email:<br />
                    </td>
                    <td>
                        <asp:TextBox ID="tb_email" runat="server" CssClass="auto-style3" Width="300px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Date of Birth:<br />
                    </td>
                    <td>
                        <asp:TextBox ID="tb_dob" runat="server" CssClass="auto-style3" Width="300px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Password:<br />
                    </td>
                    <td>
                        <asp:TextBox ID="tb_password" runat="server" CssClass="auto-style3" Width="300px" onkeyup="javascript:validate()"></asp:TextBox>
            <asp:Button ID="btn_submit0" runat="server" OnClick="btnComplexity_Click" Text="Check Password Complexity" Width="307px" />
                        <asp:Label ID="lbl_complexity" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lbl_pwdchecker" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style11">\Verification Code</td>
                    <td class="auto-style12">
                        <asp:Image ID="Image1" runat="server" Height="55px" Width="186px" ImageUrl ="~/Captcha.aspx"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style10">
                        <asp:Label ID="lbl_captcha" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Enter Verification Code</td>
                    <td>
                        <asp:TextBox ID="tb_verification" runat="server" CssClass="auto-style3" Width="186px"></asp:TextBox>
                        </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btn_submit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </div>
    </form>
</body>
</html>
