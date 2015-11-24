<%@ Page Language="C#"  ValidateRequest="false"  AutoEventWireup="true" CodeFile="VideoEdit.aspx.cs" Inherits="admin_CourseInfo_VideoEdit" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加视频</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/base.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/StuStyle.css" rel="stylesheet"  type="text/css" title="theme"/>
    <link href="../../uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/addvideo.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<%--<body onload="cominput()">--%>
    <body>
<form id="form1" runat="server">
    <div class="alltitle btmheight">
        <div class="left"></div>
        <div class="center">视频信息编辑</div>
        <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：课程信息管理>><label id="edit_tile" runat="server">添加视频信息</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div id="resEdit">
            <div class="edit_top">
<%--                <div><input type="text" id="txtcname" autocomplete="off"  name="txtcname" runat="server"/><span>课程名称：</span></div>--%>
                  <div> 
                    <asp:DropDownList  id="rdlcname" AutoPostBack="true" name="rdlcname" runat="server" OnSelectedIndexChanged="rdlcname_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span>课程名称：</span>
                </div> 
                <div> 
                    <asp:DropDownList  id="rdlfname" AutoPostBack="true"  name="rdlfname" runat="server" OnSelectedIndexChanged="rdlfname_SelectedIndexChanged"   >
                    </asp:DropDownList>
                    <span>章：</span>
                </div>
                <div>
                      <asp:DropDownList  id="rdlsname" name="rdlsname" runat="server"  >
                    </asp:DropDownList>
                     
                <span>章：</span>
                </div>
            </div>
            <input id="strid" runat="server"  type="hidden"/>
            <!--上传-->
            <div class="divupload">
                
                <div class="divflash"><input type="file" name="file_upload" id="file_upload" /></div>
                <div class="divlab">文件列表：</div>
                <div id="some_file_queue" >
                     <div id="filelist" runat="server" visible="false">
                        <div id="dividf" class="uploadify-queue-item">
                            <div class="cancel">
                                <a href="javascript:void(0)" onclick="delfile()">X</a>
                            </div>
                            <span class="fileName">
                                <a id="linkpath" runat="server"><label id="filename" runat="server"></label></a></span>
                            <span class="data"></span>
                            <div class="uploadify-progress">
                                <div class="uploadify-progress-bar" style="width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cleardiv"></div>
            <div class="edit_submit">
                <div>
                    <input  id="btnupdate"  runat="server" onclick="updateFile()" visible="false"  type="button"   class="bgupdate"  value=" "/>
                    <input  id="btnsutmit"  runat="server" onclick="addFile()"  type="button"   class="bgadd"  value=" "/>
                    <input id="btn_return"  runat="server" type="button"   class="bgback"  value=" "/>
                 </div>
            </div>
    </div>
    <input id="txtlname"  type="hidden" runat="server" />
</form>
</body>
</html>
