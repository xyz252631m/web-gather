//stalk 查看详情
function ondetail(tha) {
   var aindex = $("#divlist ol").find(".liright").index($(tha).parent());
   var html= $("#divlist ol").find(".detail").eq(aindex).html();
   top.$.jBox.alert(html, "留言信息", {top:"200px"});
}


//StalkInfo--批量更改显示状态
function AllIsShow() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    if (GetLength()) {
        return;
    }
    var endstr = GetListId();
    var submit = function (v, h, f) {
        var suc = admin_Student_StalkInfo.IsShow(endstr, v.toString()).value;
        if (suc>= 1) {
            top.$.jBox.tip('批量更改状态成功：状态为' + (v == true ? "显示" : "不显示") + '！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
            admin_Student_StalkInfo.UserLog("Update").value;
        } else {
            top.$.jBox.tip('批量更改状态失败！', 'info', { timeout: 1000 });
        }
    };
    top.$.jBox.confirm("已选中" + select_length + "条留言，请选择操作？", "批量操作", submit,
       {
           top: '200px',
           buttons: { '显示':true, '不显示': false, '关闭': 'cenel' }
       });
}




//stalk 删除
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
//返回id
function GetListId() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    var idstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempvalue = $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value;
        idstr = idstr + tempvalue + ",";
    }
    return idstr.substring(-1, idstr.length - 1);
}
//删除  -- delstalk
function delstalk() {
    if (GetLength()) {
        return;
    }
    var endstr = GetListId();
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_Student_StalkInfo.DelModel(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_Student_StalkInfo.UserLog(function (red) {
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