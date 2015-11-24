<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Requetion.aspx.cs" Inherits="admin_LeaveMessage_Requetion" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>留言信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/List.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>       
    <script src="../js/base.js" type="text/javascript"></script>
    <script src="../js/Info.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">留言信息</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：站点管理>>留言管理>>我提问</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showselect('requselect')" class="btnbor bgselect" value=" " />
    <input id="btndel" type="button" onclick="delRequetion()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div id="requselect"  class="bgimages">
    <div class="select_main">
        <div><input type="text" id="txtUname" name="txtUname" /><span>昵称：</span></div>
        <div><input type="text" id="txtContents" name="txtContents" /><span>内容：</span></div>
        <div><input type="text"  class="Wdate" id="txttime" name="txttime"
        onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" /><span>时间：</span></div>
        <div><select id="rdlIsLook" name="rdlIsLook"  runat="server">
            <option value="0" selected="selected">全部</option>
            <option value="1">否</option>
            <option value="2">是</option>
        </select><span>已查看：</span></div>
    </div>
    <div class="divbotton">
         <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
         <input id="Button3" type="button" onclick="showselect('requselect')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="requlist" runat="server">
    <ul>
        <li  class="licheck"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('requlist')"/></li>      
        <li>用户名</li>
        <li class="litime">留言时间</li>
         <li>标题</li>
        <li  class='mmcontent'>详细内容</li>
        <li>是否有新的追问</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="Repmesslist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li  class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval("LoginId")%></li>
            <li class="litime"><%#Eval("LeavelTime", "{0:yyyy-MM-dd HH:mm:ss}")%></li>
               <li><%#Eval("Title")%></li>
            <li class='mmcontent'><%#Eval("Detail")%></li>
            <li><%# GetAnswer(Container.DataItem)%> </li>
            <li class="liright"><a href='#' onclick='ContentsDetailreq(this,<%#Eval ("Id")%>)'>详情</a></li>
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

