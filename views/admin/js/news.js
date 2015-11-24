//添加
function showaddNewsType() {
    var html = "<div style='padding:10px;'>新建类型：<input type='text'  id='txtnewstype' name='txtnewstype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtnewstype.trim() == "") {
                top.$.jBox.tip('新建类型不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_NewsInfo_NewsType.AddNewsType(f.txtnewstype).value;  //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_NewsInfo_NewsType.UserLog("Add").value;
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
    var html = "<div style='padding:10px;'>资讯类型：<input type='text' value=" + txttype + "  id='txtnewstype' name='txtnewstype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtnewstype.trim() == "") {
                top.$.jBox.tip('类型不能为空!', 'error', { timeout: 1000 });
                return;
            }
            var success = admin_NewsInfo_NewsType.EditNewType(id, f.txtnewstype).value;
            //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_NewsInfo_NewsType.UserLog("Update").value;
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
//绑定类型下拉框--newsinfo
function newsinfoready() {
    setTimeout(bindlist, 1000);
}
//绑定类型下拉框--newsinfo
function bindlist() {
    //类型
    var select_ntype = $("#rdlnewstype")[0];
    var list = admin_NewsInfo.GetList().value;
    select_ntype.options.length = 0;
    var newoption1 = new Option();
    newoption1.value = "0";
    newoption1.text = "所有";
    select_ntype.options.add(newoption1);
    if (list != null) {
        for (var i = 0; i < list.length; i++) {
            var newoption = new Option();
            newoption.value = list[i].Id.toString();
            newoption.text = list[i].TypeName.toString();
            select_ntype.options.add(newoption);
        }
    }
    //用户
    var select_users = $("#rdlusers")[0];
    var userlist = admin_NewsInfo.GetUser().value;
    select_users.options.length = 0;
    var newoption2 = new Option();
    newoption2.value = "0";
    newoption2.text = "所有";
    select_users.options.add(newoption2);
    if (userlist != null) {
        for (var i = 0; i < userlist.length; i++) {
            var newoption = new Option();
            newoption.value = userlist[i].Id.toString();
            newoption.text = userlist[i].UserName.toString();
            select_users.options.add(newoption);
        }
    }
    clearTimeout(bindlist);
}
//删除  -- 资讯
function showdelNewsInfo() {
    delList('admin_NewsInfo');
}