//添加
function showaddclasstype() {
    var html = "<div style='padding:10px;'>新建类型：<input type='text'  id='txtnewstype' name='txtnewstype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtnewstype.trim() == "") {
                top.$.jBox.tip('新建类型不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_ClassInfo_ClassType.AddClassType(f.txtnewstype).value;  //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_ClassInfo_ClassType.UserLog("Add").value;
            } else if (success == 2) {
                top.$.jBox.tip('添加失败，已存在相同类型！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('添加失败！', 'error', { timeout: 1000 });
            }
            return true;
        }
    };
    top.$.jBox.confirm(html, "添加", submit, { buttons: { '添加': true, '取消': false }, top: "200px" });
}
//修改
function showeditclasstype(id, txttype) {
    var html = "<div style='padding:10px;'>课程类型：<input type='text' value=" + txttype + "  id='txtnewstype' name='txtnewstype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtnewstype.trim() == "") {
                top.$.jBox.tip('类型不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_ClassInfo_ClassType.EditClassType(id, f.txtnewstype).value;
            //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_ClassInfo_ClassType.UserLog("Update").value;
            } else if (success == 2) {
                top.$.jBox.tip('修改失败，已存在相同类型！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('修改失败！', 'error', { timeout: 1000 });
            }
            return true;
        }
    };
    top.$.jBox.confirm(html, "修改", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });
}


//删除
function showdel() {
    if (ToolSelect_Length('classtypelist')) {
        var idstr = ToolGetId('classtypelist');
        var submit = function (v, h, f) {
            if (v == 'ok') {
                top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
                var success = admin_ClassInfo_ClassType.DelClassType(idstr).value;
                if (success > 0) {
                    top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                    admin_ClassInfo_ClassType.UserLog(function (red) {
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
} 