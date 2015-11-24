<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentEdit.aspx.cs" Inherits="admin_Student_StudentEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学员信息编辑</title>
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
        <span>当前位置：学员管理>>学员注册管理>> <label id="edit_tile" runat="server">添加学员</label></span>
        <div class="right"></div>
        <div class="titlebtn"></div>
    </div>
    <div class="edit">
            <div class="edit_top">
                <div><input type="text" id="txtLoginName" name="txtLoginName" runat="server"/><span>用户名：</span></div>
                <div>
                    <select runat="server"  id="rdlsex" name="rdlsex">
                    <option value="false">女</option><option value="true">男</option>
                    </select>
                    <span>性 别：</span>
                </div>
                <div><input type="text" id="txtUserName" name="txtUserName" runat="server"/><span>姓 名：</span></div>
                <div><input type="text" id="txtmobile" name="txtmobile" runat="server"/><span>手 机 号：</span></div>
                <div><input type="password" id="txttrypwd" name="txttrypwd"  runat="server"/><span>密 码：</span></div>
                <div><input type="password" id="txtpwd" name="txtpwd" runat="server"/><span>确认密码：</span></div>
                <div><input type="text"  runat="server" class="Wdate" id="txtbirthday" name="txtbirthday" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd'})" /><span>出生日期：</span></div> 
                <div><input type="text" id="txtemail" name="txtemail" runat="server"/><span>邮 箱：</span></div>
                <div><input type="text" id="txtaddress" name="txtaddress" runat="server"/><span>住 址：</span></div>
                <div><input type="text" id="txtqq" name="txtqq" runat="server"/><span>QQ号：</span></div>
                <div><input type="text" id="txtweixi" name="txtweixi" runat="server"/><span>微 信：</span></div>
                <div><input type="text" id="txtIntegral" name="txtIntegral" runat="server"/><span>积 分：</span></div>
                <div><input type="text" id="txtBalance" name="txtBalance" runat="server"/><span>余 额：</span></div>
                <div runat="server" id="divregtime"><input type="text"  runat="server" class="Wdate" id="txtRegTime" name="txtRegTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>注册日期：</span></div> 
                <div runat="server" id="divshen">
                    <asp:DropDownList  id="txtAuditor" name="txtAuditor"  runat="server"></asp:DropDownList>
                    <span>审核人：</span>
                </div>
                <div>
                    <select runat="server"  id="txtAuditState" name="txtAuditState">
                    <option value="0">待审</option><option value="1">通过</option><option value="-1">未通过</option>
                    </select>
                    <span>审核状态：</span>
                </div>
                <div runat="server" id="divshentime"><input type="text"  runat="server" class="Wdate" id="txtAuditTime" name="txtAuditTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>审核日期：</span></div> 
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
                        onclick="btnsutmit_Click" OnClientClick="return stuuseredit()" />
                 <input id="btn_return"  runat="server" type="button" class="bgback" value=" "/>
                 </div>
            </div>
    </div>
    </form>
</body>
</html>