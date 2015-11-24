<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseInfo.aspx.cs" Inherits="admin_CourseInfo_CourseInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>课程信息</title>
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
    <div class="center">课程信息</div>
    <span>当前位置：课程信息管理>>课程列表</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
    <input id="btnadd" type="button" onclick="addbtn('CourseEdit')" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="delCourseInfo()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div class="select"> 
    <div class="select_main">
        <div><input type="text" id="txtClassName" name="txtClassName" /><span>课程名称：</span></div>
        <div><input type="text" id="txtClassHour" name="txtClassHour" /><span>课 时：</span></div>
        <div><input type="text" id="txtOprice" name="txtOprice" /><span>面授价格：</span></div>
        <div><input type="text" id="txtWangPrice" name="txtWangPrice" /><span>网授价格：</span></div>
        <div><select id="rdlteacher" name="rdlteacher" runat="server" ></select><span>主讲老师：</span></div>
        <div><input type="text" id="txtViews" name="txtViews" /><span>浏 览 量：</span></div>
        <div>
            <select id="rdlRecom" name="rdlRecom"><option value="0">全部</option>
            <option value="1">否</option><option value="2">是</option></select><span>是否推荐：</span>
        </div>
        <div>
            <select  id="rdlShow" name="rdlShow"><option value="0">全部</option>
            <option value="1">否</option><option value="2">是</option></select><span>是否显示：</span>
        </div>
        <div runat="server" id="divaddpe"><input type="text" id="txtAddPeople" name="txtAddPeople" /><span>添 加 人：</span></div>
        <div runat="server" id="divaddtime"><input type="text"  class="Wdate" id="txtAddTime" name="txtAddTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>添加时间：</span></div>
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="coulist">
    <ul >
        <li class="liwidth"><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li>课程名称</li><li>主讲老师</li>
        <li>面授价格</li><li>网授价格</li>
        <li>课时</li><li>浏览量</li>
        <li>是否推荐</li><li>是否显示</li>
        <li>添加人</li><li class="litime">添加时间</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepBaselist" runat="server" enableviewstate="false">
        <ItemTemplate>
            <li class="liwidth checkthree" ><input type="checkbox" value="<%#Eval ("CourseId")%>,<%#Eval ("CoursePic")%>"/></li>
            <li><%#Eval("CourseName")%></li><li><%#Eval("TeacherInfo.TName")%></li>
            <li><%#Eval("Oprice","{0:C}")%></li><li><%#Eval("WangPrice", "{0:C}")%></li>
            <li><%#Eval("ClassHour")%></li><li><%#Eval("Views")%></li>
            <li><%#Eval("Recommend").ToString() == "True" ? "是" : "否"%></li>
            <li><%#Eval("Display").ToString() == "True" ? "是" : "否"%></li>
            <li><%#Eval("AddPeople")%></li><li class="litime"><%#Eval("AddTime")%></li>
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

