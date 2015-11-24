
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

//全选--工具方法
function AllSelect(id) {
    $("#" + id + " ol").find("input[type=checkbox]").attr("checked", $("#allcheckbox").attr("checked"));
}
//查询--工具方法
function showselect(id) {
    $("#" + id).slideToggle();
}
//查询--工具方法
function showbyselect() {
    $(".select").slideToggle();
}
//查询--工具方法
function tshowselect(id) {
    $("." + id).slideToggle();
}
function alertmsg(msg) {
    top.$.jBox.error(msg, 'error', { top: "200px" });
}
//Tool  返回按钮--工具方法
function Toolbtnreturn(mflag) {
    if (mflag == 1) {
        location.href = 'NewsInfo.aspx';
    } else if (mflag == 2) {
        location.href = 'BaseInfo.aspx';
    } else if (mflag == 3) {
        location.href = 'ServiceInfo.aspx';
    } else if (mflag == 4) {
        location.href = 'CourseInfo.aspx';
    }   else if (mflag == 6) {
        location.href = 'StudentInfo.aspx';
    } else if (mflag == 7) {
        location.href = 'TeacherInfo.aspx';
    } else if (mflag == 8) {
        location.href = 'TeamInfo.aspx';
    } else if (mflag == 9) {
        location.href = 'BannerList.aspx';
    } else {
        history.back(-1);
    }
}
//Tool  添加按钮--工具方法
function addbtn(linkstr) {
    location.href = linkstr + ".aspx";
}
function Toolbtnadd(mflag) {
    if (mflag == 1) {
        location.href = 'NewsEdit.aspx';
    } else if (mflag == 2) {
        location.href = 'BaseEdit.aspx';
    } else if (mflag == 3) {
        location.href = 'ResourceEdit.aspx';
    } else if (mflag == 4) {
        location.href = 'CourseEdit.aspx';
    }  else if (mflag == 6) {
        location.href = 'StudentEdit.aspx';
    } else if (mflag == 7) {
        location.href = 'TeacherEdit.aspx';
    } else if (mflag == 8) {
        location.href = 'TeamEdit.aspx';
    } else if (mflag == 9) {
        location.href = 'BannerEdit.aspx';
    } else {
        history.back(-1);
    }
}
//弹出信息--工具方法
function addatedit(mtitle, msuccess) {
    if (msuccess == -2) {
        top.$.jBox.tip("" + mtitle + "失败，此登录名已存在！");
    } else if (msuccess > 0) {
        top.$.jBox.tip("" + mtitle + "成功！");
    } else {
        top.$.jBox.tip("" + mtitle + "失败！");
    }
}
//弹出信息--工具方法
function banneratedit(mtitle, msuccess) {
    if (msuccess > 0) {
        top.$.jBox.tip("" + mtitle + "成功！");
    } else {
        top.$.jBox.tip("" + mtitle + "失败！");
    }
}
//弹出信息--工具方法
function TypeAtEdit(mtitle, msuccess) {
    if (msuccess == -2) {
        top.$.jBox.tip("" + mtitle + "失败，已存在相同类型的标题！");
    } else if (msuccess > 0) {
        top.$.jBox.tip("" + mtitle + "成功！");
    } else {
        top.$.jBox.tip("" + mtitle + "失败！");
    }
}
/////////////////弹框
//错误信息
function alertError(errorStr) {
    top.$.jBox.tip(errorStr + "", 'error', { top: "200px", timeout: 1000 });
}
//成功信息
function alertSuccess(sucStr) {
    top.$.jBox.tip(sucStr + "", 'success', { top: "200px", timeout: 1000 });
}
/////////////////

/////////////////验证
jQuery.fn.extend({
    //非空验证      if (!$("#txtoldPwd").checktxt("原密码不能为空!")) {
    // return false;
    //}
    checktxt: function (errorStr) {
        if ($(this).val().trim() == "") {
            top.$.jBox.tip(errorStr + "", 'error', { top: "200px", timeout: 1000 });
            $(this).focus();
            return false;
        } else {
            return true;
        }
    }, //是否相等
    checkEquals: function (errorStr, controlId) {
         if ($(this).val().trim() != $("#" + controlId).val().trim()) {
             top.$.jBox.tip(errorStr + "", 'error', { top: "200px", timeout: 1000 });
            $(this).focus();
            return false;
        } else {
            return true;
        }
    }


}); 
////////////////
 
//根据id获取判断是否选中
function ToolSelect_Length(id) {
    var select_length = $("#" + id + " ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return false;
    }
    return true;
}
//根据id获取选中列表
function ToolGetId(id) {
    var select_length = $("#" + id + " ol").find("input[type=checkbox]:checked").length;
    var idstr = new Array();
    for (var mlength = 0; mlength < select_length; mlength++) {
        idstr.push($("#classtypelist ol").find("input[type=checkbox]:checked")[mlength].value);
    }
    return idstr;
}
////////////////////
//所选个数
function GetLength() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return true;
    } else {
        return false;
    }
}
//return   id
function GetListId() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    var idstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue + ",";
    }
    return idstr.substring(-1, idstr.length - 1);
}

//根据id获取选中列表
function GetIdByArry() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    var idstr = new Array();
    for (var mlength = 0; mlength < select_length; mlength++) {
        idstr.push($("#divlist ol").find("input[type=checkbox]:checked")[mlength].value);
    }
    return idstr;
}

//return id  img is src
function GetListIdandSrc() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    var idstr = "";
    var srcstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
        srcstr = srcstr + tempvalue.split(",")[1] + ",";
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var endsrcstr = srcstr.substring(-1, srcstr.length - 1);
    var arry = [endstr, endsrcstr];
    return arry;
}
//删除  --  没有图片
function delListTip(methodname,tipstr) {
    if (GetLength()) {
        return;
    }
    var arry = GetListId();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = eval(methodname).DelModel(arry).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                eval(methodname).UserLog().value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(tipstr, "提示", submit, { top: '200px' });
}
//删除  --  没有图片
function delList(methodname) {
    if (GetLength()) {
        return;
    }
    var arry = GetListId();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = eval(methodname).DelModel(arry).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                eval(methodname).UserLog().value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}
//删除  --  有图片
function delImgAndListTip(methodname,tipstr) {
    if (GetLength()) {
        return;
    }
    var arry = GetListIdandSrc();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = eval(methodname).DelModel(arry[0], arry[1]).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                eval(methodname).UserLog().value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(tipstr, "提示", submit, { top: '200px' });
}
//删除  --  有图片
function delImgAndList(methodname) {
    if (GetLength()) {
        return;
    }
    var arry = GetListIdandSrc();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = eval(methodname).DelModel(arry[0], arry[1]).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                eval(methodname).UserLog().value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}
////////////////////


//li隔行变色
$(document).ready(function () {
    var allli = $("ol li");
    var firstli = $("ol .liright").first();
    var linelength = allli.index(firstli) + 1; //总列数
    var allline = allli.length / linelength; //总行数
    for (var i = 0; i < allline; i++) {
        //判断偶数
        if (i % 2 == 0) {
            for (var kl = i * linelength; kl < (i + 1) * linelength; kl++) {
                allli.eq(kl).addClass("liliaa");
            }
        } else {
            for (var kl = i * linelength; kl < (i + 1) * linelength; kl++) {
                allli.eq(kl).addClass("lilibb");
            }
        }
    }
});
