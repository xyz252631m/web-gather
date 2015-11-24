$(document).ready(function () {
    //checkbox 事件
    $("#ulitem").find("input:checkbox").click(function () {
        //是否有下节点
        if ($(this).parent().find("label").has("img").length == 0) {
            //平级
            var chlength = $(this).parent().parent().find("input:checkbox").length;
            //判断是否全取消
            var flag = false;
            for (var i = 0; i < chlength; i++) {
                if ($(this).parent().parent().find("input:checkbox")[i].checked) {
                    flag = true;
                }
            }
            //父节点
            if (flag) {
                $(this).parent().parent().parent().prev().find("input:checkbox").attr("checked", true);
            } else {
                $(this).parent().parent().parent().prev().find("input:checkbox").attr("checked", false);
            }
        } else {
            $(this).parent().next("li").find("ul").eq(0).find("input:checkbox").attr("checked", this.checked);
        }
    });
});
//展开or隐藏
function imgclick(thimg) {
  //  alert($(thimg).parent().parent().next("li").find("ul").html());
    if ($(thimg).attr("src") == "../images/elbow-plus.gif")
        $(thimg).attr("src", "../images/elbow-minus.gif");
    else
        $(thimg).attr("src", "../images/elbow-plus.gif");
    $(thimg).parent().parent().next("li").find("ul").toggle();
}
function UpdateReturn(success) {
    if (success > 0) {
        top.$.jBox.tip('更新成功！', 'success', { timeout: 1000});

    } else {
        top.$.tip('更新失败！', 'error', { timeout: 1000});
    }
}