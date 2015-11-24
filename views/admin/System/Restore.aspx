<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Restore.aspx.cs" Inherits="admin_System_Restore" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据库还原</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/List.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>    
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Info.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">数据库还原</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：系统信息管理>>数据库还原</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btndel" type="button" onclick="dealBackup()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--列表-->
<div id="backuplist" runat="server">
    <ul>
        <li class="checktwo"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('backuplist')"/></li>
        <li class="check">id</li>
        <li>时间</li>
        <li class="srcli">路径</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="Repmesslist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li  class="checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval ("Id")%></li>
            <li><%#Eval("BackupTime", "{0:yyyy-MM-dd HH:mm:ss}")%></li>
            <li class="srcli"><%#Eval("Bsrc")%></li>
            <li class="liright" >
            <asp:LinkButton ID="lbtnrestore" runat="server" CommandArgument='<%#Eval("Bsrc")%>' onclick="lbtnrestore_Click">还原</asp:LinkButton>
            
        </ItemTemplate>
        </asp:Repeater>
    </ol>
    
<!--分页-->
    <div>
        <uc1:PageUserControl ID="page_con"  runat="server"/>
    </div>
</div>
<asp:Panel ID="pannull" CssClass="divIsNull" runat="server">
        没有数据！<a href="javascript:history.back(-1)">返回上一页</a>
 </asp:Panel>
</form>
</div>
</body>
</html>
