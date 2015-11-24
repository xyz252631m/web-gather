<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FcatalogInfo.aspx.cs" Inherits="admin_FcatalogInfo_FcatalogInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>课程目录列表</title>
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
        <div class="center">目录列表</div>
        <span >当前位置：课程信息管理>>一级目录</span>
        <div class="right"></div>
        <!--标题-->
        <div class="titlebtn">
            <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
            <input id="btnadd" type="button" onclick="addbtn('FcatalogEdit')" class="btnbor bgadd"  value=" " />
            <input id="btndel" type="button" onclick="delFcatalogInfo()" class="btnbor bgdelete" value=" "  />
        </div>
    </div>
    <!--查询-->
    <div class="select">
    <div class="select_main">
        <div><input type="text" id="txfname" name="txfname" /><span>目录名称：</span></div>
        <div><input type="text" id="txtcname" name="txtcname"/><span>课程名称：</span></div>
        <div>
            <select runat="server"  id="rdlShow" name="rdlShow">
            <option value="0">全部</option><option value="1">否</option><option value="2">是</option>
            </select><span>是否显示：</span>
        </div>
        <div runat="server" id="divshen">
            <asp:DropDownList  id="rdlAddpeople" name="rdlAddpeople"  runat="server"></asp:DropDownList>
            <span>添 加 人：</span>
        </div>
        <div runat="server" id="divshentime">
            <input type="text"  runat="server" class="Wdate" id="txtAddtTime" name="txtAddtTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
            <span>添加日期：</span>
        </div> 
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
    </div>
    </div>
    <!--列表-->
    <div id="divlist" runat="server" class="fcatlist">
    <ul>
        <li class="licheck"><label>全选</label><input  id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li>一级目录名称</li> <li>课程名称</li>
        <li>是否显示</li><li>添加人</li>    
        <li class="litime">添加时间</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("FCatalogId")%>"/></li>
            <li><%#Eval("FCatalogName")%></li>
            <li><%#Eval("CourseInfo.CourseName")%></li>
            <li><%#Eval("Display").ToString() == "True" ? "是" : "否"%></li>
            <li><%#Eval("AddPeople")%></li>
            <li class="litime"><%#Eval("AddTime")%></li>
            <li class="liright">
                <a href='FcatalogEdit.aspx?id=<%#Eval ("FCatalogId")%>'>编辑</a>
            </li>
        </ItemTemplate>
        </asp:Repeater>
    </ol>
    <div>
        <uc1:PageUserControl ID="page_con"   runat="server"/>
    </div>
    </div>
    <asp:Panel ID="pannull" CssClass="divIsNull" runat="server">
        没有数据！   <a href="javascript:history.back(-1)">返回上一页</a>
    </asp:Panel>
    </form>
    </div>
</body>
</html>
