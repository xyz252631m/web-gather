<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZhuRenLogin.aspx.cs" Inherits="admin_ZhuRenLogin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>筑人教育官网后台登录</title>
    <meta   http-equiv="Pragma" content="no-cache"/> 
    <meta   http-equiv="Cache-Control" content="no-cache"/> 
    <meta   http-equiv="Expires" content="0"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/blue/bases.css" />
    <link rel="stylesheet" type="text/css" href="css/blue/Login.css"   title="theme"/>
    <link rel="shortcut icon" type="image/ico" href="images/favicon.ico" />
    <script src="../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/Info.js" type="text/javascript"></script>
    <script src="js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" defaultfocus="TxtUserName" defaultbutton="linklogin">
    <div id="logindiv">
        <div class="loginmain">
            <div class="maintop"></div>
            <div class="maincontents">
                <div class="contentsleft">
                    <div><input  type="text"  class="textbg" id="TxtUserName" maxlength="20" name="TxtUserName"  runat="server"/><span>用户名：</span></div>
                    <div><input type="password" class="textbg"  id="TxtPassword" maxlength="20" name="TxtPassword"  runat="server"/><span>密&nbsp;&nbsp;&nbsp;码：</span></div>
                    <div>
                            <asp:Image ID="Image1" title="点击切换" CssClass="imgwidth" runat="server" onclick="this.src=this.src+'?'" ImageUrl="png.aspx" /><span>验证码：</span>
                            <input  type="text" class="checkwidth" id="txtcheck" maxlength="20" value="0" name="txtcheck"  runat="server"/>
                    </div>
                    <div id="btmlogin">
                        <asp:LinkButton ID="linkloginbtm" OnClientClick="return logincheck()" CssClass="loginbtmbtn" runat="server"  onclick="linklogin_Click"></asp:LinkButton>
                        <input  type="reset"class="loginbtmreset" value=" "  /> 
                    </div>
                </div>
                <div class="contentsright">
                    <asp:LinkButton ID="linklogin" OnClientClick="return logincheck()"  CssClass="loginbtn" runat="server"  onclick="linklogin_Click"></asp:LinkButton>
                </div>
            </div>
            <div class="mainbottom">版权所有：筑人网络 版本V1.0</div>
        </div>
    </div>
      
    </form>
    
</body>
</html>
