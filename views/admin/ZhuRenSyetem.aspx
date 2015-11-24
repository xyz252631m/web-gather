<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZhuRenSyetem.aspx.cs" Inherits="admin_ZhuRenSyetem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>配置页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/blue/base.css" rel="stylesheet" type="text/css"   title="theme"/>
    <link href="../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="css/blue/Type.css" rel="stylesheet" type="text/css"  title="theme" />
    <script src="../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="js/Base.js" type="text/javascript"></script>
    <script src="js/Info.js" type="text/javascript"></script>
    <script src="js/Theme.js" type="text/javascript"></script>
</head>
<body>
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle" style=" height:31px">
    <div class="left"></div>
    <div class="center">站点配置</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：站点管理>>站点配置</span>
    <div class="right"></div>
</div>
<!--列表-->
<div id="systeminfo" class="typelist" runat="server">
    <ul>   
        <li>名称</li>
        <li>数据</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <li>后台风格</li>
        <li id="themename"><script> getThemename()</script></li>
        <li class="liright"><a href="#" onclick="chengeTheme()">编辑</a></li>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li><%#Eval ("key")%></li>
            <li ><%#Eval("value")%></li>
            <li class="liright"><a href="#" onclick="configureEdit('<%#Eval ("key")%>','<%#Eval("value")%>')">编辑</a></li>
        </ItemTemplate>
        </asp:Repeater>
    </ol>
</div>
 <asp:Panel ID="pannull" CssClass="divIsNull" runat="server">
        没有数据！<a href="javascript:history.back(-1)">返回上一页</a>
 </asp:Panel>
</form>
</div>
</body>
</html>



