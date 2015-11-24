function scatainit() {
    if ($("#edit_tile").html() != "添加目录") {
        return;
    } else {
    getfatalog();
    }

}


function getfatalog() {
    var cname = $("#txtcname").val();
    if (cname.trim() == "") {
        return;
    }
    var list = admin_FcatalogInfo_ScatalogEdit.GetFcatalog(cname).value;
    //类型
    var rdlfname = $("#rdlfname")[0];
    rdlfname.options.length = 0;
    //    var newoption1 = new Option();
    //    newoption1.value = "0";
    //    newoption1.text = "所有";
    //    rdlfname.options.add(newoption1);
    if (list != null) {
        for (var i = 0; i < list.length; i++) {
            var newoption = new Option();
            newoption.value = list[i].FCatalogId.toString();
            newoption.text = list[i].FCatalogName.toString();
            rdlfname.options.add(newoption);
        }
    }
}
function scatalogedit() {
    if ($("#txtsname").val().trim() == "") {
        $.jBox.tip("目录名称不能为空！", 'error', { timeout: 1000,top:"200px" });
        $("#txtsname").focus();
        return false;
    }
    if ($("#txtcname").val().trim() == "") {
        $.jBox.tip("课程名称不能为空！", 'error', { timeout: 1000, top: "200px" });
        $("#txtcname").focus();
        return false;
    }
    return true;
}
//scatalogedit
function scacominput() {
    //创建下拉结果div
    var $selectdiv = $("<div id='selectdiv' ></div>");
    $("#form1").append($selectdiv);
    var $resultDiv = $('<div id="resultDiv"  class="resultDiv"></div>');
    //创建下拉结果ul
    var $resultUl = $('<ul id="resultUl" class="resultUl"></ul>');
    $resultUl.appendTo($resultDiv);
    $resultDiv.appendTo($("#selectdiv"));
    $("#txtcname").keyup(function (e) {
        if (e.keyCode != 40 && e.keyCode != 38 && e.keyCode != 13) {
            //结果集
            admin_FcatalogInfo_ScatalogEdit.GetList($("#txtcname").val(), function (red) {
                autocominitscata(red.value, $("#txtcname"));
            });
        }
    });
}

//
//fcatalogedit
//
function onfcatalogedit() {
    if ($("#txtfname").val().trim() == "") {
        $.jBox.tip("目录名称不能为空！", 'error', { timeout: 1000 });
        $("#txtfname").focus();
        return false;
    }
    return true;
}
//fcatalogedit
function cominput() {
    //创建下拉结果div
    var $selectdiv = $("<div id='selectdiv' ></div>");
    $("#form1").append($selectdiv);
    var $resultDiv = $('<div id="resultDiv"  class="resultDiv"></div>');
    //创建下拉结果ul
    var $resultUl = $('<ul id="resultUl" class="resultUl"></ul>');
    $resultUl.appendTo($resultDiv);
    $resultDiv.appendTo($("#selectdiv"));
    $("#txtcname").keyup(function (e) {
        if (e.keyCode != 40 && e.keyCode != 38 && e.keyCode != 13) {
            //结果集
            admin_FcatalogInfo_FcatalogEdit.GetList($("#txtcname").val(), function (red) {
                autocominit(red.value, $("#txtcname"));
            });
        }
    });
}

//自动完成---下拉框
function autocominit(data, dominput) {
    var currentTxt = $("#txtcname").val();
    //创建下拉结果div
    var $resultDiv = $("#resultDiv");
    //创建下拉结果ul
    var $resultUl = $("#resultUl");
    //创建下拉结果
    var $resultLi = [];
    $("#resultDiv").show();
    $resultUl.html("");
    //加载ajax返回的结果集
    for (var i = 0; i < data.length; i++) {
        $resultLi[i] = $("<li></li>");
        $resultLi[i].html(data[i]);
        $resultUl.append($resultLi[i]);
    }
    //隐藏下框
    if ($resultUl.html() == "") {
        $("#resultDiv").hide();
    }
    //获得文本位置
    var input = $(dominput);
    var offset = input.offset();
    var left = offset.left;
    var top = offset.top + input.height() + 4;
    var width = input.width();
    //设置下拉框的位置--文本框下侧
    $resultDiv.css("top", top);
    $resultDiv.css("left", left);
    $resultDiv.css("width", width);
    //下拉框框失去焦点时隐藏下拉框
    $("#resultDiv").blur(function () {
        $("#resultDiv").hide();
    });
    //文本框失去焦点时隐藏下拉框
    input.blur(function () {
        setTimeout(function () { $("#resultDiv").hide(); }, 300);
    });
    //设置li的事件和属性
    $("#resultUl li").click(function () {
        input.val($(this).text());
    });
    //键盘上下键控制  
    var index = -1;    //标记上下键时所处位置  
    document.documentElement.onkeydown = function (e) {
        e = window.event || e;
        if (e.keyCode == 40) {  //下键操作  
            if (++index == $("#resultDiv li").length) {  //判断加一操作后index值是否超出列表数目界限  
                index = -1;             //超出的话就将index值变为初始值  
                input.val(currentTxt);    //并将文本框中值设为用户用于搜索的值  
                $("#resultDiv li").css("background-color", "#FFFFFF");
            }
            else {
                input.val($($("#resultDiv li")[index]).text());
                $($("#resultDiv li")[index]).siblings().css("background-color", "#FFFFFF").end().css("background-color", "#999");
            }
        }
        if (e.keyCode == 38) {  //上键操作  
            if (--index == -1) {    //判断自减一后是否已移到文本框  
                input.val(currentTxt);
                $("#resultDiv li").css("background-color", "#FFFFFF");
            }
            else if (index == -2) {     //判断index值是否超出列表数目界限  
                index = $("#resultDiv li").length - 1;
                input.val($($("#resultDiv li")[index]).text());
                $($("#resultDiv li")[index]).siblings().css("background-color", "#FFFFFF").end().css("background-color", "#999");
            }
            else {
                input.val($($("#resultDiv li")[index]).text());
                $($("#resultDiv li")[index]).siblings().css("background-color", "#FFFFFF").end().css("background-color", "#999");
            }
        }
        if (event.keyCode == 13) {//按下enter建去当前选中的值
            $("#resultDiv").hide();
        }
    };
}


//自动完成---下拉框
function autocominitscata(data, dominput) {
    var currentTxt = $("#txtcname").val();
    //创建下拉结果div
    var $resultDiv = $("#resultDiv");
    //创建下拉结果ul
    var $resultUl = $("#resultUl");
    //创建下拉结果
    var $resultLi = [];
    $("#resultDiv").show();
    $resultUl.html("");
    //加载ajax返回的结果集
    for (var i = 0; i < data.length; i++) {
        $resultLi[i] = $("<li></li>");
        $resultLi[i].html(data[i]);
        $resultUl.append($resultLi[i]);
    }
    //隐藏下框
    if ($resultUl.html() == "") {
        $("#resultDiv").hide();
    }
    //获得文本位置
    var input = $(dominput);
    var offset = input.offset();
    var left = offset.left;
    var top = offset.top + input.height() + 4;
    var width = input.width();
    //设置下拉框的位置--文本框下侧
    $resultDiv.css("top", top);
    $resultDiv.css("left", left);
    $resultDiv.css("width", width);
    //下拉框框失去焦点时隐藏下拉框
    $("#resultDiv").blur(function () {
        $("#resultDiv").hide();
    });
    //文本框失去焦点时隐藏下拉框
    input.blur(function () {
        setTimeout(function () { $("#resultDiv").hide(); }, 300);
    });
    //设置li的事件和属性
    $("#resultUl li").click(function () {
        input.val($(this).text()); getfatalog();
    });
    //键盘上下键控制  
    var index = -1;    //标记上下键时所处位置
    document.documentElement.onkeydown = function (e) {
        e = window.event || e;
        if (e.keyCode == 40) {  //下键操作  
            if (++index == $("#resultDiv li").length) {  //判断加一操作后index值是否超出列表数目界限  
                index = -1;             //超出的话就将index值变为初始值  
                input.val(currentTxt);    //并将文本框中值设为用户用于搜索的值  
               
                $("#resultDiv li").css("background-color", "#FFFFFF");
            }
            else {
                input.val($($("#resultDiv li")[index]).text()); getfatalog();
                $($("#resultDiv li")[index]).siblings().css("background-color", "#FFFFFF").end().css("background-color", "#999");
            }
        }
        if (e.keyCode == 38) {  //上键操作  
            if (--index == -1) {    //判断自减一后是否已移到文本框  
                input.val(currentTxt);
                $("#resultDiv li").css("background-color", "#FFFFFF");
            }
            else if (index == -2) {     //判断index值是否超出列表数目界限  
                index = $("#resultDiv li").length - 1;
                input.val($($("#resultDiv li")[index]).text()); getfatalog();
                $($("#resultDiv li")[index]).siblings().css("background-color", "#FFFFFF").end().css("background-color", "#999");
            }
            else {
                input.val($($("#resultDiv li")[index]).text());
                $($("#resultDiv li")[index]).siblings().css("background-color", "#FFFFFF").end().css("background-color", "#999");
            }
        }
        if (event.keyCode == 13) {//按下enter建去当前选中的值
            $("#resultDiv").hide();
        }
    };
}

