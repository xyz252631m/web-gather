(function ($) {
    // 按钮左右移动方法
    $.fn.btnmove = function (options) {
        var defaults = {
            node: "",  //初始节点
            twonode: "",//边界节点  (第一节点与第二节点不可重复)
            parentNode: "",  //父级节点---得到移动的范围
            moveFuntion: function () { },
            moveUp: function () { }
        };
        var options = $.extend(defaults, options);
        var mx, ex, off_left, IsDown = false;
        var pw = $(options.parentNode).width();
        var mw = $(options.node).outerWidth();
        var flag = $(options.node).offset().left < $(options.twonode).offset().left ? true : false;
        var move = function (et) {
            if (IsDown) {
                var cx = et.clientX;
                var movex = mx + cx - ex;
                movex < 0 && (movex = 0);
                movex > (pw - mw) && (movex = pw - mw);
                if (flag) {
                    ((off_left + cx - ex + mw) > $(options.twonode).offset().left) && (movex = $(options.twonode).offset().left - $(options.parentNode).offset().left - mw);
                } else {
                    ((off_left + cx - ex - mw) < $(options.twonode).offset().left) && (movex = ($(options.twonode).offset().left - $(options.parentNode).offset().left + mw));
                }
                $(options.node).css("left", movex);
                options.moveFuntion(movex);
            }
        };
        var up = function () {
            IsDown = false;
            $("body").unbind("mousemove").unbind("mouseup");
            options.moveUp();
        };
        $(options.node).mousedown(function (et) {
            IsDown = true;
            $("body").bind("mousemove", move).bind("mouseup", up);
            ex = et.clientX;
            off_left = $(options.node).offset().left;
            mx = Math.abs($(options.parentNode).offset().left - $(options.node).offset().left);
        });

    }
    $.btnmove = $.fn.btnmove;
})(jQuery);