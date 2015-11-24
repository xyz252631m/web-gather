$(document).ready(
        function () {
            $("#file_upload").uploadify({
                'buttonClass': 'greenfly',
                'buttonText': '选择上传文件',
                'auto': false,
                'height': 30,
                'method': 'post',
                'removeTimeout': 30,
                'fileTypeExts': '*.jpg;*.rar',
                'uploader': '../../UploadFile.aspx',
                'swf': '../../uploadify/uploadify.swf',
                'width': '120',
                'queueID': 'some_file_queue',
                'progressData': 'percentage',
                'onUploadError': function (file, errorCode, errorMsg, errorString) {
                    if (errorString == "Cancelled") return;
                    top.$.jBox.info('文件 ' + file.name + ' 上传失败，原因: ' + errorString, '消息', { top: "200px", opacity: 0 });
                },
                'onSelect': function (file) {
                    if ($("#txttitle").val().trim() != "") {
                        if ($(" .uploadify-queue-item").length > 1) {
                            top.$.jBox.info('只能上传一个，文件被取消！', '消息', { top: "200px" });
                        }
                        for (var i = 2; i <= $(" .uploadify-queue-item").length; i++) {
                            $('#file_upload').uploadify('cancel', ($(" .uploadify-queue-item")[i - 1]).id);
                        }
                    } else {
                        var mint = $("#drpMinType")[0];
                        var mintvalue = mint.options[mint.options.selectedIndex].value;
                        var success = admin_ResourceInfo_ResourceEdit.GetTitle(file.name, mintvalue).value;
                        if (success > 0) {
                            top.$.jBox.info('相同类型的标题已存在，文件被取消！', 'error', { top: '200px' });
                            $('#file_upload').uploadify('cancel', file.id);
                        }
                    }
                },
                'onUploadStart': function (file) {
                    var sel = $("#drpMaxType")[0];
                    var selvalue = sel.options[sel.options.selectedIndex].value;
                    var mint = $("#drpMinType")[0];
                    var mintvalue = mint.options[mint.options.selectedIndex].value;
                    var txttilte = $("#txttitle").val();
                    var txtremark = $("#txtremark").val();
                    var txtlname = $("#txtlname").val();
                    var id = $("#strid").val();
                    var addisedit = $("#btnupdate").is(":visible");
                    $("#file_upload").uploadify("settings", "formData",
                    { 'MaxType': selvalue, 'MinType': mintvalue, 'txttitle': txttilte, 'id': id,
                        'txtremark': txtremark, 'txtlname': txtlname, 'addisedit': addisedit
                    });
                },
                'onUploadSuccess': function (file, data, response) {
                    $('#' + file.id).find('.data').html(' 上传完毕');
                    top.$.jBox.info('文件 ' + file.name + '  上传成功！', '消息', { top: "200px",opacity:0 });
                }
                , 'onCancel': function (file) { }
                , 'onQueueComplete': function (queueData) {
                    top.$.jBox.info('共上传成功：' + queueData.uploadsSuccessful + ' 个文件', '消息', { top: "200px" });
                }
            });
        });

//添加时的验证
function addFile() {
    if ($("#txttitle").val().trim() != "") {
        var mint = $("#drpMinType")[0];
        var mintvalue = mint.options[mint.options.selectedIndex].value;
        var txttilte = $("#txttitle").val();
        var success = admin_ResourceInfo_ResourceEdit.GetTitle(txttilte, mintvalue).value;
        if (success > 0) {
            top.$.jBox.tip('相同类型的标题已存在！', 'error', { timeout: 1000 });
            return false;
        }
    }
    $('#file_upload').uploadify('upload', '*');
}
//修改
function updateFile() {
    $('#file_upload').uploadify('upload', '*');
    var addisedit = $("#filelist").is(":visible");
    if (addisedit) {
        var mint = $("#drpMinType")[0];
        var mintvalue = mint.options[mint.options.selectedIndex].value;
        var txttilte = $("#txttitle").val();
        var txtremark = $("#txtremark").val();
        var txtlname = $("#txtlname").val();
        var id = $("#strid").val();
        if (txttilte.trim() == "") {
            top.$.jBox.tip('标题不能为空！', 'error', { timeout: 1000 });
            return false;
        }

        var suc = admin_ResourceInfo_ResourceEdit.GetTitle(txttilte, mintvalue).value;
        if (suc > 0) {
            top.$.jBox.tip('相同类型的标题已存在！', 'error', { timeout: 1000 });
            return false;
        }

        var model = { Id: id, TypeId: mintvalue, Title: txttilte, Remarks: txtremark };
        var success = admin_ResourceInfo_ResourceEdit.EditFile(model).value;
        if (success > 0) {
            top.$.jBox.info('更新成功！', '消息', { top: "200px" });
        } else if (success == -2) {
            top.$.jBox.info('更新失败,相同类型的标题已存在!', '消息', { top: "200px" });
        } else {
            top.$.jBox.info('更新失败！', '消息', { top: "200px" });
        }
    }
}
//删除
function delfile() {
    var submit = function (v, h, f) {
        if (v == 'ok') {
            var pathsrc = $("#linkpath")[0].pathname;
            var success = admin_ResourceInfo_ResourceEdit.DelFile($("#strid").val(), pathsrc).value;
            if (success == 1) {
                top.$.jBox.info('删除文件成功！', 'success', { top: "200px" });
                $("#filelist").remove();
            } else if (success == -1) {
                top.$.jBox.tip('文件不存在或已删除！', 'error', { timeout: 1000 });
                $("#filelist").remove();
            } else if (success == -3) {
                top.$.jBox.tip('文件删除成功，数据更新失败！', 'error', { timeout: 1000 });
                $("#filelist").remove();
            } else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除此文件吗？", "提示", submit, { top: '200px' });
}

//添加
function showaddType() {
    var html = "<div style='padding:10px;'>类别名称：<select  style=' width:128px; margin-right:8px;' id='txtmaxtype' name='txtmaxtype' >";
    //绑定类型下拉框
        var list = admin_ResourceInfo_ResourceType.ALLResourceType().value;
        if (list != null) {
            for (var i = 0; i < list.length; i++) {
                html += "<option value='" + list[i].Id.toString() + "'>" + list[i].TypeName.toString() + "</option>";
            }
        }
    html += "</select><input type='button' value='新建' class='jbox-button jbox-button-focus jbox-button-hover' style='padding:0px 10px 0px 10px; border:none; cursor:pointer; width:46px; height:22px;' onclick='iframediv.main.addmaxtype()'/></div>";
    html += "<div style='padding:10px;'>新建分类：<input type='text'  id='txttype' name='txttype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txttype.trim() == "") {
                top.$.jBox.tip('新建分类不能为空!', 'error', { timeout: 1000 });
                return false;
            }
            var success = admin_ResourceInfo_ResourceType.AddResourceMinType(f.txtmaxtype,f.txttype).value; //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_ResourceInfo_ResourceType.UserLog("Add").value;
            } else if (success == -2) {
                top.$.jBox.tip('添加失败，已存在相同名称！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('添加失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "添加", submit, { buttons: { '添加': true, '取消': false }, top: "200px" });
}
//添加大类别
function addmaxtype() {
    var html = "<div style='padding:10px;'>新建类别：<input type='text'  id='txtmintype' name='txtmintype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txtmintype.trim() == "") {
                top.$.jBox.tip('新建类别不能为空!', 'error', { timeout: 1000 });
                return false;
            }
            var success = admin_ResourceInfo_ResourceType.AddResourceType(f.txtmintype).value; //-1,1,2
            if (success > 0) {
                top.$.jBox.tip('添加成功！', 'success', { timeout: 1000, closed: function () {
                    var select_roles = top.$("#txtmaxtype")[0];
                    var newoption1 = new Option();
                    newoption1.value = success;
                    newoption1.text = f.txtmintype;
                    newoption1.selected=true;
                    select_roles.options.add(newoption1);
                }
                });
               // admin_ResourceInfo_ResourceType.UserLog("Add").value;
            } else if (success == -2) {
                top.$.jBox.tip('添加失败，已存在相同类别！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('添加失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "添加", submit, { buttons: { '添加': true, '取消': false }, top: "220px" });
}
//修改
function showeditNewsType(id,typeid, txttype) {
    var html = "<div style='padding:10px;'>类别名称：<select   id='txtmaxtype' name='txtmaxtype' >";
    //绑定类型下拉框
    var list = admin_ResourceInfo_ResourceType.ALLResourceType().value;
    if (list != null) {
        for (var i = 0; i < list.length; i++) {
            if (list[i].Id.toString() == typeid) {
                html += "<option value='" + list[i].Id.toString() + "' selected='selected'>" + list[i].TypeName.toString() + "</option>";
            } else {
                html += "<option value='" + list[i].Id.toString() + "'>" + list[i].TypeName.toString() + "</option>";

            }
        }
    }
    html += "</select></div>";
    html += "<div style='padding:10px;'>新建分类：<input type='text'  id='txttype' value='" + txttype + "' name='txttype' /></div>";
    var submit = function (v, h, f) {
        if (v == true) {
            if (f.txttype.trim() == "") {
                top.$.jBox.tip('类型不能为空!', 'error', { timeout: 1000 });
                return false;
            }
            var success = admin_ResourceInfo_ResourceType.EditResourceType(id,f.txtmaxtype, f.txttype).value; //-1,1,2
            if (success == 1) {
                top.$.jBox.tip('修改成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
                admin_ResourceInfo_ResourceType.UserLog("Update").value;
            } else if (success == 2) {
                top.$.jBox.tip('修改失败，已存在相同类型！', 'error', { timeout: 1000 });
            } else {
                top.$.jBox.tip('修改失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm(html, "修改", submit, { buttons: { '修改': true, '取消': false }, top: "200px" });
}
//delete
function showdel() {
    var select_length = $("#restypelist ol").find("input[type=checkbox]:checked").length;
    if (select_length < 1) {
        top.$.jBox.tip('至少选择一个！', 'error', { timeout: 1000 });
        return;
    }
    var idstr = new Array();
    var minid = new Array();
    for (var mlength = 0; mlength < select_length; mlength++) {
        var tempval = $("#restypelist ol").find("input[type=checkbox]:checked")[mlength].value;
        minid.push(tempval.split(',')[0] == "" ? "0" : tempval.split(',')[0]);
        idstr.push(tempval.split(',')[1]);
    }
    var submit = function (v, h, f) {
        if (v == 'ok') {
            top.$.jBox.tip("正在删除数据...", 'loading');         // 模拟2秒后完成操作   
            var success = 1;
            var success = admin_ResourceInfo_ResourceType.DelResourceType(minid, idstr).value;
            if (success > 0) {
                top.$.jBox.tip('删除成功！', 'success', { timeout: 1000, closed: function () { location.reload(true) } });
        
                //admin_ResourceInfo_ResourceType.UserLog("Delete").value;
            } else if (success = -2) {
                top.$.jBox.tip('删除失败,请先在信息列表中将所选类型的数据清除！', 'error', { timeout: 3000, closed: function () { location.reload(true) } });
            }
            else {
                top.$.jBox.tip('删除失败！', 'error', { timeout: 1000 });
            }
        }
    };
    top.$.jBox.confirm("确定要删除数据吗？", "提示", submit, { top: '200px' });
    return false;
}


//二级下拉框
function GetMinTypeEdit() {
    var sel = $("#drpMaxType")[0];
    var selvalue = sel.options[sel.options.selectedIndex].value;
    var mintype = $("#drpMinType")[0];
    var list = admin_ResourceInfo_ResourceEdit.GetMinType(selvalue).value;
    mintype.options.length = 0;
    if (list != null) {
        if (list.length == 0) {
            var newoption1 = new Option();
            newoption1.value = "0";
            newoption1.text = "无";
            mintype.options.add(newoption1);
        }
        for (var i = 0; i < list.length; i++) {
            var newoption = new Option();
            if ($("#labmintype").val() == list[i].Id.toString()) {
                newoption.selected = true;
            }
            newoption.value = list[i].Id.toString();
            newoption.text = list[i].TypeName.toString();
            mintype.options.add(newoption);
        }
    } 
        
    
}