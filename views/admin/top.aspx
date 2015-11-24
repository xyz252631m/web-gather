<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="admin_top" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/blue/bases.css" rel="stylesheet"  title="theme"/>
    <link href="css/blue/index.css" rel="stylesheet" title="theme"/>
    <script src="../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mastertop">
        <div  id="mtop_t">
            <div class="logoimg"></div>
                <asp:Label ID="labip" runat="server" Text=""></asp:Label>
                <asp:LinkButton CssClass="returnindex" ID="linkgoindex" runat="server" onclick="linkgoindex_Click"></asp:LinkButton>
                <asp:LinkButton CssClass="loginout" ID="linkoutlogin" runat="server" onclick="linkoutlogin_Click"></asp:LinkButton>
        </div>
        <div id="mtop_b">
        </div>
    </div>
    </form>
</body>
</html>
