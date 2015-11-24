<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherEdit.aspx.cs" Inherits="admin_Teacher_TeacherEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>用户编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/edit.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/addoreditcheck.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="alltitle btmheight">
        <div class="left"></div>
        <div class="center">信息编辑</div>
        <span>当前位置：教师信息管理>>教师管理>> <label id="edit_tile" runat="server">添加教师</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit">
            <div class="edit_top">
                 <div><input type="text" id="txtTName" runat="server" name="txtTName" /><span>姓 名：</span></div>
                 <div>
                    <select runat="server"  id="rdlsex" name="rdlsex">
                    <option value="false">女</option><option value="true">男</option>
                    </select>
                    <span>性 别：</span>
                </div>
                <div><input type="text" id="txtmobile" name="txtmobile" runat="server"/><span>手 机 号：</span></div>
                <div><input type="text"  runat="server" class="Wdate" id="txtbirthday" name="txtbirthday" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd'})" /><span>出生日期：</span></div> 
                <div>
                    <select runat="server"  id="rdlRecom" name="rdlRecom">
                    <option value="false">否</option><option value="true">是</option>
                    </select>
                    <span>是否推荐：</span>
                </div>
                 <div>
                    <select runat="server"  id="rdlShow" name="rdlShow">
                    <option value="true">是</option><option value="false">否</option>
                    </select>
                    <span>是否显示：</span>
                </div>
                <div runat="server" id="divadd">
                    <asp:DropDownList  id="rdlAddpeople" name="rdlAddpeople"  runat="server"></asp:DropDownList>
                    <span>添加人：</span>
                </div>
                <div runat="server" id="divaddtime"><input type="text"  runat="server" class="Wdate" id="txtAddTime" name="txtAddTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>添加日期：</span></div> 
            </div>
            <div class="textarea">
                <textarea id="txtTintro" name="txtTintro" cols="10" rows="5" runat="server"></textarea><span>教师简介：</span>
            </div>
            <div class="textarea">
                <textarea id="txtTDetail" name="txtTDetail"  cols="10" rows="5"  maxlength="100" runat="server"></textarea><span>教师详情：</span>
            </div>
            <div class="textlabel">
                <label>最多还可以输入100个字符</label>
            </div>

         <div class="upload">
            <asp:Button ID="btnFile" CssClass="bgupload" runat="server" Text=" " onclick="btnFile_Click" />
            <input type="file" runat="server"  id="FileUploadm" name="FileUploadm"/><span>上传头像：</span>
        </div>

        <div class="divimg">
            <span>预览：</span>
            <asp:Image ID="photourl"  alt="课程图片"  runat="server" />
        </div>
         <div class="imglab"><label ID="labimgname" runat="server"  >文件格式为jpg、gif、png</label></div>
            <div class="edit_submit">
                <div><asp:Button ID="btnsutmit" runat="server" Text=" "  CssClass="bgadd"
                        onclick="btnsutmit_Click" OnClientClick="return teacheredit()" />
                 <input id="btn_return"  runat="server" type="button" class="bgback" value=" "/>
                 </div>
            </div>
    </div>
    </form>
</body>
</html>
