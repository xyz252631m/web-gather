<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseVideo.aspx.cs" Inherits="admin_CourseInfo_CourseVideo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>视频信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet"  title="theme"/>
    <link href="../../Js/jBox/Skins2/green/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>  
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Delete.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="classinfodiv">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">视频信息</div>
    <span>当前位置：课程信息管理>>视频列表</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
    <input id="btnadd" type="button" onclick="addbtn('CourseEdit')" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="delImgAndList('admin_CourseInfo_CourseVideo')" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div class="select"> 
    <div class="select_main">
        <div><input type="text" id="txtcname" name="txtcname" /><span>课程名称：</span></div>
        <div><input type="text" id="txtfname" name="txtfname" /><span>章名称：</span></div>
        <div><input type="text" id="txtsname" name="txtsname" /><span>小节名称：</span></div>
        <div><input type="text" id="txtAddPeople" name="txtAddPeople" /><span>添 加 人：</span></div>
        <div><input type="text"  class="Wdate" id="txtAddTime" name="txtAddTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>添加时间：</span></div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="cvideolist">
    <ul >
        <li class="liwidth"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li>课程名称</li><li class="lititle">章</li>
        <li class="lititle">节</li><li class="lisrc">视频地址</li>
        <li>添加人</li><li class="litime">添加时间</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepBaselist" runat="server">
        <ItemTemplate>
            <li class="liwidth checkthree" ><input type="checkbox" value="<%#Eval ("CVideoId")%>,'<%#Eval ("CVideo")%>'"/></li>
            <li><%#Eval("CourseName")%></li>
            <li class="lititle"><%#Eval("FCatalogName")%></li>
            <li class="lititle"> <%#Eval("SCatalogName")%></li>
            <li  class="lisrc"><%#Eval("CVideo")%></li>
            <li><%#Eval("AddPeople")%></li>
            <li class="litime"><%#Eval("AddTime")%></li>
            <li class="liright"><a href='CourseEdit.aspx?id=<%#Eval ("CourseId")%>'>编辑</a></li>
        </ItemTemplate>
        </asp:Repeater>
    </ol>
    <!--分页-->
    <div>
        <uc1:PageUserControl ID="page_con"  runat="server" />
    </div>
</div>
 <asp:Panel ID="pannull" CssClass="divIsNull" runat="server">
        没有数据！<a href="javascript:history.back(-1)">返回上一页</a>
 </asp:Panel>
</div>
</form>
</body>
</html>

