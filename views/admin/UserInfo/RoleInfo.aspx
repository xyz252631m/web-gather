<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoleInfo.aspx.cs" Inherits="admin_UserInfo_RoleInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>角色信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet"   type="text/css" title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/base.js" type="text/javascript"></script>
    <script src="../js/users.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle"  >
    <div class="left"></div>
    <div class="center">角色管理</div>
    <span>当前位置：授权管理>>角色管理</span>
    <div class="right"></div>
    <div class="titlebtn">
        <input id="btnselect" type="button" onclick="tshowselect('selects')" class="btnbor bgselect" value=" " />
        <input id="btnadd" type="button" onclick="showaddroles()" runat="server" class="btnbor bgadd" value=" " />
        <input id="btndel" type="button" onclick="showdelroles()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div   class="selects selectst">
    <div class="select_main">
        <div><input type="text" id="txtrolename" name="txtrolename" /><span>角色名称：</span></div>
        <div><input type="text" id="txtremarks" name="txtremarks" /><span>备 注：</span></div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
          <input id="Button3" type="button" onclick="tshowselect('selects')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="rolelist">
    <ul>
        <li class="licheck"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li>角色名称</li>
        <li>父级角色</li>
        <li>备注</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval("RolesName")%></li>
            <li><%#Eval("pidName")%></li>
            <li><%#Eval("Remarks")%></li>
            <li class="liright">
                <a href="#" onclick="showeditroles('<%#Eval ("Id")%>','<%#Eval("RolesName")%>','<%#Eval("pidName")%>','<%#Eval("Remarks")%>')">修改</a>
                <a href='#'  onclick="GoPower('<%#Eval ("Id")%>')" >设置权限</a>
            </li>
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

