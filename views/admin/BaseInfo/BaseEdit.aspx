<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="BaseEdit.aspx.cs" Inherits="admin_BaseInfo_BaseEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/edits.css" rel="stylesheet"  title="theme"/>
    <link href="../../Js/jBox/Skins2/green/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Info.js" type="text/javascript"></script>
   <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body class="bodynohiddle">
<form id="form1" runat="server">
    <!--标题-->
    <div class="alltitle btmheight">
        <div class="left"></div>
        <div class="center">信息编辑</div>
        <span>当前位置：基础信息管理>><label id="edit_tile" runat="server">添加信息</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div id="BaseEdit" class="edit">
            <div class="edit_top">
                <div><asp:DropDownList ID="rdl_baseinfotype"   AutoPostBack="true"  runat="server" onselectedindexchanged="rdl_baseinfotype_SelectedIndexChanged"></asp:DropDownList><span>类型：</span></div>
                <div><input id="txttitle" name="txttitle"  runat="server"  type="text"/><span>标题：</span></div>
                <div class="link" ID="panlink" runat="server"><input id="txtlink" name="txtlink" value='http://' runat="server"  type="text"/><span>链接：</span></div>
                <div class="link"  ID="pantime" runat="server"><input id="txttime" class="Wdate" name="txttime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})"  runat="server"  type="text"/><span>时间：</span></div>
            </div>
        <asp:Panel ID="panupload" runat="server">
            <div class="upload">
                <asp:Button ID="btnFile" CssClass="bgupload" runat="server" Text=" "    onclick="btnFile_Click" />
                <asp:FileUpload ID="FileUploadm"   runat="server" /><span>图片：</span>
            </div>
            <div class="imglab">
                <label ID="labimgname" runat="server">图片格式为jpg,gif,png。</label>
            </div>
            <div class="divimg">
                    <asp:Image ID="newimg"   AlternateText="预览图片" runat="server" />
            </div>
           </asp:Panel>
            <div  class="cleardiv"></div>
            <div class="edit_content" id="Base_editdiv" runat="server">
                <div > </div>
                <div><textarea rows="10" runat="server"   cols="50"  id="edit_content" name="edit_content"></textarea>
                <script>CKEDITOR.replace('edit_content', {filebrowserUploadUrl: '../../Upload.aspx?type=File', filebrowserUploadUrl: '../../Upload.aspx?type=File'});  //开启文件上传 </script>
                </div>
            </div>
            <div  class="cleardiv"></div>
            <div id="basesib"  runat="server" >
                <div><asp:Button ID="btnsutmit" runat="server" Text=" " CssClass="bgadd"
                        onclick="btnsubmit_Click" OnClientClick="return baseeditcheck()" />
                 <input id="btn_return"  runat="server" type="button"  class="bgback"  value=" "/>
                 </div>
            </div>
    </div>
</form>
</body>
</html>
