(function ($) {
    var allTool = {
        getCss: function (node, str) {
            var numStr = node.css(str).replace("px");
            return parseInt(numStr) || 0;
        }
    };
    //图片滑动插件
    $.fn.blockMoving = function (options) {
        var defaults = {
            speed: 2000,   //动画间隔
            // time:500,  //动画时间
            count: 2,
            leftBtn: '',  //左侧按钮 ( element)
            rightBtn: ''  //右侧按钮 ( element)
        };
        var pnode = $(this);
        var opt = $.extend({}, defaults, options);
        var node = pnode.find(".block-list").eq(0);
        var list = node.children();
        var singleNode = list.eq(0).children().eq(0);
        var len = list.eq(0).children().length, width = singleNode.width() + allTool.getCss(singleNode, "marginLeft");
        var selectIndex = 0, dindex = -1, temindex = -1; //选中索引 //下次选中索引 //临时选中索引  3
        var speed = opt.speed;
        // 重置点
        var resetIndex = len % opt.count ? Math.floor(len / opt.count) + 1 : len / opt.count;
        var leftnum = 0;//偏移量
        var tool = {
            init: function () {
                node.css("width", resetIndex * width * opt.count * 2);
                list.css("width", opt.count * width * resetIndex + allTool.getCss(singleNode, "marginLeft"));
                node.append(node.children().clone());
            },
            rightDist: function (flag) {
                var tem = selectIndex + opt.count;
                if ((tem + flag) > len - 1) {
                    return tem + flag - len;
                } else {
                    return tem + flag;
                }
            }
        };
        tool.init();
        //滑动
        var animate = function () {
            var index = selectIndex;
            //动画未完成时重复点击
            if (len > opt.count) {
                if (index == temindex) {
                    return;
                }
            }
            var downindex = ~dindex ? dindex : selectIndex + 1;
            var dist = -downindex * width * opt.count;
            temindex = index;
            node.animate({
                left: dist
            }, {
                queue: true, duration: 500, complete: function () {
                    selectIndex = downindex;
                    if (downindex == resetIndex) {
                        node.css("left", 0);
                        selectIndex = 0;
                    }
                }
            });
            dindex = -1;
        };
        var t = setInterval(animate, speed);
        if (opt.leftBtn) {
            $(opt.leftBtn).click(function () {
                clearInterval(t);
                if (selectIndex == 0) {
                    selectIndex = resetIndex;
                    node.css("left", -opt.count * width * resetIndex);
                }
                dindex = selectIndex - 1;
                animate();
                t = setInterval(animate, speed);
            });
        }
        if (opt.rightBtn) {
            $(opt.rightBtn).click(function () {
                clearInterval(t);
                animate();
                t = setInterval(animate, speed);
            });
        }
    }
})(jQuery);