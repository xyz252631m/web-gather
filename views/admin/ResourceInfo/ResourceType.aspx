<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResourceType.aspx.cs" Inherits="admin_ResourceInfo_ResourceType" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产品信息类型</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/Type.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/ResourceType.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">分类管理</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：资源信息管理>>分类管理</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showselect('restypeselect')" class="btnbor bgselect" value=" " />
     <input id="btnadd" type="button" onclick="showaddType()" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="showdel()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div id="restypeselect"  class="bgimages">
    <div class="select_main">
        <div>
            <asp:DropDownList ID="drpMaxType"   runat="server">
            </asp:DropDownList>
            <span>资源类型：</span>
        </div>
        <div><input type="text" id="txtMinName" name="txtMinName" /><span>类别名称：</span></div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit"  OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
          <input id="Button3" type="button" onclick="showselect('restypeselect')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="restypelist" runat="server">
    <ul>
        <li class="checktwo"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('restypelist')"/></li>
        <li class="check">Id</li>
        <li class="litype">大类别</li>
        <li class="litype">资源类型</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="checkthree"><input type="checkbox" value="<%#Eval ("Id")%>,<%#Eval ("ResourceType.Id")%>"/></li>
           <%-- <li><%#Eval("minid")%></li>--%>
             <li><%#Eval("Id")%></li>
            <li class="litype"><%#Eval("ResourceType.TypeName")%></li>
            <li class="litype"><%#Eval("TypeName")%></li>
            <li class="liright"><a href="#" onclick="showeditNewsType('<%#Eval ("Id")%>','<%#Eval ("ResourceType.Id")%>','<%#Eval("TypeName")%>')">编辑</a></li>
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

