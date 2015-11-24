<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DorderLog.aspx.cs" Inherits="admin_Student_DorderLog" %>
<%@ Register src="../../Controls/PageCon.ascx" tagname="PageUserControl" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>订单详情</title>
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
        <input  type="hidden" runat="server" id="Hid"/>
    <!--标题-->
    <div class="alltitle"  >
        <div class="left"></div>
        <div class="center">订单详情</div>
        <span >当前位置：订单信息管理>>订单详情</span>
        <div class="right"></div>
        <!--标题-->
        <div class="titlebtn">
            <input id="btnselect" type="button" onclick="showbyselect()" class="btnbor bgselect" value=" " />
<%--    <input id="btnadd" type="button" onclick="Toolbtnadd(6)" class="btnbor bgadd"  runat="server" value=" " />--%>
            <input id="btndel" type="button" onclick="delList('admin_Student_DorderLog')" class="btnbor bgdelete" value=" "  />
        </div>
    </div>

    <!--查询-->
   <div class="select">
    <div class="select_main">
         <div><input type="text" id="txtorderno" name="txtorderno"/><span>订单编号：</span></div>
        <div><input type="text" id="txtLoginName" name="txtLoginName" /><span>用户名：</span></div>
        <div><input type="text" id="txtcoursename" name="txtcoursename"/><span>商品名称：</span></div>
                <div>
            <select id="raltypename" name="raltypename" >
                <option value="" selected="selected" >全部</option>
                <option value="面授">面授</option>
                <option value="网授">网授</option>
            </select>
             <span>类型：</span>
        </div>
        <div>
            <select id="rdldelete" name="rdldelete" >
                <option value="0" selected="selected">全部</option>
                <option value="2">是</option>
                <option value="1">否</option>
            </select>
             <span>标记删除：</span>
        </div>

        <div><input type="text" id="txtmoney" name="txtmoney" /><span>单价：</span></div>
        <div><input type="text"  runat="server" class="Wdate" id="txtAddTime" name="txtAddTime" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><span>添加日期：</span></div> 
    </div>
    <div class="divbotton">    
        <asp:Button ID="btnNew_submit" OnClick="btnsubmit" CssClass="btnbor bgselect" runat="server" Text=" " /> 
        <input id="Button3" type="button" onclick="showbyselect()" class="btnbor bgcancel" value=" " />
    </div>
    </div>

    <!--列表-->
    <div id="divlist" runat="server" class="deltaloglist">
    <ul>
        <li class="licheck"><label>全选</label><input  id="allcheckbox" type="checkbox" onclick="AllSelect('divlist')"/></li>
       
        <li class="liorderno">订单编号</li>
        <li>用户名</li>
        <li>商品名称</li>
        <li>金额</li>
        <li >类型</li>
        <li >Ip地址</li>
         <li>标记删除</li>
        <li class="liright">时间</li>
        <%--<li class="liright">操作</li>--%>
    </ul>
    <ol>
        <asp:Repeater ID="RepUserlist" runat="server" EnableViewState="false">
        <ItemTemplate>
            <li class="licheck checkthree"><input type="checkbox" value="<%#Eval ("Id")%>"/></li>
            <li  class="liorderno"><%#Eval("OrderId")%></li>
            <li><%#Eval("LoginId")%></li>
            <li><%#Eval("CourseName")%></li>
            <li><%#Eval("Price")%></li>
            <li><%#Eval("TypeName")%></li>
            <li><%#Eval("Ip")%></li>
              <li><%#Eval("IsDelete").ToString()=="1"?"是":"否"%></li>
            <li  class="liright"><%#Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}")%></li>
<%--            <li class="liright">
                <a href='StudentEdit.aspx?id=<%#Eval ("Id")%>' >编辑</a>
            </li>--%>
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
