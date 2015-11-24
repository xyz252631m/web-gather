<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="CourseEdit.aspx.cs" Inherits="admin_CourseInfo_CourseEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>课程编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../css/blue/edit.css" rel="stylesheet" type="text/css"  title="theme"/>
    <link href="../../Js/jBox/Skins/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme" />
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
   <script src="../../ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/addoreditcheck.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
    <!--[if IE 7]>
    <style>
    .edit .upload input[type=file]{ width:428px; height:22px }
    </style>
    <![endif]-->
    <!--[if IE 8]>
    <style>
    .edit .upload input[type=file]{ width:428px; height:22px }
    </style>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <!--标题-->
    <div class="alltitle">
        <div class="left"></div>
        <div class="center">课程编辑</div>
        <span style="text-indent:10px; height:31px; line-height:31px; margin-left:10px;">当前位置：课程管理>> <label id="edit_tile" runat="server">添加课程</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit">
        <div class="edit_top">
            <div><input type="text" id="txtCourseName" name="txtCourseName" runat="server"/><span>课程名称：</span></div>
            <div><select id="rdlCourseType" name="rdlCourseType" runat="server" ></select><span>行业类型：</span></div>
            <div><select id="rdlTeacher" name="rdlTeacher" runat="server" ></select><span>主讲老师：</span></div>
                        <div><input type="text" id="txtJob" name="txtJob" runat="server"/><span>未来职位：</span></div>
            <div><input type="text"  runat="server"  class="Wdate" id="txtStartTime" name="txtStartTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>开始时间：</span></div>
            <div><input type="text"  runat="server"  class="Wdate" id="txtEndTime" name="txtEndTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>终止时间：</span></div>
            <div><input type="text" id="txtOprice" name="txtOprice" runat="server"/><span>面授价格：</span></div>
            <div><input type="text" id="txtClassHour" name="txtClassHour" runat="server"/><span>面授课时：</span></div>
            <div><input type="text" id="txtWangPrice" name="txtWangPrice" runat="server"/><span>网授价格：</span></div>
            <div><input type="text" id="txtWangHour" name="txtWangHour" runat="server"/><span>网授课时：</span></div>

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

 <%--           <div><input type="text" id="txtViews" name="txtViews" runat="server"/><span>浏 览 量：</span></div>--%>
            <div runat="server" id="divaddpe"><asp:DropDownList ID="rdlAddPeople"   runat="server"></asp:DropDownList><span>添 加 人：</span></div>
            <div runat="server" id="divaddtime"><input type="text"  runat="server"  class="Wdate" id="txtAddTime" name="txtAddTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>添加时间：</span></div>
        </div>
        <div class="textarea">
            <textarea id="txtcareer" name="txtcareer" cols="10" rows="5" runat="server"></textarea><span>就业前景：</span>
        </div>
        <!--upload-->
        <div class="upload">
            <asp:Button ID="btnFile" CssClass="bgupload" runat="server" Text=" " onclick="btnFile_Click" />
            <input type="file" runat="server"  id="FileUploadm" name="FileUploadm"/><span>上传图片：</span>
        </div>
        <div class="divimg">
            <span>预览：</span>
            <asp:Image ID="photourl" Height="316" Width="500"  alt="课程图片"  runat="server" />
        </div>
         <div class="imglab"><label ID="labimgname" runat="server"  >文件格式为jpg、gif、png</label></div>
        <!--end upload-->
        <!--textarea-->
             <div  class="cleardiv"></div>
            <div class="edit_content" id="Base_editdiv" runat="server">
                <div >课程简介： </div>
                <div><textarea rows="10" runat="server"   cols="50"  id="txtCintro" name="txtCintro"></textarea>
                <script>CKEDITOR.replace('txtCintro', { filebrowserUploadUrl: '../../Upload.aspx?type=File', filebrowserUploadUrl: '../../Upload.aspx?type=File' });  //开启文件上传 </script>
                </div>
            </div>
            <div  class="cleardiv"></div>
            <div class="edit_content" id="Div1" runat="server">
                <div >师资介绍： </div>
                <div><textarea rows="10" runat="server"   cols="50"  id="txtTeacher" name="txtTeacher"></textarea>
                <script>CKEDITOR.replace('txtTeacher', { filebrowserUploadUrl: '../../Upload.aspx?type=File', filebrowserUploadUrl: '../../Upload.aspx?type=File' });  //开启文件上传 </script>
                </div>
            </div>
            <div  class="cleardiv"></div>
            <div class="edit_content" id="Div2" runat="server">
                <div >报名流程： </div>
                <div><textarea rows="10" runat="server"   cols="50"  id="txtflowpath" name="txtflowpath"></textarea>
                <script>CKEDITOR.replace('txtflowpath', { filebrowserUploadUrl: '../../Upload.aspx?type=File', filebrowserUploadUrl: '../../Upload.aspx?type=File' });  //开启文件上传 </script>
                </div>
            </div>
            <div  class="cleardiv"></div>
            <div class="edit_content" id="Div3" runat="server">
                <div >购买支付： </div>
                <div><textarea rows="10" runat="server"   cols="50"  id="txtgoumai" name="txtgoumai"></textarea>
                <script>CKEDITOR.replace('txtgoumai', { filebrowserUploadUrl: '../../Upload.aspx?type=File', filebrowserUploadUrl: '../../Upload.aspx?type=File' });  //开启文件上传 </script>
                  </div>
            </div>
        <!--end textarea-->
 

        
        <div class="edit_submit"><div>
                <asp:Button ID="btnsutmit" runat="server" Text=" " CssClass="bgadd" onclick="btnsutmit_Click" OnClientClick="return courseedit()" />
                <input id="btn_return"  runat="server" type="button" class="bgback"  value=" "/>
        </div></div>
    </div>
    </form>
</body>
</html>
