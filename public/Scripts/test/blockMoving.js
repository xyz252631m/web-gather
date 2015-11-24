(function ($) {
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
        var len = node.children().length, width = node.children().eq(0).width();
        var selectIndex = 0, dindex = -1, temindex = -1; //选中索引 //下次选中索引 //临时选中索引
        var speed = opt.speed;
        var tool = {
            getNumber: function () {
                var flag = 1;
                switch (opt.type) {
                    case 'left':
                        flag = 1;
                        break;
                    case 'right':
                        flag = -1;
                        break;
                }
                return flag;
            },
            init: function () {
                node.css("width", width * len * 2);
                node.append(node.children().clone());
            }
        };
        tool.init();
        //滑动
        var animate = function () {
            var index = selectIndex;
            //动画未完成时重复点击
            if (index == temindex) {
                return;
            }
            var downindex = ~dindex?dindex:selectIndex + 1;
            var dist = width * opt.count * downindex * tool.getNumber();
            temindex = index;
            node.animate({
                left: -dist
            }, {
                queue: true, duration: 500, complete: function () {
                    selectIndex = downindex;
                    if (downindex == len / opt.count) {
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
                    selectIndex = len / opt.count;
                    node.css("left", -len * width);
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