<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StalkInfo.aspx.cs" Inherits="admin_Student_StalkInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学员反馈表</title>
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="../css/blue/StuStyle.css" rel="stylesheet" type="text/css"  title="theme" />
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/stalk.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <div  class="divrelative">
    <form id="form1" runat="server">
    <!--标题-->
    <div class="alltitle"  >
        <div class="left"></div>
        <div class="center">反馈信息</div>
        <span>当前位置：课程反馈管理>>反馈信息管理</span>
        <div class="right"></div>
        <!--标题-->
        <div class="titlebtn">
            <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
    <%--<input id="btnadd" type="button" onclick="Toolbtnadd(6)" class="btnbor bgadd"  runat="server" value=" " />--%>
            <input id="btndel" type="button" onclick="delstalk()" class="btnbor bgdelete" value=" "  />
            <input id="btnshow" type="button" onclick="AllIsShow()" class="btnbor bgfourbg" value="显示状态"  />
        </div>
    </div>

    <!--查询-->
    <div class="select">
    <div class="select_main">
       <div><input type="text" id="txtCName" name="txtCName" /><span>课 程 名：</span></div>
       <div><input type="text" id="txtStuName" name="txtStuName" /><span>学 员 名：</span></div>
       <div>
            <select id="rdldisplay" name="rdldisplay">
                <option value="0">全部</option><option value="1">否</option><option value="2">是</option>
            </select>
            <span>是否显示：</span></div>
       <div><input type="text" class="Wdate" id="txttime" name="txttime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd'})" /><span>留言时间：</span></div> 
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
    </div>
    </div>

    <!--列表-->
    <div id="divlist" runat="server" class="stalklist">
    <ul>
        <li class="licheck"><label>全选</label><input  id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li>课程名</li>
        <li>学员名</li> 
        <li class="detail">留言信息</li><li>留言时间</li>
        <li>是否显示</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li><%#Eval("CourseInfo.CourseName")%></li>
            <li><%#Eval("SUserInfo.UserName")%></li>
            <li class="detail"><%#Eval("ReviewDetails")%></li>
            <li><%#Eval("ReviewTime")%></li>
            <li><%#Eval("Display").ToString()=="True"?"是":"否"%></li>
            <li class="liright">
                <a href='javascript:void(0)' onclick="ondetail(this)" >详情</a>
<%--                <a href='StudentEdit.aspx?id=<%#Eval ("Id")%>' >编辑</a>--%>
            </li>
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
