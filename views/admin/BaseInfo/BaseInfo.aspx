<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="BaseInfo.aspx.cs" Inherits="admin_BaseInfo_BaseInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet"  type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/green/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Delete.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="baseinfodiv">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">信息列表</div>
    <span>当前位置：基础信息管理>>信息列表</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showselect('baseinfoselect')" class="btnbor bgselect" value=" " />
     <input id="btnadd" type="button" onclick="Toolbtnadd(2)" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="delImgAndList('admin_BaseInfo_BaseInfo')" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div class="select" > 
    <div class="select_main">
        <div><input type="text" id="txtBaseTitle" name="txtBaseTitle" /><span>标题：</span></div>
        <div><select id="rdlBaseType" name="rdlBaseType"  runat="server"></select><span>类型：</span></div>
        <div><input type="text" id="txtcontents" name="txtcontents" /><span>内容：</span></div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showselect('baseinfoselect')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="blist">
    <ul>
        <li class="licheck"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('baseinfolist')"/></li>
        <li>ID</li>
        <li class="lititle">标题</li><li>类型</li>
        <li class="lisrc">图片</li>
        <li>链接</li>
        <li class="litime">时间</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepBaselist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>,<%#Eval("ImgSrc")%>"/></li>
            <li><%#Eval("Id") %></li>
            <li class="lititle"><%#Eval("Title") %></li>
            <li><%#Eval("TypeName") %></li>
            <li class="lisrc"> <%#Eval("ImgSrc")%></li>
            <li><%#Eval("Link")%> </li>
            <li class="litime"><%#Eval("AddTime")%> </li>
            <li class="liright"><a href='BaseEdit.aspx?id=<%#Eval ("Id")%>'>编辑</a></li>
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
</div>
</form>
</body>
</html>
