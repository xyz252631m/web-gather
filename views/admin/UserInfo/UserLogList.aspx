<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogList.aspx.cs" Inherits="admin_UserInfo_UserLogList" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>日志</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="../css/blue/StuStyle.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css" title="theme" />
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/base.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">日志管理</div>
    <span>当前位置：站点管理>>日志管理</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
    <input id="btndel" type="button" onclick="delList('admin_UserInfo_UserLogList')" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div   class="select">
    <div class="select_main">
        <div><input type="text" id="txtLoginName" name="txtLoginName" /><span>登录名：</span></div>
        <div><input type="text" id="txtSetSystem" name="txtSetSystem" /><span>对象名：</span></div>
                <div>
            <asp:DropDownList ID="rdlTypeName" runat="server">
            </asp:DropDownList>
            <span>动作：</span>
        </div>
        <div><input type="text"  class="Wdate" id="txttime" name="txttime"
        onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" /><span>时间：</span></div>
    </div>
    <div class="divbotton">
         <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
         <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="userlog">
    <ul>
        <li class="licheck"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li class="check">id</li><li>登录名</li>
        <li>IP</li><li>动作</li>
        <li>对象名</li>
        <li class="liright">时间</li>
    </ul>
    <ol>
        <asp:Repeater ID="Repmesslist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li  class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval ("Id")%></li>
            <li><%#Eval("UserName")%></li>
            <li><%#Eval("LoginIp")%></li>
            <li><%#Eval("SetSystem")%></li>
            <li><%#Eval("TableName")%></li>
            <li class="liright"><%#Eval("Time", "{0:yyyy-MM-dd HH:mm:ss}")%></li>
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
