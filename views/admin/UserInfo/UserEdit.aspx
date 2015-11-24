<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserEdit.aspx.cs" Inherits="admin_UserInfo_UserEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/edit.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/base.js" type="text/javascript"></script>
    <script src="../js/users.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="alltitle btmheight">
        <div class="left"></div>
        <div class="center">信息编辑</div>
        <span>当前位置：授权管理>>用户管理>> <label id="edit_tile" runat="server">添加用户</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit">
            <div class="edit_top">
                <div><input type="text" id="txtLoginName" name="txtLoginName" runat="server"/><span>用户名：</span></div>
                <div>
                    <asp:DropDownList ID="rdlroles" runat="server">
                    </asp:DropDownList>
                     <span>角 色：</span>
                </div>
                <div>
                    <asp:DropDownList ID="rdlsex" runat="server">
                     <asp:ListItem Selected="True" Value="0">女</asp:ListItem>
                    <asp:ListItem  Value="1">男</asp:ListItem>
                    </asp:DropDownList><span>性 别：</span></div>
                <div><input type="text" id="txtUserName" name="txtUserName" runat="server"/><span>姓 名：</span></div>
                <div><input type="password" id="txttrypwd" name="txttrypwd" runat="server"/><span>密 码：</span></div>
                <div><input type="password" id="txtpwd" name="txtpwd" runat="server"/><span>确认密码：</span></div>

                <div>
                    <asp:DropDownList ID="rdlIsShow" runat="server">
                    <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                    <asp:ListItem  Value="1">是</asp:ListItem>
                    </asp:DropDownList><span>是否启用：</span></div>
                <div><input type="text" id="txtRemarks" name="txtRemarks" runat="server"/><span>备 注：</span></div>
            </div>
            <div class="edit_submit">
                <div><asp:Button ID="btnsutmit" runat="server" Text=" "  CssClass="bgadd"
                        onclick="btnsutmit_Click" OnClientClick="return txtusercheck()" />
                 <input id="btn_return"  runat="server" type="button"    class="bgback"   value=" "/>
                 </div>
            </div>
    </div>
    </form>
</body>
</html>