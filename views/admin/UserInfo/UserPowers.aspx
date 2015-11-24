<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserPowers.aspx.cs" Inherits="admin_UserInfo_UserPowers" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>编辑权限</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/Type.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css" title="theme" />
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/Roles.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="alltitle btmheight">
        <div class="left"></div>
        <div class="center">编辑权限</div>
        <span >当前位置：站点管理>><label id="labtitle" runat="server">编辑权限</label></span>
        <div class="right" style="float:right; right:0px; top:0px"></div>
        <div class="titlebtn"></div>
    </div>
    <div id="divbody">
        <ul id="ulitem" runat="server"  >
             <li><input type="checkbox" name="chkitem" /><span>第一页面</span><label></label></li>
            <li><input type="checkbox"  name="chkitem" /><span>第一页面</span><label><img onclick="imgclick(this)" src="../images/elbow-minus.gif" /></label></li>
            <ul class="ulhide">
                <li><input type="checkbox" name="chkitem" />
                    <span>第一页面</span><label></label>
                </li>
                <li>
                    <input type="checkbox" name="chkitem" />
                    <span>第一页面</span>
                    <label><img onclick="imgclick(this)" src="../images/elbow-minus.gif" /></label>
                 </li>
                <ul class="ulhide">
                    <li><input type="checkbox" name="chkitem" /><span>第一页面</span><label></label></li>
                    <li><input type="checkbox" name="chkitem" /><span>第一页面</span><label></label></li>
                </ul>
            </ul>
        </ul>
    </div>
    <div  id="power_submit">
        <asp:Button ID="butsave" runat="server" CssClass="bgupdate" Text=" " onclick="butsave_Click" />
        <input id="btn_return"  runat="server" class="bgback" type="button"     value=" "/>
    </div>
    </form>

</body>
</html>
