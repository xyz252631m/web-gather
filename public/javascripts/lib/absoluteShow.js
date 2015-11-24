(function ($) {
    // 弹出层工具方法
    $.fn.absoluteShow = function (options) {
        var defaults = {
            node: "",  //初始节点
            nodeclass: "",
            target: "",  //显示节点
            type: "show",  //show:show-hide    slide:slideDown-slideUp
            speed: 0  //动画时间  show 时无效
        };
        var options = $.extend(defaults, options);
        var t;
        var nodehide = function () {
            var showdiv = $(options.target);
            $(options.node).removeClass(options.nodeclass);
            options.type == "show" ? (showdiv && showdiv.hide()) : (showdiv && showdiv.slideUp(options.speed));
        }
        var nodeshow = function () {
            var showdiv = $(options.target);
            $(options.node).addClass(options.nodeclass);
            options.type == "show" ? (showdiv && showdiv.show()) : (showdiv && showdiv.slideDown(options.speed));
        }
        $(options.node).hover(function () {
            t && clearTimeout(t);
            var a = $(options.node);
            //nodehide();
            var showdiv = $(options.target);
            showdiv.css("left", a.offset().left);
            showdiv.css("top", a.offset().top + a.height());
            nodeshow();
        }, function () {
            t = setTimeout(nodehide, 300);
        });
        $(options.target).hover(function () {
            t && clearTimeout(t);
        }, function () {
            t = setTimeout(nodehide, 100);
        });
    }
    $.absoluteShow = $.fn.absoluteShow;

})(jQuery);