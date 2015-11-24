<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="ActivityEdit.aspx.cs" Inherits="admin_Activity_ActivityEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>活动信息编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/edit.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Info.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body onload="uploadIsShow()">
    <form id="form1" runat="server">
    <div class="alltitle btmheight">
        <div class="left"></div>
        <div class="center">活动信息编辑</div>
        <span>当前位置：活动信息管理>><label id="edit_tile" runat="server">活动信息添加</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit newsedit" >
            <div class="edit_top">
                <div><input id="txttitle" name="txttitle"  runat="server"  type="text"/><span>标题：</span></div>
                <div> 
                    <asp:DropDownList ID="rdltypename"  runat="server">
                    </asp:DropDownList>
                    <span>类型：</span>
                </div>
                 <div><input id="starttime" runat="server" name="starttime" class="Wdate" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text"/><span>开始时间：</span></div>
                 <div><input id="endtime" runat="server" name="endtime" class="Wdate" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text"/><span>终止时间：</span></div>
                <div runat="server" id="divnum"><input id="txtnum" name="txtnum" type="text" value="0" runat="server"/><span>参加人数：</span></div>
                 <div runat="server" id="divtime"><input id="txtaddtime" runat="server" name="txtaddtime" class="Wdate" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text"/><span>添加时间：</span></div>
            </div>
            <!--描述-->
            <div class="textarea">
                <textarea rows="2" cols="20" id="txtdetail" name="txtdetail" runat="server"></textarea>
                <span> 备注：</span>
            </div>

            <div class="upload">
                    <asp:Button ID="btnFile" CssClass="bgupload" runat="server" Text=" " 
                    onclick="btnFile_Click" />
                <asp:FileUpload ID="FileUploadm"    runat="server" /><span>图片：</span>
            </div>
            <div class="imglab">
                <label ID="labimgname" runat="server">上传图片格式为jpg,gif,png。182*120</label>
            </div>
            <div class="divimg">
                    <asp:Image ID="photourl" Width="182" Height="120"  AlternateText="预览图片" runat="server" />
            </div>
            <div  class="cleardiv"></div>
            <div class="edit_submitc">
                <div><asp:Button ID="btnsutmit" runat="server" Text=" " CssClass="bgadd"
                        onclick="btnsutmit_Click" OnClientClick="return activitycheck()" />
                 <input id="btn_return"  runat="server" type="button"   class="bgback"    value=" "/>
                 </div>
            </div>
    </div>
    </form>
</body>
</html>
