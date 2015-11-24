//-------公用-----------
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
    var arry=[endstr,endsrcstr];
    return arry;
}

// StuUserInfo--删除
function delStuUserInfo() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    var srcstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
        srcstr = srcstr + tempvalue.split(",")[1] + ",";
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var endsrcstr = srcstr.substring(-1, srcstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_Student_StudentInfo.DelStuUsers(endstr,endsrcstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_Student_StudentInfo.UserLog(function (red) {
                    if (red.value < 0) {
                        top.$.jBox.tip('操作日志记录失败！', 'error', { timeout: 1000 });
                    }
                });
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("删除学员时，学员的留言会一同删除！</br>确定要删除所选数据吗？", "提示", submit, { top: '200px' });
}
// StuUserInfo--审核
function ComShenHe(mmathsi,id,audstate) {
   var submit = function (v, h, f) {
        if (v == 'ok') {
        ShenHe(mmathsi,id);
        }
    };
if(audstate!="0"){
  top.$.jBox.confirm("该学员已经被审核过，是否要重新审核？", "提示", submit, { top: '200px' });
}else{
 ShenHe(mmathsi,id);
}
}
// StuUserInfo--单个审核
function ShenHe(mmathsi,id) {
    var submit = function (v, h, f) {
        if (v == 'tong') {
            //接受参数为string 单个会自动转为int
            admin_Student_StudentInfo.ShenHe(id+','+id,'tong',function(red){
            var suc=red.value;
                if(suc[1]==1){
                     top.$.jBox.tip('审核成功：状态为通过！', 'info', { timeout: 1000 });
                     $(mmathsi).parent().prev().prev().html("通过");
                     $(mmathsi).parent().prev().prev().prev().html(suc[0]);
                     admin_Student_StudentInfo.UserLog("Update").value;
                }else{
                  top.$.jBox.tip('审核失败！', 'info', { timeout: 1000 });
                }
            })
            return false;
        }else if(v == 'notong'){
            admin_Student_StudentInfo.ShenHe(id+','+id,'notong',function(red){
            var suc=red.value;
            if(suc[1]==1){
                     top.$.jBox.tip('审核成功：状态为未通过！', 'info', { timeout: 1000 });
                     $(mmathsi).parent().prev().prev().html("未通过");
                     $(mmathsi).parent().prev().prev().prev().html(suc[0]);
                     admin_Student_StudentInfo.UserLog("Update").value;
                }else{
                  top.$.jBox.tip('审核失败！', 'info', { timeout: 1000 });
                }
            })
            return false;
        }
        else if(v=='cenel'){
            return true;
        }
        return true;
    };
    top.$.jBox("iframe:Student/ModelInfo.aspx?id=" + id, {
        title: "审核",
        width: 600,
        height: 350,
        buttons: {'通过': 'tong','不通过':'notong','关闭': 'cenel'},
        submit: submit,
        bottomText: '请查看资料后审核该信息！'
    });
}

// StuUserInfo--批量审核
function AllShenHe() {
 var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'tong') {
          var suc =  admin_Student_StudentInfo.ShenHe(endstr,'tong').value;
          if(suc[1]>=1){
            top.$.jBox.tip('批量审核成功：状态为通过！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
            admin_Student_StudentInfo.UserLog("Update").value;
          }else{
            top.$.jBox.tip('批量审核失败！', 'info', { timeout: 1000 });
          }
        }else if(v=='notong'){
          var suc =  admin_Student_StudentInfo.ShenHe(endstr,'notong').value;
          if(suc[1]>=1){
            top.$.jBox.tip('批量审核成功：状态为未通过！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
            admin_Student_StudentInfo.UserLog("Update").value;
          }else{
            top.$.jBox.tip('批量审核失败！', 'info', { timeout: 1000 });
          }
        }
    };
    top.$.jBox.confirm("已选中" + select_length + "个学员，请选择操作？", "批量操作", submit,
       {
        top: '200px', 
        buttons: { '通过': 'tong', '不通过': 'notong', '关闭': 'cenel' }
       });
}

// teacherinfo--删除
function delTeacherInfo() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    var srcstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
        srcstr = srcstr + tempvalue.split(",")[1] + ",";
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var endsrcstr = srcstr.substring(-1, srcstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            //alert(f.pidname);
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_Teacher_TeacherInfo.DelModel(endstr,endsrcstr,f.pidname).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_Teacher_TeacherInfo.UserLog(function (red) {
                    if (red.value < 0) {
                        top.$.jBox.tip('操作日志记录失败！', 'error', { timeout: 1000 });
                    }
                });
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    //除了所选教师  全部教师
//    top.$.jBox.tip("正在删除数据...", 'loading');    
    var alllist = admin_Teacher_TeacherInfo.GetAllBySelect(endstr).value;
    var html = "<div style='padding:10px;'>请为所选教师的课程指定新的主讲教师？</div><div style='padding:10px;'>主讲教师：<select id='pidname' style='width:153px;' name='pidname'>";
    html += " <option value='0'>无</option>";
    if (alllist != null) {
        for (var i = 0; i < alllist.length; i++) {
            html += " <option value='" + alllist[i].Tid.toString() + "'>" + alllist[i].TName.toString(); +"</option>";
        }
    }
    html += "</select></div>";
    top.$.jBox.confirm(html, "删除",'question',  {submit:submit,bottomText:'注：没有选择时，教师和课程一同删除' , buttons: { '提交': 'ok', '取消': false }, top: "200px"});
}


//删除  -- classinfo
function delCourseInfo() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    var srcstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue.split(",")[0] + ",";
        srcstr = srcstr + tempvalue.split(",")[1] + ",";
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var endsrcstr = srcstr.substring(-1, srcstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_CourseInfo_CourseInfo.DelCourseInfo(endstr,endsrcstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_CourseInfo_CourseInfo.UserLog(function (red) {
                    if (red.value < 0) {
                        top.$.jBox.tip('操作日志记录失败！', 'error', { timeout: 1000 });
                    }
                });
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("删除课程时，与之相关联的留言和目录会一同删除！</br>确定要删除数据吗？", "提示", submit, { top: '200px' });
}

//删除  -- FcatalogInfo
function delFcatalogInfo() {
    if (GetLength()) {
        return;
    }
    var endstr = GetListId();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_FcatalogInfo_FcatalogInfo.DelModel(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_FcatalogInfo_FcatalogInfo.UserLog(function (red) {
                    if (red.value < 0) {
                        top.$.jBox.tip('操作日志记录失败！', 'error', { timeout: 1000 });
                    }
                });
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？</br>注：二级目录会一同删除！", "提示", submit, { top: '200px' });
}
//删除  -- ScatalogInfo
function delScatalogInfo() {
    if (GetLength()) {
        return;
    }
    var endstr = GetListId();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_FcatalogInfo_ScatalogInfo.DelModel(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_FcatalogInfo_ScatalogInfo.UserLog(function (red) {
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
//删除TFinfo
function delTFinfo() {
    if (GetLength()) {
        return;
    }
    var arry = GetListIdandSrc();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_TFInfo_TFInfo.DelModel(arry[0], arry[1]).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_TFInfo_TFInfo.UserLog(function (red) {
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
//修改订单状态
function chengeOrderState(statevalue) {
    // alert(theme);
    var html = "<div style='padding:10px;'>订单状态：<select id='selecttheme' name='selecttheme'>";
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
                //setCookie('theme', f.selecttheme);
                //if (getCookie('theme') == f.selecttheme) {
                //    // top.$.jBox.tip('修改成功，请刷新页面!', 'success', { timeout: 1000 });
                //    getThemename();
                //    top.window.location.href = top.window.location.href;
                //}
                return;
            }

        }
    };
    top.$.jBox.confirm(html, "修改", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });
}
//删除  --  没有图片
function delList(methodname) {
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
//删除  --  没有图片  自定义提示
function delListTip(methodname,tipstr) {
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