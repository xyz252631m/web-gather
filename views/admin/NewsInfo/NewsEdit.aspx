<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="NewsEdit.aspx.cs" Inherits="admin_NewsInfo_NewsEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>资讯编辑</title>
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
        <div class="center">资讯编辑</div>
        <span>当前位置：资讯信息管理>><label id="edit_tile" runat="server">资讯添加</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit newsedit" >
            <div class="edit_top">
                <div><input id="txttitle" name="txttitle"  runat="server"  type="text"/><span>标题：</span></div>
                <div> 
                    <asp:DropDownList ID="rdl_newstype" runat="server">
                    </asp:DropDownList>
                    <span>类型：</span>
                </div>
                 <div id="pantime" runat="server"><input id="newstime" runat="server" name="newstime" class="Wdate" onfocus="WdatePicker({skin:'twoer',startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"     type="text"/><span>添加时间：</span></div>
                 <div id="panuser" runat="server"> 
                    <asp:DropDownList ID="rdl_user" runat="server">
                    </asp:DropDownList>
                    <span>添加人：</span>
                </div>
                <div><input id="orderid" name="orderid" type="text" value="1" runat="server"/><span>排序：</span></div>
                <div> 
                    <asp:DropDownList ID="rdl_Ifhidden" runat="server">
                    </asp:DropDownList>
                    <span>启用：</span>
                </div>
                <div><input id="looks" name="looks"  type="text" value="1" runat="server"/><span>浏览次数：</span></div>
                <div><input id="keywords" name="keywords"  type="text" runat="server"/><span>关键字：</span></div>
            </div>
            <!--描述-->
            <div class="textarea">
                <textarea rows="2" cols="20" id="news_description" name="news_description" runat="server"></textarea>
                <span> 备注：</span>
            </div>
            <div class="isshowindex"> 
                    <div class="uptype">
                        <div  style=" width:90px; margin-right:113px; float:right">
                        <input  id="isindexshow" title="45" runat="server" checked="true" onclick="uploadIsShow()" name="isindex"  type="radio" value="0"/>
                        <label for="isindexshow">否</label>
                        <input  id="isindexshow2"  runat="server" onclick="uploadIsShow()" name="isindex" type="radio" value="1"/>
                        <label for="isindexshow2">是</label>
                            </div>
                    <span>焦点新闻：</span>
                    </div>
                    <div>
                        <div><input id="txtSource" name="title"  value="筑人网络" runat="server"  type="text"/><span>来源：</span></div>
                    </div>
             </div>
            <div class="upload">
                    <asp:Button ID="btnFile" CssClass="bgupload" runat="server" Text=" " 
                    onclick="btnFile_Click" />
                <asp:FileUpload ID="FileUploadm"    runat="server" /><span>图片：</span>
            </div>
            <div class="imglab">
                <label ID="labimgname" runat="server">上传图片格式为jpg,gif,png。684*236</label>
            </div>
            <div class="divimg">
                    <asp:Image ID="newimg" Width="684" Height="236"  AlternateText="预览图片" runat="server" />
            </div>
            <div  class="cleardiv"></div>
            <div class="edit_content">
                <div > </div>
                <div><textarea rows="10" runat="server" cols="50"  id="edit_content" name=" edit_content"></textarea>
                <script> CKEDITOR.replace('edit_content', {  filebrowserUploadUrl: '../../Upload.aspx?type=File' });  //开启文件上传 </script>
                </div>
            </div>
            <div  class="cleardiv"></div>
            <div class="edit_submit">
                <div><asp:Button ID="btnsutmit" runat="server" Text=" " CssClass="bgadd"
                        onclick="btnsutmit_Click" OnClientClick="return txtcheck()" />
                 <input id="btn_return"  runat="server" type="button"   class="bgback"    value=" "/>
                 </div>
            </div>
    </div>
    </form>
</body>
</html>
