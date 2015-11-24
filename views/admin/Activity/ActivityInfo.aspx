<%@ Page Language="C#"   AutoEventWireup="true" CodeFile="ActivityInfo.aspx.cs" Inherits="admin_Activity_ActivityInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>活动信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet" type="text/css"   title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>        
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/news.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body onload="newsinfoready()">
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle">
    <div class="left"></div>
    <div class="center">活动信息</div>
    <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：活动信息管理>>活动信息</span>
    <div class="right"></div>
    <div class="titlebtn">
    <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect"  value=" " />
    <input id="btnadd" type="button" onclick="addbtn('ActivityEdit')" class="btnbor bgadd" value=" " />
    <input id="btndel" type="button" onclick="delImgAndList('admin_Activity_ActivityInfo')" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div class="select">
    <div class="select_main">
        <div><input type="text" id="txttitle" name="txttitle" /><span>标 题：</span></div>
        <div><select id="rdltypename" name="rdltypename"  runat="server"></select><span>类 型：</span></div>
        <div><input type="text" id="txtnum" name="txtnum" /><span>参与人数：</span></div>
        <div><input type="text"  class="Wdate" id="txtaddtime" name="txtaddtime"
        onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" /><span>添加时间：</span></div>
       
    </div>
    <div class="divbotton">    
         <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
         <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="divlist" runat="server" class="activitylist">
    <ul>
        <li ><label>全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li class="lititle">标题</li>
        <li>类型</li>
        <li class="liimgsrc">图片路径</li>
        <li class="litime">开始日期</li>
        <li class="litime">结束日期</li>
         <li>已参加人数</li>
        <li class="litime">添加时间</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepNewslist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li  class="checkthree"><input type="checkbox" value="'<%#Eval ("Id")%>','<%#Eval("ImgSrc")%>'"/></li>
            <li class="lititle"><%#Eval("Title")%></li>
            <li><%#Eval("TypeName")%></li>
            <li class="liimgsrc"><%#Eval("ImgSrc")%></li>
            <li class="litime"><%#Eval("StartTime", "{0:yyyy-MM-dd}")%></li>
            <li class="litime"><%#Eval("EndTime", "{0:yyyy-MM-dd}")%></li>
            <li><%#Eval("AddNum")%></li>
            <li class="litime"><%#Eval("Addtime", "{0:yyyy-MM-dd hh:mm:ss}")%></li>
            <%-- <asp:LinkButton ID="linkbtn_detail" runat="server"  onclick="linkbtn_detail_Click">预览</asp:LinkButton>--%>
            <li class="liright"><a href='ActivityEdit.aspx?id=<%#Eval ("Id")%>'>编辑</a></li>
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
