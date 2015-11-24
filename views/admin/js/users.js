//添加角色
function showaddroles() {
    var html = "<div style='padding:10px;'>角色名称：<input type='text'  id='txtrolename' name='txtrolename' /></div>";
    html = html + "<div style='padding:10px;'>父级角色：<select id='rdlroles' name='rdlroles'>";
    var list = admin_UserInfo_RoleInfo.AllRoles().value;
    if (list != null) {
        for (var i = 0; i < list.length; i++) {
            html = html + "<option value='" + list[i].Id.toString() + "' >" + list[i].RolesName.toString() + "</option>"
        }
    }
    html = html + "</select></div>";
    html += "<div style='padding:10px;'>角色说明：<input type='text'  id='txtremarks' name='txtremarks' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtrolename.trim() == "") {
                top.$.jBox.tip('角色名称不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_UserInfo_RoleInfo.AddRoles(f.txtrolename, f.rdlroles, f.txtremarks).value;  //-1,1,-2
            if (success == 1) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_UserInfo_RoleInfo.UserLog("Add").value;
            } else if (success == -2) {
                top.$.jBox.tip('添加失败，已存在相同名称的角色！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('添加失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "添加", submit, { buttons: { '添加': true, '取消': false }, top: "200px" });
}
//修改角色
function showeditroles(id, rolename, pidname, remarks) {

    if (admin_UserInfo_RoleInfo.IfRoles(id).value < 1) {
        top.$.jBox.tip('您没有修改此用户的权限!', 'error', { timeout: 1000 });
        return;
    }

    var html = "<div style='padding:10px;'>角色名称：<input type='text' value='"+rolename+"'  id='txtrolename' name='txtrolename' /></div>";
    html = html + "<div style='padding:10px;'>父级角色：<select id='rdlroles'  name='rdlroles'>";
    var list = admin_UserInfo_RoleInfo.AllRoles().value;
    if (list != null) {
        for (var i = 0; i < list.length; i++) {
            if (list[i].RolesName.toString() == pidname) {
                html = html + "<option value='" + list[i].Id.toString() + "' selected='selected' >" + list[i].RolesName.toString() + "</option>";
            } else {
                html = html + "<option value='" + list[i].Id.toString() + "' >" + list[i].RolesName.toString() + "</option>";
            }
        }
    }
    html = html + "</select></div>";
    html += "<div style='padding:10px;'>角色说明：<input type='text' value='" + remarks + "' id='txtremarks' name='txtremarks' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtrolename.trim() == "") {
                top.$.jBox.tip('角色名称不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_UserInfo_RoleInfo.EditRoles(id, f.txtrolename, f.rdlroles, f.txtremarks).value;  //-1,1,-2
            if (success == 1) {
                top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_UserInfo_RoleInfo.UserLog("Update").value;
            } else if (success == -2) {
                top.$.jBox.tip('修改失败，已存在相同名称的角色！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('修改失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "修改信息", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });
}


//用户编辑--验证
function infoGotoEdit(userid) {
    admin_UserInfo_UserInfo.IfRoles(userid, function (red) {
        if (red.value > 0) {
            location.href = 'UserEdit.aspx?id=' + userid;
        } else {
            $.jBox.tip("您没有修改用户信息的权限！", 'error', { timeout: 200 });
        }
    });
}
//删除 user roles
function showdelroles() {
    if (GetLength()) {
        return;
    }
    var endstr = GetListId();
    if (admin_UserInfo_RoleInfo.IfRolesByDelete(endstr).value < 1) {
        top.$.jBox.tip('您没有删除此用户的权限!', 'error', { timeout: 1000 });
        return;
    }
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作
            var success = admin_UserInfo_RoleInfo.DelRoles(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_UserInfo_RoleInfo.UserLog("Delete").value;
            } else if (success == -2) {
                top.$.jBox.tip('添加失败，此角色不可删除！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
    return false;
}


function GoPower(roleid) {
    if (admin_UserInfo_RoleInfo.IfRoles(roleid).value < 1) {
        top.$.jBox.tip('您没有此权限!', 'error', { timeout: 1000 });
        return;
    } else {
        location.href = 'UserPowers.aspx?roleid=' + roleid;
    }
}
//绑定类型下拉框--userinfo
function UserInfoready() {
    setTimeout(binduserlist, 1000);
}
//绑定类型下拉框--userinfo
function binduserlist() {
    //类型
    var select_roles = $("#rdlroles")[0];
    var list = admin_UserInfo_UserInfo.GetRoles().value;
    select_roles.options.length = 0;
    var newoption1 = new Option();
    newoption1.value = "0";
    newoption1.text = "所有";
    select_roles.options.add(newoption1);
    if (list != null) {
        for (var i = 0; i < list.length; i++) {
            var newoption = new Option();
            newoption.value = list[i].Id.toString();
            newoption.text = list[i].RolesName.toString();
            select_roles.options.add(newoption);
        }
    }
}
//删除 userinfo
function showuserdel() {
    if (GetLength()) {
        return;
    }
    var endstr = GetListId();
    if (admin_UserInfo_UserInfo.IfRolesByDelete(endstr).value < 1) {
        $.jBox.tip("您没有删除此用户的权限！", 'error', { timeout: 500 });
        return;
    }
    var submit = function (v, h, f) {
        if (v == 'ok') {
            $.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_UserInfo_UserInfo.DelUsers(endstr).value;
            if (success > 0) {
                $.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_UserInfo_UserInfo.UserLog(function (red) {
                    if (red.value < 0) {
                        top.$.jBox.tip('操作日志记录失败！', 'error', { timeout: 1000 });
                    }
                });
            } else if (success == -2) {
                $.jBox.tip('删除失败！内置最高管理员不可删除！', 'error', { timeout: 2000 });
            } else {
                $.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
}


//修改密码--验证
function txtpwdcheck() {
    if (!$("#txtoldPwd").checktxt("原密码不能为空!")) {
        return false;
    }
    if (!$("#txttryPwd").checktxt("新密码不能为空!")) {
        return false;
    }
    if (!$("#txttryPwd").checkEquals("两次密码不一致!", "txtNewPwd")) {
        return false;
    }
}
//edit check
function txtusercheck() {
    if (!$("#txtLoginName").checktxt("用户名不能为空!")) {
        return false;
    }
    if (!$("#txtUserName").checktxt("姓名不能为空!")) {
        return false;
    }
}