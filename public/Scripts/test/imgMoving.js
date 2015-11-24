(function ($) {
    //图片滑动插件
    $.fn.imgMove = function (options) {
        var defaults = {
            speed: 2000,   //动画间隔
           // time:500,  //动画时间
            type: 'left'  //left,right,fade
        };
        var pnode = $(this);
        var opt = $.extend({}, defaults, options);
        var node = pnode.find(".img-list"), menu = pnode.find("ul");
        var list = node.children();
        var len = list.length, width = list.eq(0).width();
        var selectIndex = 0, dindex = -1, temindex = -1; //选中索引 //下次选中索引 //临时选中索引
        var speed = opt.speed, num = 0;//循环次数;
        list.eq(0).css("z-index", list.length);
        opt.type == "fade"&&menu.css("right", list.find("img").eq(0).offset().left+20);
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
            }
        };
        //滑动
        var animate = function () {
            var index = selectIndex;
            //动画未完成时重复点击
            if (index == temindex) {
                return;
            }
            var downindex = ~dindex?dindex:(selectIndex + 1) == len? 0 : selectIndex + 1;//是否点击执行事件
            //是否重复点击
            if (index == downindex) {
                dindex = -1;
                return;
            }
            num++;
            var dist = width * num * tool.getNumber();
            temindex = index;
            opt.type == "fade"? (list.eq(downindex).css({ 'opacity': 1, 'z-index': 1 }),
            list.eq(index).animate({
                opacity: 0
            }, {
                queue: true, duration: 500, complete: function () {
                    list.eq(downindex).css("z-index", len);
                    selectIndex = downindex;
                }
            })):(
            list.eq(downindex).css("left", dist), node.animate({
                left: -dist
            }, {
                queue: true, duration: 500, complete: function () {
                    selectIndex = downindex;
                    //当循环次数大于100时重置
                    if (num > 100) {
                        list.eq(downindex).css("left", 0);
                        list.css("z-index", 0);
                        list.eq(downindex).css("z-index", len);
                        node.css("left", 0);
                        num = 0;
                    }
                }
            }));
            menu.find("a").removeClass("active");
            menu.find("a").eq(downindex).addClass("active");
            dindex = -1;
        };
        var t = setInterval(animate, speed);
        menu.find("a").click(function () {
            clearInterval(t);
            var index = menu.find("a").index(this);
            dindex = index;
            animate();
            t = setInterval(animate, speed);
        });
    }
})(jQuery);