
//添加
function showaddPower() {
    admin_UserInfo_PowerInfo.GetAll(addPower);
}
function addPower(red) {
    var alllist = red.value;
    var html = "<div style='padding:10px;'>父级名称：<select id='pidname' name='pidname'>";
    html += " <option value='0'>根节点</option>";
    if (alllist != null) {
        for (var i = 0; i < alllist.length; i++) {
            html += " <option value='" + alllist[i].Id.toString() + "'>" + alllist[i].PageName.toString(); +"</option>";
        }
    }
    html += "</select></div>";
    html += "<div style='padding:10px;'>页面名称：<input type='text' id='txtpagename' name='txtpagename' /></div>";
    html += "<div style='padding:10px;'>页面路径：<input type='text' id='txtsrc' name='txtsrc' /></div>";
    html += "<div style='padding:10px;'>排序序号：<input type='text' id='txtorder' name='txtorder' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtpagename.trim() == "") {
                top.$.jBox.tip('页面名称不能为空!', 'error', { timeout: 1000 });
                return;
            }
            //if (f.txtsrc.trim() == "") {
            //    top.$.jBox.tip('页面路径不能为空!', 'error', { timeout: 1000 });
            //    return;
            //}
            if (isNaN(f.txtorder.trim())) {
                top.$.jBox.tip('排序序号应为数字!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_UserInfo_PowerInfo.AddPower(f.pidname, f.txtpagename, f.txtsrc, f.txtorder).value; //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_UserInfo_PowerInfo.UserLog("Add").value;
            } else if (success == 2) {
                top.$.jBox.tip('添加失败，已存在相同类型！', 'error', {timeout:1000});
            } else {
                top.$.jBox.tip('添加失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "添加", submit, { buttons: { '添加': true, '取消': false }, top: "200px" });

}

//修改
function showeditPower(id,pid,pname,psrc,porder) {
    admin_UserInfo_PowerInfo.GetAll(function (red) {
        var alllist = red.value;
        var html = "<div style='padding:10px;'>父级名称：<select id='pidname' name='pidname'>";
        html += " <option value='0'>根节点</option>";
        if (alllist != null) {
            for (var i = 0; i < alllist.length; i++) {
                if (alllist[i].Id.toString() == pid) {
                    html += " <option value='" + alllist[i].Id.toString() + "' selected='selected'>" + alllist[i].PageName.toString(); +"</option>";
                } else {
                    html += " <option value='" + alllist[i].Id.toString() + "'>" + alllist[i].PageName.toString(); +"</option>";
                }
            }
        }
        html += "</select></div>";
        html += "<div style='padding:10px;'>页面名称：<input type='text'  id='txtpagename' value='" + pname + "' name='txtpagename' /></div>";
        html += "<div style='padding:10px;'>页面路径：<input type='text'  id='txtsrc'  value='" + psrc + "'  name='txtsrc' /></div>";
        html += "<div style='padding:10px;'>排序序号：<input type='text'  id='txtorder'  value='" + porder + "'  name='txtorder' /></div>";
        var submit = function (v, h, f) {
            if (v == true) {
                if (f.txtpagename.trim() == "") {
                    top.$.jBox.tip('页面名称不能为空!', 'error', { timeout: 1000 });
                    return;
                }
                //if (f.txtsrc.trim() == "") {
                //    top.$.jBox.tip('页面路径不能为空!', 'error', { timeout: 1000 });
                //    return;
                //}
                if (isNaN(f.txtorder.trim())) {
                    top.$.jBox.tip('排序序号应为数字!', 'error', { timeout: 1000 });
                    return;
                }
                var success = admin_UserInfo_PowerInfo.EditRoles(id,f.pidname, f.txtpagename, f.txtsrc, f.txtorder).value; //-1,1,2
                if (success == 1) {
                    top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                    admin_UserInfo_PowerInfo.UserLog("Update").value;
                } else if (success == 2) {
                    top.$.jBox.tip('修改失败，已存在相同类型！', 'error', { timeout: 1000 });
                } else {
                    top.$.jBox.tip('修改失败！', 'error', { timeout: 1000 });
                }
            }
        };
        top.$.jBox.confirm(html, "修改", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });

     });
}