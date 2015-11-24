//StuUserEdit
function stuuseredit() {
    var txtLoginName = $("#txtLoginName").val();
    var txtUserName = document.getElementById("txtUserName").value;
    var txtmobile = document.getElementById("txtmobile").value;
    var txttrypwd = document.getElementById("txttrypwd").value;
    var txtpwd = document.getElementById("txtpwd").value;
    if (txtLoginName.trim() == "") {
        $.jBox.tip("用户名不能为空！", 'error');
        $("#txtLoginName").focus();
        return false;
    }
    if (txtUserName.trim() == "") {
        $.jBox.tip("姓名不能为空！", 'error');
        $("#txtUserName").focus();
        return false;
    }
    if (txtmobile.trim() == "") {
        $.jBox.tip("手机号不能为空！", 'error');
        $("#txtmobile").focus();
        return false;
    }
    var mobile = /^(1[0-9]{1})+\d{9}$/;
    if (!mobile.test(txtmobile)) {
        $.jBox.tip('请输入有效的手机号码！');
        $("#txtmobile").focus();
        return false;
    }
//    if (txttrypwd.trim() == "") {
//        $.jBox.tip("密码不能为空！", 'error');
//        $("#txttrypwd").focus();
//        return false;
//    }
    if (txtpwd.trim() != txttrypwd.trim()) {
        $.jBox.tip("密码不一致！", 'error');
        $("#txtpwd").focus();
        return false;
    }
}

//TeacherEdit
function teacheredit() {
    var txtTName = $("#txtTName").val();
    var txtmobile = document.getElementById("txtmobile").value;
    var txtTintro = document.getElementById("txtTintro").value;
    var txtTDetail = document.getElementById("txtTDetail").value;
    if (txtTName.trim() == "") {
        $.jBox.tip("姓名不能为空！", 'error');
        $("#txtTName").focus();
        return false;
    }
    if (txtmobile.trim() == "") {
        $.jBox.tip("手机号不能为空！", 'error');
        $("#txtmobile").focus();
        return false;
    }
    var mobile = /^(1[0-9]{1})+\d{9}$/;
    if (!mobile.test(txtmobile)) {
        $.jBox.tip('请输入有效的手机号码！');
        $("#txtmobile").focus();
        return false;
    }
    if (txtTintro.trim() == "") {
        $.jBox.tip("教师简介不能为空！", 'error');
        $("#txtTintro").focus();
        return false;
    }
    if (txtTDetail.trim() == "") {
        $.jBox.tip("教师详情不能为空！", 'error');
        $("#txtTDetail").focus();
        return false;
    }
}

//CourseEdit
function courseedit() {
    var txtCourseName = $("#txtCourseName").val();
    var txtClassHour = $("#txtClassHour").val();
    var txtOprice = $("#txtOprice").val();
 

    if (!$("#txtCourseName").checktxt("课程名称不能为空!")) {
        return false;
    }
    if (!$("#txtOprice").checktxt("课程价格不能为空!")) {
        return false;
    }
    if (!$("#txtClassHour").checktxt("课时不能为空!")) {
        return false;
    }
    if ($("#txtCintro").is(":visible")) {
        if (CKEDITOR.instances.txtCintro.getData().trim() == "") {
            $.jBox.tip("内容不能为空！", 'error');
            CKEDITOR.instances.txtCintro.focus();
            return false;
        }
    }

    if (!$("#txtTeacher").checktxt("师资介绍不能为空!")) {
        return false;
    }

    if (isNaN(txtClassHour)) {
        $.jBox.tip("课时应为数字！", 'error');
        $("#txtClassHour").focus();
        return false;
     }
    if (isNaN(txtOprice.replace(".",""))) {
        $.jBox.tip("课程价格应为数字！", 'error');
        $("#txtOprice").focus();
        return false;
    }
}

function tfinfoedit() {
    var txtTName = $("#txtTName").val();
    var txttype = $("#txttype").val();
    var txtTintro = $("#txtTintro").val();
    var txtTDetail = $("#txtTDetail").val();
 
    if (txtTName.trim() == "") {
        $.jBox.tip("文件名称不能为空！", 'error');
        $("#txtTName").focus();
        return false;
    }

    if (txttype.trim() == "") {
        $.jBox.tip("文件类型不能为空！", 'error');
        $("#txttype").focus();
        return false;
    }

    if (txtTintro.trim() == "") {
        $.jBox.tip("文件简介不能为空！", 'error');
        $("#txtTintro").focus();
        return false;
    }

    if (txtTDetail.trim() == "") {
        $.jBox.tip("文件详情不能为空！", 'error');
        $("#txtTDetail").focus();
        return false;
    }

}
