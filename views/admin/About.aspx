<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="admin_About" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>起始页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/blue/bases.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="css/blue/index.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/Theme.js" type="text/javascript"></script>
</head>
<body>
<div  class="divrelative">
<form id="form1" runat="server">
    <div id="abouttop">
        <div class="left"></div>
        <div class="center">欢迎界面</div>
        <div class="right"></div>
    </div>
    <div id="aboutmain">
        <div class="left"></div>
        <div class="center">
            <div class="top_title">感谢您使用 筑人网络 网站管理系统程序</div>
            <dl id="main_tip">
                <dt>提示：</dt>
                <dd>您现在使用的是筑人网络开发的一套用于构建商务信息类门户型网站的专业系统！如果您有任何疑问请点左下解的在线客服进行咨询！</dd>
                <dd>七大栏目完美整合，一站通使用方式，功能强大，操作简单，后台操作易如反掌，只需会打字，会上网，就会管理网站！</dd>
                <dd> 此程序是您建立地区级商家信息门户的首选方案！</dd>
            </dl>
            <dl id="main_info">
                <dt></dt>
                <dd>当前时间：<label id="txtnowtime" runat="server"></label></dd>
                <dd class="txtloginname"><label id="txtloginname" runat="server"></label></dd>
                <dd>欢迎进入网站管理中心！</dd>
            </dl>
            <div id="user_title"><div>您的相关信息</div></div>
            <div id="user_info">
                <dl>
                    <dt>登陆帐号：</dt><dd><label id="txtloginnametwo" runat="server"></label></dd>
                    <dt>真实姓名：</dt><dd><label id="txtuname" runat="server"></label></dd>
                    <dt>注册时间：	</dt><dd><label id="txtregtime" runat="server"></label></dd>
                    <dt>登陆次数：</dt><dd><label id="txtloginlength" runat="server"></label></dd>
                    <dt>上线时间：</dt><dd><label id="txtStartTime" runat="server"></label></dd>
                    <dt>网站IP地址：</dt><dd><label id="txtserverip" runat="server"></label></dd>
                    <dt>网站客服QQ：</dt><dd><label id="txtkefuqq" runat="server"></label></dd>
                </dl>
            </div>
            <div id="main_bottom">
            <div class="site_Email">
                客户服务邮箱：<label id="txtEmail" runat="server"></label>
            </div>
            <div  class="site_red">
            <label>官方网站：<label id="txtSite" runat="server"></label></label>
            </div>
            </div>
        </div>
        <div class="right"></div>
    </div>
</form>
</div>
</body>
</html>
