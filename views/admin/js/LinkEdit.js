//全选
function AllSelect() {
    $("#divlist ol").find("input[type=checkbox]").attr("checked", $("#allcheckbox").attr("checked"));
}
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
//添加
function showaddLink() {
    var html = "<div style='padding:10px;'>链接名称：<input type='text'   id='txtlinkname' name='txtlinkname' /></div>" +
    "<div style='padding:10px;'>链接地址：<input type='text' value='http://'  id='txtlinksrc' name='txtlinksrc' /></div>";
    html += "<div style='padding:10px;'>是否启用：<select id='rdlisshow' name='rdlisshow'><option value='1'>否</option><option value='2'>是</option></select></div>";
   
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtlinkname.trim() == "") {
                top.$.jBox.tip('链接名称不能为空!', 'error', { timeout: 1000 });
                return false;
            }
            if (f.txtlinksrc.trim() == "") {
                top.$.jBox.tip('链接地址不能为空!', 'error', { timeout: 1000 });
                return false;
            }
            var success = admin_LinkInfo_LinkList.AddLinks(f.txtlinkname, f.txtlinksrc, f.rdlisshow).value; //-1,1,-2
            if (success == 1) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_LinkInfo_LinkList.UserLog("Add").value;
            } else if (success == -2) {
                top.$.jBox.tip('添加失败，已存在相同名称的链接！', 'error', { timeout: 2000 });
            }else{
                top.$.jBox.tip('添加失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "添加", submit, { buttons: { '添加': true, '取消': false }, top: "200px" });
}
//修改
function showeditLink(id, txtlinkname,txtlinksrc,showid) {
    var html = "<div style='padding:10px;'>链接名称：<input type='text'  value='" + txtlinkname + "' id='txtlinkname' name='txtlinkname' /></div>" + "<div style='padding:10px;'>链接地址：<input type='text'  value='" + txtlinksrc + "'  id='txtlinksrc' name='txtlinksrc' /></div>";
    html += "<div style='padding:10px;'>是否启用：<select id='rdlisshow' name='rdlisshow'>";
    if (showid == "2") {
        html += "<option value='1' >否</option><option value='2' selected='selected'>是</option>";
        // </select></div>";
    } else {
        html += "<option value='1' selected='selected'>否</option><option value='2'  >是</option>";
    }
    html += "</select></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtlinkname.trim() == "") {
                top.$.jBox.tip('链接名称不能为空!', 'error', { timeout: 1000 });
                return false;
            }
            if (f.txtlinksrc.trim() == "") {
                top.$.jBox.tip('链接地址不能为空!', 'error', { timeout: 1000 });
                return false;
            }
            var success = admin_LinkInfo_LinkList.UpdateLinks(id, f.txtlinkname, f.txtlinksrc, f.rdlisshow).value; //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_LinkInfo_LinkList.UserLog("Update").value;
            } else if (success == -2) {
                top.$.jBox.tip('修改失败，已存在相同名称的链接！', 'error', { timeout: 2000 });
            } else {
                top.$.jBox.tip('修改失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "修改", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });
}
//删除
function showdel() {
    var select_length = $("#divlist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = "";
    for (var mlength = 0; mlength < select_length; mlength++) {
        idstr = idstr + $("#divlist ol").find("input[type=checkbox]:checked")[mlength].value + ","
    }
    var endstr = idstr.substring(-1, idstr.length - 1);
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = admin_LinkInfo_LinkList.DelLinks(endstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_LinkInfo_LinkList.UserLog("Delete").value;
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
    return false;
}
//查询
function showselect() {
    $("#linkselect").slideToggle();
}