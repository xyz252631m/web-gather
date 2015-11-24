(function ($) {
    $.dialogBox = function () {
        var width = $(window).innerWidth();
        var height = $(window).innerHeight();
        return {
            show: function () {
                alert("当前内容宽度为："+width+",高度为："+height);
            }
        };
    };
})(jQuery);