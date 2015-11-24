//添加
function showaddNewsType() {
    var html = "<div style='padding:10px;'>新建类型：<input type='text'  id='txtnewstype' name='txtnewstype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtnewstype.trim() == "") {
                top.$.jBox.tip('新建类型不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_Activity_ActivityType.AddActivityType(f.txtnewstype).value;  //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_Activity_ActivityType.UserLog("Add").value;
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
function showeditNewsType(id, txttype) {
    var html = "<div style='padding:10px;'>活动类型：<input type='text' value=" + txttype + "  id='txtnewstype' name='txtnewstype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtnewstype.trim() == "") {
                top.$.jBox.tip('类型不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_Activity_ActivityType.EditNewType(id, f.txtnewstype).value;
            //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_Activity_ActivityType.UserLog("Update").value;
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