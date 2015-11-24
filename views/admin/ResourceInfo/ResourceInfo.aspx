<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResourceInfo.aspx.cs" Inherits="admin_ResourceInfo_ResourceInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>课程信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/List.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Info.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
<div  class="divrelative">
<form id="form1" runat="server">
<!--标题-->
<div class="alltitle"  >
    <div class="left"></div>
    <div class="center">资源列表</div>
    <span>当前位置：资源信息管理>>资源管理</span>
    <div class="right"></div>
    <div class="titlebtn">
        <input id="btnselect" type="button" onclick="showselect('resselect')" class="btnbor bgselect" value=" " />
        <input id="btnadd" type="button" onclick="Toolbtnadd(3)" class="btnbor bgadd" value=" " />
        <input id="btndel" type="button" onclick="delresource()" class="btnbor bgdelete" value=" "  />
    </div>
</div>
<!--查询-->
<div id="resselect" class="bgimages">
    <div class="select_main">
        <div><input type="text" id="txtResName" name="txtResName" /><span>标  题：</span></div>
        <div><input type="text" id="txtaddname" name="txtaddname" /><span>添加人：</span></div>
        <div>
            <asp:DropDownList ID="rdlTypeName" onchange="GetMinType()" runat="server">
            </asp:DropDownList>
            <span>类 型：</span>
        </div>
          <div>
            <asp:DropDownList ID="rdlMinTypeName" runat="server">
            </asp:DropDownList>
            <span>小类别：</span>
        </div>
        <div><input type="text" id="txtfiletype" name="txtfiletype" /><span>格  式：</span></div>
        <div><input type="text" id="txtdownnum" name="txtdownnum" /><span>下载数：</span></div>
        <div><input type="text"  class="Wdate" id="txttime" name="txttime"
        onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" /><span>时 间：</span></div>
        <div><input type="text" id="txtDetail" name="txtDetail" /><span>备 注：</span></div>
    </div>
    <div class="divbotton">
         <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
         <input id="Button3" type="button" onclick="showselect('resselect')" class="btnbor bgcancel" value=" " />
     </div>
</div>
<!--列表-->
<div id="reslist" runat="server">
    <ul>
        <li  class="licheck"  ><label for="allcheckbox"  >全选</label><input id="allcheckbox" type="checkbox" onclick="AllSelect('reslist')"/></li>
        <li>标题</li>
        <li>类型</li><li>类别</li>
        <li>下载次数</li><li>格式</li>
        <li>添加人</li>
        <li class="srcli">路径</li>
        <li class="litime">添加时间</li><li>备注</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="Repmesslist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>,<%#Eval("FilePath")%>"/></li>
            <li><%#Eval("Title")%></li>
            <li><%#Eval("TypeName")%></li>
            <li><%#Eval("MinTypeName")%></li>
            <li><%#Eval("downnumber")%></li>
            <li><%#Eval("FileType")%></li>
            <li><%#Eval("InsertName")%></li>
            <li class="srcli"><%#Eval("FilePath")%></li>
            <li class="litime"><%#Eval("InsertTime", "{0:yyyy-MM-dd HH:mm:ss}")%></li>
            <li><%#Eval("Remarks")%></li>
            <li class="liright"><a href='ResourceEdit.aspx?id=<%#Eval ("Id")%>'>编辑</a></li>
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
