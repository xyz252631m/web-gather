<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinkList.aspx.cs" Inherits="admin_LinkInfo_LinkList" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>链接列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/LinkEdit.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
 <div  class="divrelative">
     <form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">链接列表</div>
    <span>当前位置：站点管理>>友情链接</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="tshowselect('selects')" class="btnbor bgselect" value=" " />
     <input id="btnadd" type="button" onclick="showaddLink()" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="showdel()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
      <!--查询-->
<div   class="selects selectst">
    <div class="select_main">
        <div>
            <input type="text" id="txtLinkName" name="txtLinkName" /><span>链接名称：</span>
        </div>
        <div><select id="rdlIsShow" name="rdlIsShow"  runat="server">
            <option value="0" selected="selected">所有</option>
            <option value="1">否</option>
            <option value="2">是</option>
        </select><span>是否启用：</span>
        </div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
          <input id="Button3" type="button" onclick="tshowselect('selects')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" class="linklist" runat="server">
    <ul>
        <li class="licheck"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect()"/></li>
        <li>名称</li><li>链接地址</li><li>是否启用</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval("LinkName")%></li>
            <li><%#Eval("LinkSrc")%></li>
            <li><%#Eval("IsShow").ToString()=="2"?"显示":"不显示"%></li>
            <li class="liright"><a href="#" onclick="showeditLink('<%#Eval ("Id")%>','<%#Eval("LinkName")%>','<%#Eval("LinkSrc")%>','<%#Eval("IsShow")%>')" >编辑</a></li>
        </ItemTemplate>
        </asp:Repeater>
    </ol>
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
