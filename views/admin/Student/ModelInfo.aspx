<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModelInfo.aspx.cs" Inherits="admin_Student_ModelInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Pragma" content="no-cache"/> 
    <style type="text/css">
    body{width:470px;margin:0px auto;padding-top:15px;padding-left:30px;font-size:12px}
    span{display:block; float:left}
    label{display:block;float:left}
    #twocon span{font-weight:bold;width:70px;clear:both; text-align:right;margin-right:5px}
    #twoimg{width:100px;height:100px;margin:10px 60px 10px 10px;float:left;border:#ccc solid 1px}
    #twocon{width:200px;height:120px;float:left;margin-left:30px;margin-top:5px}
    #twocon div{height:25px;line-height:25px}
    #butdiv{}
    #twoleft{width:200px;float:left;margin-right:2px}
    #twoleft div{height:30px;line-height:30px}
    #tworight{width:250px;float:left;margin-right:2px}
    #tworight div{height:30px;line-height:30px}
    #butdiv div span{font-weight:bold;width:70px;text-align:right;margin-right:5px}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="twoimg">
            <asp:Image ID="photourl" runat="server" Width="100" Height="100" alt="头像" />
        </div>
        <div id="twocon">
            <div><span>用 户 名：</span><label runat="server" id="labloginid" name="labloginid">admin</label></div>
            <div><span>性 别：</span><label runat="server" id="labsex" name="labsex">&nbsp;</label></div>
            <div><span>姓 名：</span><label runat="server" id="labusername" name="labusername">&nbsp;</label></div>
            <div><span>手 机 号：</span><label runat="server" id="labmobile" name="labmobile">&nbsp;</label></div>
        </div>
    </div>
    <div id="butdiv">
        <div id="twoleft">
            <div><span>出生日期：</span><label runat="server" id="labbirth" name="labbirth">&nbsp;</label></div>
            <div><span>QQ号：</span><label runat="server" id="labQQ" name="labQQ">&nbsp;</label></div>
            <div><span>微信号：</span><label runat="server" id="labweixi" name="labweixi">&nbsp;</label></div>
        </div>
        <div id="tworight">
              <div><span>住 址：</span><label runat="server" id="labaddress" name="labaddress">&nbsp;</label></div>
              <div><span>邮 箱：</span><label runat="server" id="labemail" name="labemail">&nbsp;</label></div>
              <div><span>注册日期：</span><label runat="server" id="labregtime" name="labregtime">&nbsp;</label></div>
        </div>
    </div>
    </form>
</body>
</html>
