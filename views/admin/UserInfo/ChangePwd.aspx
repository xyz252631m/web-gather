<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="admin_UserInfo_ChangePwd" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>修改密码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/edits.css" rel="stylesheet" type="text/css"  title="theme"/>
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
        <div class="center">资讯编辑</div>
        <span>当前位置：资讯信息管理>><label id="edit_tile" >修改密码</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div id="changePwd" class="edit">
            <div class="edit_top">
                <div><input type="password" id="txtoldPwd" name="txttryPwd" runat="server"/><span>原密码：</span></div>
                <div><input type="password" id="txttryPwd" name="txttryPwd" runat="server"/><span>新密码：</span></div>
                <div><input type="password" id="txtNewPwd" name="txtPwd" runat="server"/><span>密码确认：</span></div>
              </div>
            <div class="edit_submit">
                <div><asp:Button ID="btnsutmit" runat="server" Text=" "  CssClass="bgchangepwd"
                        onclick="btnsutmit_Click" OnClientClick="return txtpwdcheck()" />
                        <input  type="reset" class="bgreset"  value=" "/>
                 </div>
            </div>
    </div>
    </form>
</body>
</html>