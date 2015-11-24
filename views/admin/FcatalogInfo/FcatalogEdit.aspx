<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FcatalogEdit.aspx.cs" Inherits="admin_FcatalogInfo_FcatalogEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>课程目录列表</title>
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="../css/blue/edits.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/catalog.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body onload="cominput()">
       <form id="form1" runat="server">
    <!--标题-->
    <div class="alltitle">
        <div class="left"></div>
        <div class="center">目录编辑</div>
        <span>当前位置：课程信息管理>>一级目录>><label id="edit_tile" runat="server">添加目录</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit">
        <div class="edit_top">
            <div><input type="text" id="txtfname" autocomplete="off"   name="txtfname" runat="server"/><span>目录名称：</span></div>
            <div><input type="text" id="txtcname" autocomplete="off"  name="txtcname" runat="server"/><span>课程名称：</span></div>
            <div id="ssss" style="height:auto;"></div>
            <div>
                <select runat="server"  id="rdlShow" name="rdlShow">
                <option value="true">是</option><option value="false">否</option>
                </select>
                <span>是否显示：</span>
            </div>
            <div runat="server" id="divaddpe"><asp:DropDownList ID="rdlAddPeople"   runat="server"></asp:DropDownList><span>添 加 人：</span></div>
            <div runat="server" id="divaddtime"><input type="text"  runat="server"  class="Wdate" id="txtAddTime" name="txtAddTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>添加时间：</span></div>
        </div>
        <div class="edit_submit"><div>
                <asp:Button ID="btnsutmit" UseSubmitBehavior="false" runat="server" Text=" " CssClass="bgadd" onclick="btnsutmit_Click"  OnClientClick="if(!onfcatalogedit()){ return false;}"  />
                <input id="btn_return"  runat="server" type="button" class="bgback"  value=" "/>
        </div></div>
    </div>
    </form>
</body>
</html>
