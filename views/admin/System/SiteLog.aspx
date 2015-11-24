<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiteLog.aspx.cs" Inherits="admin_System_SiteLog" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统日志</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/List.css" rel="stylesheet" type="text/css" title="theme" />
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
    <div class="center">系统日志</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：系统信息管理>>系统日志</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showselect('slogselect')" class="btnbor bgselect" value=" " />
    <input id="btndel" type="button" onclick="delSystemLog()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div id="slogselect"  class="bgimages">
    <div class="select_main">
        <div><input type="text" id="txtLogger" name="txtLogger" /><span>对象名：</span></div>
        <div><input type="text" id="txtMessage" name="txtMessage" /><span>消息名称：</span></div>
                <div>
            <asp:DropDownList ID="rdlLevel" runat="server">
            </asp:DropDownList>
            <span>级别：</span>
        </div>
        <div><input type="text"  class="Wdate" id="txttime" name="txttime"
        onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" /><span>时间：</span></div>
    </div>
    <div class="divbotton">
         <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
         <input id="Button3" type="button" onclick="showselect('slogselect')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="sloglist" runat="server" >
    <ul>
        <li class="checktwo"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('sloglist')"/></li>
        <li class="check">id</li><li>时间</li>
        <li class="ipli">线程ID</li><li>级别</li>
        <li>对象名</li>
        <li>消息名称</li>
        <li class="liright">异常消息</li>
    </ul>
    <ol>
        <asp:Repeater ID="Repmesslist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li  class="checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval ("Id")%></li>
            <li><%#Eval("Date", "{0:yyyy-MM-dd HH:mm:ss}")%></li>
            <li class="ipli"><%#Eval("Thread")%></li>
            <li><%#Eval("Level")%></li>
            <li title="<%#Eval("Logger")%>"><%#Eval("Logger")%></li>
             <li  title="<%#Eval("Message")%>"><%#Eval("Message")%></li>
            <li class="liright"  title="<%#Eval("Exception")%>"><%#Eval("Exception")%></li>
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
