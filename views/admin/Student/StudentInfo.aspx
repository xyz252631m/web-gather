<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentInfo.aspx.cs" Inherits="admin_Student_StudentInfo" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学员信息列表</title>
    <link href="../css/blue/bases.css" rel="stylesheet" type="text/css" title="theme" />
    <link href="../css/blue/StuStyle.css" rel="stylesheet" type="text/css"  title="theme" />
    <link href="../../Js/jBox/Skins2/blue/jbox.css" rel="stylesheet" type="text/css"  title="theme"/>
    <script src="../../Js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Js/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../js/Base.js" type="text/javascript"></script>
    <script src="../js/Delete.js" type="text/javascript"></script>
    <script src="../js/Theme.js" type="text/javascript"></script>
</head>
<body>
    <div  class="divrelative">
    <form id="form1" runat="server">
    <!--标题-->
    <div class="alltitle"  >
        <div class="left"></div>
        <div class="center">学员管理</div>
        <span >当前位置：学员管理>>学员注册管理</span>
        <div class="right"></div>
        <!--标题-->
        <div class="titlebtn">
            <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
            <input id="btnadd" type="button" onclick="Toolbtnadd(6)" class="btnbor bgadd"  runat="server" value=" " />
            <input id="btndel" type="button" onclick="delStuUserInfo()" class="btnbor bgdelete" value=" "  />
            <input id="Button1" type="button" onclick="AllShenHe()" class="btnbor bgfourbg" value="批量审核"  />
        </div>
    </div>

    <!--查询-->
    <div class="select">
    <div class="select_main">
        <div><input type="text" id="txtLoginName" name="txtLoginName" /><span>用户名：</span></div>
        <div><input type="text" id="txtUserName" name="txtUserName" /><span>姓 名：</span></div>
<%--        <div>
            <select id="rdlroles" name="rdlroles" ></select>
             <span>角 色：</span>
        </div>--%>
        <div>
            <select id="rdlsex" name="rdlsex">
            <option value="0" selected="selected">所有</option>
            <option value="1">女</option>
            <option value="2">男</option>
            </select><span>性 别：</span>
       </div>
       <div><input type="text" id="txtmobile" name="txtmobile"/><span>手 机 号：</span></div>
         <div><input type="text" class="Wdate" id="txtbirthday" name="txtbirthday" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd'})" /><span>出生日期：</span></div> 
                <div><input type="text" id="txtemail" name="txtemail" /><span>邮 箱：</span></div>
                <div><input type="text" id="txtaddress" name="txtaddress" /><span>住 址：</span></div>
                <div><input type="text" id="txtqq" name="txtqq" /><span>QQ号：</span></div>
                <div><input type="text" id="txtweixi" name="txtweixi" /><span>微 信：</span></div>
                <div><input type="text" id="txtIntegral" name="txtIntegral"/><span>积 分：</span></div>
                <div><input type="text" id="txtBalance" name="txtBalance" /><span>余 额：</span></div>
                <div><input type="text"  class="Wdate" id="txtRegTime" name="txtRegTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>注册日期：</span></div> 
                <div runat="server" id="divshen">
                    <asp:DropDownList  id="txtAuditor" name="txtAuditor"  runat="server"></asp:DropDownList>
                    <span>审核人：</span>
                </div>
                <div>
                    <select runat="server"  id="txtAuditState" name="txtAuditState">
                        <option value="0">所有</option>
                        <option value="2">待审</option>
                        <option value="3">通过</option>
                        <option value="1">未通过</option>
                    </select>
                    <span>审核状态：</span>
                </div>
                <div runat="server" id="divshentime"><input type="text"  runat="server" class="Wdate" id="txtAuditTime" name="txtAuditTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>审核日期：</span></div> 
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
    </div>
    </div>

    <!--列表-->
    <div id="divlist" runat="server" class="stulist">
    <ul>
        <li class="licheck"><label>全选</label><input  id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
        <li>登录名</li> <li>真实姓名</li>
        <li  class="lisex">性别</li><li>手机号</li> 
        <li>积分</li><li>余额</li>
        <li>审核人</li>
        <li>审核状态</li><li class="litime">注册时间</li>
        <li class="liright">操作</li>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("UserId")%>,<%#Eval ("PhotoUrl")%>"/></li>
            <li><%#Eval("LoginId")%></li>
            <li><%#Eval("UserName")%></li>
            <li  class="lisex"><%#Eval("Sex").ToString()=="True"?"男":"女"%></li>
            <li><%#Eval("Mobile")%></li>
            <li><%#Eval("Integral")%></li>
            <li><%#Eval("Balance")%></li>
            <li><%#Eval("Auditor")%></li>
            <li><%#GetState(Eval("AuditState"))%></li>
            <li  class="litime"><%#Eval("RegTime")%></li>
            <li class="liright">
                <a href='javascript:void(0)' onclick='ComShenHe(this,<%#Eval ("UserId")%>,<%#Eval("AuditState")%>)' >审核</a>
                <a href='StudentEdit.aspx?id=<%#Eval ("UserId")%>' >编辑</a>
            </li>
        </ItemTemplate>
        </asp:Repeater>
    </ol>
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
