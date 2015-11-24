<%@ Page Language="C#"   AutoEventWireup="true" CodeFile="NewsInfo.aspx.cs" Inherits="admin_NewsInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>资讯列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet" type="text/css"   title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>        
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/news.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body onload="newsinfoready()">
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">资讯信息</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：资讯信息管理>>资讯信息</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect"  value=" " />
    <input id="btnadd" type="button" onclick="Toolbtnadd(1)" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="showdelNewsInfo()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div class="select">
    <div class="select_main">
        <div><input type="text" id="new_title" name="new_title" /><span>标 题：</span></div>
        <div><select id="rdlnewstype" name="rdlnewstype" ></select><span>类 型：</span></div>
        <div> <select id="rdlusers" name="rdlusers" ></select><span>添加人：</span></div>
        <div><input type="text"  class="Wdate" id="txttime" name="txttime"
        onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" /><span>时 间：</span></div>
        <div><input type="text" id="txtorderid" name="txtorderid" /><span>排序标号：</span></div>
        <div><input type="text" id="txtkeyword" name="txtkeyword"/><span>关键词：</span></div>
        <div><select id="rdlisshowindex" name="rdlisshowindex"  runat="server">
            <option value="0" selected="selected">全部</option>
            <option value="1">否</option>
            <option value="2">是</option>
        </select><span>焦点新闻：</span></div>
        <div><input type="text" id="txtsource" name="txtsource"/><span>来 源：</span></div>
        <div><select id="rdlifhidden" name="rdlifhidden"  runat="server">
            <option value="0" selected="selected">全部</option>
            <option value="1">否</option>
            <option value="2">是</option>
        </select><span>是否显示：</span></div>
        <div><input type="text" id="txtKeyDep" name="txtKeyDep"/><span>备 注：</span></div>
    </div>
    <div class="divbotton">    
         <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
         <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="newslist">
    <ul>
        <li ><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li class="liint">id</li>
        <li class="lititle">标题</li><li>类型</li>
        <li>添加人</li><li class="litime">添加时间</li>
        <li>来源</li><li class="liint">是否焦点</li>
        <li class="liint">排序编号</li><li class="liint">是否显示</li><li>关键词</li><li>备注</li><li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepNewslist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li  class="checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li class="liint"><%#Eval ("Id")%></li>
            <li title="<%#Eval("title")%>" class="lititle"><%#Eval("title")%></li><li><%#Eval("newstype")%></li>
            <li><%#Eval("UserName")%></li>
            <li class="litime"><%#Eval("Addtime", "{0:yyyy-MM-dd hh:mm:ss}")%></li>
             <li><%#Eval("Source")%></li><li class="liint"><%#Eval("IsIndex")%></li>
            <li class="liint"><%#Eval("orderid")%></li><li class="liint"><%#Eval("isshow")%></li>
            <li><%#Eval("keywords")%></li><li><%#Eval("KeyDescription")%></li>
            <%-- <asp:LinkButton ID="linkbtn_detail" runat="server"  onclick="linkbtn_detail_Click">预览</asp:LinkButton>--%>
            <li class="liright"><a href='NewsEdit.aspx?id=<%#Eval ("Id")%>'>编辑</a></li>
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
