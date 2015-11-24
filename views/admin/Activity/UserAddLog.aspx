<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAddLog.aspx.cs" Inherits="admin_Activity_UserAddLog" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学员消费记录</title>
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="../css/blue/StuStyle.css" rel="stylesheet" type="text/css"  title="theme" />
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Delete.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <div  class="divrelative">
    <form id="form1" runat="server">
    <!--标题-->
    <div class="alltitle"  >
        <div class="left"></div>
        <div class="center">活动参加记录</div>
        <span >当前位置：活动信息管理>>活动参加记录</span>
        <div class="right"></div>
        <!--标题-->
        <div class="titlebtn">
            <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
<%--            <input id="btnadd" type="button" onclick="Toolbtnadd(6)" class="btnbor bgadd"  runat="server" value=" " />
            <input id="btndel" type="button" onclick="delStuUserInfo()" class="btnbor bgdelete" value=" "  />--%>
        </div>
    </div>

    <!--查询-->
   <div class="select">
    <div class="select_main">
        <div><input type="text" id="txtLoginName" name="txtLoginName" /><span>用户名：</span></div>
        <div><input type="text" id="txtTitle" name="txtTitle" /><span>活动名称：</span></div>
        <div>
            <select id="raliswin" name="raliswin" >
                <option value="0" selected="selected" >全部</option>
                <option value="2">是</option>
                <option value="1">否</option>
            </select>
             <span>是否中奖：</span>
        </div>
        <div>
            <select id="rdlshow" name="rdlshow" >
                <option value="0" selected="selected">全部</option>
                <option value="2">是</option>
                <option value="1">否</option>
            </select>
             <span>奖品生效：</span>
        </div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
    </div>
    </div>

    <!--列表-->
    <div id="divlist" runat="server" class="actwinlist">
    <ul>
        <li class="licheck"><label>Id</label><%--<input  id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/>--%></li>
        <li>用户名</li>
        <li>活动名称</li>
        <li class="listarttime">活动时间</li>
        <li class="iswin">是否中奖</li>
        <li >中奖级别</li>
        <li>中奖说明</li>
         <li  class="iswin">奖品生效</li>
        <li class="liright">生效时间</li>
        <%--<li class="liright">操作</li>--%>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><%#Eval("Id")%><%--<input type="checkbox" value="<%#Eval ("Id")%>"/>--%></li>
            <li><%#Eval("LoginId")%></li>
            <li><%#Eval("Title")%></li>
            <li  class="listarttime"><%#Eval("StartTime","{0:yyyy-MM-dd HH:mm:ss}")%> -- <%#Eval("EndTime","{0:yyyy-MM-dd HH:mm:ss}")%></li>
            <li  class="iswin"><%#Eval("IsWin").ToString()=="1"?"是":"否"%></li>
            <li><%#Eval("UserLevel")%></li>
            <li><%#Eval("Explain")%></li>
            <li  class="iswin"><%#Eval("IsShow").ToString()=="1"?"是":"否"%></li>
            <li  class="liright"><%#Eval("ShowTime","{0:yyyy-MM-dd HH:mm:ss}")%></li>
<%--            <li class="liright">
                <a href='StudentEdit.aspx?id=<%#Eval ("Id")%>' >编辑</a>
            </li>--%>
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
