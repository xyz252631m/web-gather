<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="admin_UserInfo_UserInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户列表</title>
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="../css/blue/StuStyle.css" rel="stylesheet" title="theme" />
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/base.js" type="text/javascript"></script>
    <script src="../js/users.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body onload="UserInfoready()">
<div  class="divrelative">
    <form id="form1" runat="server">
<!--标题-->
<div class="alltitle"  >
    <div class="left"></div>
    <div class="center">用户管理</div>
    <span >当前位置：授权管理>>用户管理</span>
    <div class="right"></div>
    <!--标题-->
    <div class="titlebtn">
        <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
        <input id="btnadd" type="button" onclick="addbtn('UserEdit')" class="btnbor bgadd"  runat="server" value=" " />
        <input id="btndel" type="button" onclick="showuserdel()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
      <!--查询-->
<div class="select">
    <div class="select_main">
        <div><input type="text" id="txtLoginName" name="txtLoginName" /><span>用户名：</span></div>
        <div>
            <select id="rdlroles" name="rdlroles" ></select>
             <span>角 色：</span></div>
        <div><select id="rdlsex" name="rdlsex"  runat="server">
            <option value="0" selected="selected">所有</option>
            <option value="1">女</option>
            <option value="2">男</option>
        </select><span>性 别：</span></div>
        <div><input type="text" id="txtUserName" name="txtUserName" /><span>姓 名：</span></div>
        <div><select id="rdlIsShow" name="rdlIsShow"  runat="server">
            <option value="0" selected="selected">所有</option>
            <option value="1">否</option>
            <option value="2">是</option>
        </select><span>是否启用：</span></div>
        <div><input type="text" id="txtRemarks" name="txtRemarks"/><span>备 注：</span></div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
          <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="userlist">
    <ul>
        <li class="licheck"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li>登录名</li><li>角色名</li>
        <li>性别</li><li>用户名</li>
        <li>是否启用</li><li>备注</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server">
        <ItemTemplate>
            <li class="licheck"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval("LoginName")%></li>
            <li><%#Eval("RolesName")%></li>
            <li><%#Eval("SexName")%></li>
            <li><%#Eval("UserName")%></li>
            <li><%#Eval("IsShowName")%></li>
            <li><%#Eval("Remarks")%></li>
            <li class="liright"><a href='#' onclick="infoGotoEdit('<%#Eval ("Id")%>')">编辑</a></li>
        </ItemTemplate>
        </asp:Repeater>
    </ol>
    <div>
        <uc1:PageUserControl ID="page_con" runat="server"/>
    </div>
</div>
 <asp:Panel ID="pannull" CssClass="divIsNull" runat="server">
        没有数据！<a href="javascript:history.back(-1)">返回上一页</a>
 </asp:Panel>
</form>
</div>
</body>
</html>
