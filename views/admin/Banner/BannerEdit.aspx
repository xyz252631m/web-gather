<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BannerEdit.aspx.cs" Inherits="admin_Banner_BannerEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>广告编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/edits.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme" />
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/info.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <!--标题-->
    <div class="alltitle">
        <div class="left"></div>
        <div class="center">广告编辑</div>
        <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：广告管理>> <label id="edit_tile" runat="server">添加广告</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit" id="banneredit">
        <div class="edit_top">
            <div><input type="text" id="txtBannName" name="txtBannName" runat="server"/><span>名称：</span></div>
            <div><input type="text" id="txtDirection" name="txtDirection" runat="server"/><span>位置：</span></div>
            <div><asp:DropDownList ID="rdlTypeName" onchange="typechange(this)" runat="server"></asp:DropDownList><span>类型：</span></div>
            <div class="txtremark"><label id="txtremark" runat="server"></label></div>
            <div><input type="text" id="txtOrder" name="txtOrder" runat="server"/><span>排序：</span></div>
            <div><input type="text" id="txtLink" name="txtLink" runat="server"/><span>链接：</span></div>
            <div id="addtime" runat="server" ><input type="text"  runat="server" class="Wdate" id="txttime" name="txttime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>时间：</span></div>
        </div>
        <div class="textarea">
            <textarea id="txtDetail" runat="server" rows="4" cols="40"></textarea><span>备注：</span>
        </div>
        <div class="upload">
                <asp:Button ID="btnFile" CssClass="bgupload" runat="server" Text=" " onclick="btnFile_Click" />
                <asp:FileUpload ID="FileUploadm" runat="server" /><span>图片：</span>
        </div>
        <div class="divimg">
                <asp:Image ID="newimg" Visible="false" Width="980" Height="296"  AlternateText="预览图片" runat="server" />
        </div>
        <div class="imglab"><label ID="labimgname" runat="server"  ></label></div>
        <div class="edit_submit"><div>
                <asp:Button ID="btnsutmit" runat="server" Text=" " CssClass="bgadd" onclick="btnsutmit_Click" OnClientClick="return bannereditcheck()" />
                <input id="btn_return"  runat="server" type="button" class="bgback"  value=" "/>
        </div></div>
    </div>
    </form>
</body>
</html>