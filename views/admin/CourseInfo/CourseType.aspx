﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseType.aspx.cs" Inherits="admin_CourseInfo_CourseType" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>课程类型</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/course.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
 <div  class="divrelative">
 <form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">课程类型</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：课程管理>>分类管理</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="tshowselect('selects')" class="btnbor bgselect" value=" " />
     <input id="btnadd" type="button" onclick="showaddclasstype()" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="showdel()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div class="selects">
    <div class="select_main">
        <div>
            <input type="text" id="txtclasstype" name="txtclasstype" /><span>课程类型：</span>
        </div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
          <input id="Button3" type="button" onclick="tshowselect('selects')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="courtypelist">
    <ul>
        <li><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li >id</li>
        <li class="liclasstype">课程类型</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server">
        <ItemTemplate>
            <li class="checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval ("Id")%></li>
            <li class="liclasstype"><%#Eval("TypeName")%></li>
            <li class="liright"><a href="#" onclick="showeditclasstype('<%#Eval ("Id")%>','<%#Eval("TypeName")%>')">编辑</a></li>
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
