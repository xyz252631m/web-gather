String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}


//左侧菜单切换
function ulshow(thli) {
        if (!$(thli).parent().next("li").find("ul").eq(0).is(":hidden")) {
            return;
        }
        $(thli).parent().parent().find("ul").slideUp("solw");
        $("#left_minfo").slideUp("solw");
        $(thli).parent().next("li").find("ul").eq(0).slideToggle("solw");
    }
function ulshowtwo() {
    $("#ultxt").find("ul").slideUp("solw");
    $("#left_minfo").slideDown("solw");
}
//左侧菜单收缩
function changeVisible() {
    if (parent.bottom.cols != '190,*') {
        parent.bottom.cols = '190,*';
        $("#left_l>div").removeClass("divleftfloat_right");
    }
    else {
        parent.bottom.cols = '5,*';
        $("#left_l>div").addClass("divleftfloat_right");
    }
} 

//配置修改
function configureEdit(syskey, sysvalue) {
    var html = "";
    if (syskey == "fooder") {
        html = "<div style='padding:10px;'>值：<textarea rowl='3' id='txtsysvalue'  name='txtsysvalue'>" + sysvalue + "</textarea></div>";
    } else {
        html = "<div style='padding:10px;'>值：<input type='text' value=" + sysvalue + "  id='txtsysvalue' name='txtsysvalue' /></div>";

    }
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtsysvalue.trim() == "") {
                top.$.jBox.tip('值不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_ZhuRenSyetem.EditValue(syskey, f.txtsysvalue).value; //-1,1
            if (success == 1) {
                top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_ZhuRenSyetem.UserLog("Update").value;
            } else {
                top.$.jBox.tip('修改失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "修改", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });
}
//修改风格
function chengeTheme() {
    var theme = getCookie('theme');
    // alert(theme);
    var html = "<div style='padding:10px;'>当前风格：<select id='selecttheme' name='selecttheme'>";
    html += "<option value='blue'>蓝色</option>";
    if (theme == "red") {
        html += "<option selected='selected' value='red'>红色</option>";
    } else {
        html += "<option  value='red'>红色</option>";
    }
    if (theme == "green") {
        html += "<option value='green' selected='selected'>绿色</option>";
    } else {
        html += "<option  value='green'>绿色</option>";
    }
    html += "</select></div>";

    var submit = function (v, h, f) {
        if (v == true) {
           
            if (f.selecttheme.trim() != "") {
                setCookie('theme', f.selecttheme);
                if (getCookie('theme') == f.selecttheme) {
                   // top.$.jBox.tip('修改成功，请刷新页面!', 'success', { timeout: 1000 });
                    getThemename();
                    top.window.location.href = top.window.location.href;
                }
                return;
            }
           
        }
    };
    top.$.jBox.confirm(html, "修改", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });
}
//风格名称
function getThemename() {
    var theme = getCookie('theme');
    if (theme == "red") {
        $("#themename").html('红色');
    } else if (theme == "green") {
        $("#themename").html('绿色');
    } else {
        $("#themename").html('蓝色');
    }
}
//添加广告  
function typechange(thistype) {
    var selvalue = thistype.options[thistype.options.selectedIndex].value//你要的值
    admin_Banner_BannerEdit.getremark(selvalue, function (red) {
        $("#txtremark").html(red.value);
    });
}


//资讯上传show  hide
function uploadIsShow() {
    if ($("#isindexshow").attr("checked")) {
        $(".upload").hide();
        $(".imglab").hide();
        $(".divimg").hide();
    } else {
        $(".upload").show();
        $(".imglab").show();
        $(".divimg").show();
    }
}

//修改密码--成功跳转
function successByreturn() {
    top.location.href = "../ZhuRenLogin.aspx";
   // top.$.jBox.tip(errorstr, 'error', { timeout: 1000 });
}
//修改密码--错误结果
function returnbyerror(errorstr) {
   top.$.jBox.tip(errorstr, 'error', { timeout: 1000 });
}
//获取小类别--资源信息
function GetMinType() {
     var sel = $("#rdlTypeName")[0];
     var selvalue = sel.options[sel.options.selectedIndex].value;
     var list = admin_ResourceInfo_ResourceInfo.GetMinType(selvalue).value;
 
     var rdlMinTypeName = $("#rdlMinTypeName")[0];
     rdlMinTypeName.options.length = 0;
     var newoption1 = new Option();
     newoption1.value = "0";
     newoption1.text = "全部";
     rdlMinTypeName.options.add(newoption1);
     if (list != null) {
         for (var i = 0; i < list.length; i++) {
             var newoption = new Option();
             newoption.value = list[i].Id.toString();
             newoption.text = list[i].TypeName.toString();
             rdlMinTypeName.options.add(newoption);
         }
     }
}

//留言  更改查看状态
function ContentsDetail(mmathsi, mmid) {
    var mlength = $("#messlist ol").find(".liright>a").index(mmathsi);
    var mcont = $("#messlist ol").find(".mmcontent").eq(mlength).html();
    var submit = function (v, h, f) {
        if (v == "ok") {
            //更改查看状态
            admin_LeaveMessage_LeavelMessage.UpdateLook(mmid, function (respone) {
                if (respone.value == 1) {
                    $(mmathsi).parent().prev().html("是");
                    admin_LeaveMessage_LeavelMessage.UserLog("Dateil").value;
                } else {
                    top.$.tip("状态更改失败！", 'error', { timeout: 1000 });
                }
            });
        }
    };
    var html = "<div style=' padding:10px; height:auto'>" + mcont + "</div>";
    top.$.jBox(html, { submit: submit, top: "200px" });
}



//留言
function ContentsDetailreq(mmathsi, mmid) {
    // var mlength = $("#requlist ol").find(".liright>a").index(mmathsi);
    // var mcont = $("#requlist ol").find(".mmcontent")[mlength].innerHTML;

    var html = "";
    var qmodel = admin_LeaveMessage_Requetion.GetPut(mmid).value;
    if (qmodel != "") {
        var obj = eval('(' + qmodel + ')');
        html += "<div>问题：" + obj.Title + "</div>";
        if (obj.AnswerContent != null) {
            html += "<div>问题详细：" + obj.AnswerContent + "</div>";
        }
        if (obj.AnswerContent == null) {
            html += "<div>回答："
            html += "<textarea id='txtancont' name='txtancont'></textarea></div>"
            html += "<div><input type='hidden'  id='txtqid' name='txtqid' value='" + obj.Id + "'/></div>"
        } else {
            html += obj.AnswerName + "回答：" + obj.AnswerContent;
            if (obj != null) {
                var list = obj.PutQuestion;
                for (var i = 0; i < list.length; i++) {
                    html += "<div>追问" + list[i].PutContent + "</div>";
                    if (list[i].AnswerContent == null) {
                        html += "<div>回答："
                        html += "<textarea  id='txtanconth' name='txtanconth'></textarea></div>"
                        html += "<div><input type='hidden'  id='txtid' name='txtid' value='" + list[i].Id + "' /></div>"
                    } else {
                        html += "<div>" + list[i].AnswerName + "回答：" + list[i].AnswerContent + "</div>";

                    }
                }
            }
        }
    }
    var html = "<div style=' padding:10px; height:auto'>" + html + "</div>";
    var submit = function (v, h, f) {
        if (v == "ok") {

            //更改查看状态
            if (f.txtancont != undefined) {
                if (f.txtancont.trim() != "") {
                    var suc = admin_LeaveMessage_Requetion.Addanswer(f.txtqid, f.txtancont).value;
                    if (suc > 0) {
                        top.$.jBox.tip('回复成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                    } else {
                        top.$.jBox.tip('回复失败！', 'error', { timeout: 1000 });
                    }
                }
            } else if (f.txtanconth != undefined) {
                if (f.txtancont.trimh() != "") {
                    var sucs = admin_LeaveMessage_Requetion.AddPut(f.txtid, f.txtanconth).value;
                    if (sucs > 0) {
                        top.$.jBox.tip('回复成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                    } else {
                        top.$.jBox.tip('回复失败！', 'error', { timeout: 1000 });
                    }
                }
            }
        }
    };
    top.$.jBox(html, { submit: submit, top: "200px" });
}

//格式日期方法
Date.prototype.pattern = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份          
        "d+": this.getDate(), //日          
        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时          
        "H+": this.getHours(), //小时          
        "m+": this.getMinutes(), //分          
        "s+": this.getSeconds(), //秒          
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度          
        "S": this.getMilliseconds() //毫秒          
    };
    var week = {
        "0": "\u65e5",
        "1": "\u4e00",
        "2": "\u4e8c",
        "3": "\u4e09",
        "4": "\u56db",
        "5": "\u4e94",
        "6": "\u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}
//string 转为 datetime
function convertToDateTime(s) {
    var d = new Date(s)
    return d.pattern("yyyy-MM-dd HH:mm:ss");
}
//删除  -- baseinfo(基础信息)
function delbaseinfo() {
    var select_length = $("#baseinfolist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    var srcstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#baseinfolist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
        srcstr = srcstr + tempvalue.split(",")[1] + ",";
    }

    var endstr = idstr.substring(-1, idstr.length - 1);
    var endsrcstr = srcstr.substring(-1, srcstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_BaseInfo_BaseInfo.DelBaseInfo(endstr,endsrcstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_BaseInfo_BaseInfo.UserLog().value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}
//删除  -- LeavelMessage
function delLeavelMessage() {
    var select_length = $("#messlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        idstr = idstr + $("#messlist ol").find("input[type=checkbox]:checked")[mlength].value + ","
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_LeaveMessage_LeavelMessage.DelMess(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_LeaveMessage_LeavelMessage.UserLog("Delete").value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}


//删除  -- Requetion
function delRequetion() {
    var select_length = $("#requlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        idstr = idstr + $("#requlist ol").find("input[type=checkbox]:checked")[mlength].value + ","
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_LeaveMessage_Requetion.DelRequ(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_LeaveMessage_Requetion.UserLog("Delete").value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}

//删除 备份
function dealBackup() {
    var select_length = $("#backuplist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    var srcstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#backuplist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
        srcstr = srcstr + tempvalue.split(",")[1] + ",";
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var endsrcstr = srcstr.substring(-1, srcstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_System_SqlBackUp.DelBackUpInfo(endstr, endsrcstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_System_SqlBackUp.UserLog().value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}
//删除  --  resource
function delresource() {
    var select_length = $("#reslist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    var srcstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#reslist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
        srcstr = srcstr + tempvalue.split(",")[1] + ",";
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var endsrcstr = srcstr.substring(-1, srcstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_ResourceInfo_ResourceInfo.DelResouce(endstr, endsrcstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_ResourceInfo_ResourceInfo.UserLog(function (red) {
                    if (red.value < 0) {
                        top.$.jBox.tip('操作日志记录失败！', 'error', { timeout: 1000 });
                    }
                });
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}
//删除  -- SystemLog
function delSystemLog() {
    var select_length = $("#sloglist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        idstr = idstr + $("#sloglist ol").find("input[type=checkbox]:checked")[mlength].value + ","
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_System_SiteLog.DelSystemLog(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () {
                   // alert(this.window.location.href);
                 //   window.location.href = this.window.location.href;
                        location.reload(true);
                }
                });
                admin_System_SiteLog.UserLog().value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}


//login 验证
function logincheck() {
    var uname = document.getElementById("TxtUserName").value;
    var upwd = document.getElementById("TxtPassword").value;
    var ucheck = document.getElementById("txtcheck").value;
    if(uname.trim()==""){
        alert("用户名不能为空！");
        document.getElementById("TxtUserName").focus();
    return false;
    }
    if (upwd.trim() == "") {
        alert("密码不能为空！");
        document.getElementById("TxtPassword").focus();
        return false;
    }
    if (ucheck.trim() == "") {
        alert("验证码不能为空！");
        document.getElementById("txtcheck").focus();
        return false;
    }
}

//验证方法 -- newsedit  
function txtcheck() {
    if ($("#title").val() == "") {
        $.jBox.tip("标题不能为空！", 'error');
        $("#title").focus();
        return false;
    }
    if (isNaN($("#orderid").val())) {
        $.jBox.tip("排序编号应为数字！", 'error');
        $("#orderid").focus();
        return false;
    }
    if (isNaN($("#looks").val())) {
        $.jBox.tip("浏览次数应为数字！", 'error');
        $("#looks").focus();
        return false;
    }
    if (CKEDITOR.instances.edit_content.getData() == "") {
        $.jBox.tip("内容不能为空！", 'error');
        CKEDITOR.instances.edit_content.focus();
        return false;
    }
}
//验证方法--baseedit
function baseeditcheck() {
    if ($("#txttitle").val().trim() == "") {
        $.jBox.tip("标题不能为空！", 'error');
        $("#txttitle").focus();
        return false;
    }
    if ($("#Base_editdiv").is(":visible")) {
        if (CKEDITOR.instances.edit_content.getData().trim() == "") {
            $.jBox.tip("内容不能为空！", 'error');
            CKEDITOR.instances.edit_content.focus();
            return false;
        }
    }
}


//验证方法--banneredit
function bannereditcheck() {
    if ($("#txtDirection").val().trim() == "") {
        $.jBox.tip("位置不能为空！", 'error');
        $("#txtDirection").focus();
        return false;
    }
    if (isNaN($("#txtOrder").val())) {
        $.jBox.tip("排序应为数字！", 'error');
        $("#txtOrder").focus();
        return false;
    }
}
//验证方法--classedit 
function classeditcheck() {
    if ($("#txtClassName").val().trim() == "") {
        $.jBox.tip("课程名称不能为空！", 'error');
        $("#txtClassName").focus();
        return false;
    }
    if (isNaN($("#txtOrder").val())) {
        $.jBox.tip("排序应为数字！", 'error');
        $("#txtOrder").focus();
        return false;
    }
    if ($("#txtCase").val().trim() == "") {
        $.jBox.tip("资费不能为空！", 'error');
        $("#txtCase").focus();
        return false;
    }
    if (isNaN(($("#txtCase").val().trim()).replace('.', ''))) {
        $.jBox.tip("资费应为数字！", 'error');
        $("#txtCase").focus();
        return false;
    }
}




