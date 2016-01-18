

(function(angular){
    // �����defaults
    var defaults = {
        title: "��ʾ",
        url: "",
        width: 350,
        height: 160,
        isMove: false,
        isborder: true,
        borwidth: 4,
        iframeWidth: "100%",
        ifremeHeight: '160px',
        showShadeLayer: true,
        noBtn: false,
        init: function () { },
        content: "", //ֱ����ʾ������
        tiptype: "success",   //success error none
        closetxt: '�ر�',
        close: function () { },    //���Ͻ� and  �رհ�ť�Ļص�����
        submittxt: 'ȷ��',
        submit: function () { } //ȷ�ϵĻص�����
    };
    var opts, index = 1;
    var mx, my, ex, ey, IsDown = false;
    a.alertBox = function () { };
    var tool = {
        //����
        getTitle: function (opts) {
            var arrHtml = [];
            var id = ++index;
            arrHtml.push(opts.showShadeLayer ? "<div id='shade" + id + "' class='alertbox-shade' style='z-index:"+(10000+id)+"'></div>" : "");
            arrHtml.push("<div id='box" + id + "' class='alertbox'  style='width:" + opts.width + "px;height:" + opts.height + "px;z-index:"+(10001+id)+"'>");
            if (opts.isborder) {
                arrHtml.push('<div class="box-bor" style="width:' + (opts.width + opts.borwidth * 2 + 2) + 'px;height:' + (opts.height + opts.borwidth * 2 + 2) + 'px;"></div>');
            }
            arrHtml.push('<div class="box-con"  style="width:' + opts.width + 'px;height:' + opts.height + 'px; top:' + opts.borwidth + 'px;left:' + opts.borwidth + 'px">');
            arrHtml.push("<h3 ><span class='alertbox-close'><a class='close' data-value='"+id+"'>x</a></span>");
            arrHtml.push(opts.title);
            arrHtml.push("</h3>");
            return arrHtml;
        },
        //��ť
        getBtn: function (opts) {
            if (!opts.noBtn) {
                if (opts.tiptype == "error" || opts.tiptype == "success" || opts.tiptype == "info") {
                    return "<div class='alert-info'><input type='button' class='box-btn-close' value='" + opts.closetxt + "' data-value='"+index+"'/></div>";
                } else {
                    return "<div class='alert-btn'><input type='button' class='box-btn-close' value='" + opts.closetxt + "' data-value='"+index+"'/><input class='box-btn-submit' type='button' value='" + opts.submittxt + "'  data-value='"+index+"'/></div>"
                }
            }
        },
        //sueescc error info
        cuscontent: function (options, img) {
            opts = $.extend({}, defaults, options);
            var arrHtml = this.getTitle(opts);
            arrHtml.push('<div class="alert-main">');
            arrHtml.push(img);
            arrHtml.push("<span style='width: " + (opts.width - (img ? 100 : 20)) + "px;display: inline-block;'>");
            arrHtml.push(opts.content);
            arrHtml.push('</span>');
            arrHtml.push('</div>');
            arrHtml.push(this.getBtn(opts));
            arrHtml.push("</div></div>");
            this.addBody(arrHtml.join(""));
            opts.init.call(a.alertBox,index);
        },
        //��ӵ�body
        addBody: function (html) {
            $("body").append(html);
            if (opts.isMove) {
                $("#box" + index).find(".box-con>h3").css("cursor", "move");
                $("#box" + index).find(".box-con>h3").bind("mousedown", mouseDown.bind([], index));
            }
            if (opts.isMove) {
                $(window).unbind("resize").unbind("scroll");
            } else {
                $(window).resize(function () {
                    tool.init_resize();
                });
                $(window).scroll(function () {
                    tool.init_resize();
                });
            }
            $("#box" + index).find(".close").on("click", function(){
                var td = $(this).attr("data-value");
                close(td);
            });
            $("#box" + index).find(".box-btn-close").on("click", function(){
                var td =$(this).attr("data-value");
                close(td);

            });
            $("#box" + index).find(".box-btn-submit").on("click", function(){
                var td = $(this).attr("data-value");
                submit(td);

            });
            this.init_resize();
        },
        //�״μ���--����λ��(����)
        init_resize: function () {
            var lwidow = $("#box" + index);
            var width = $(window).innerWidth();
            var height = $(window).innerHeight();
            var y = $(this).scrollTop();
            lwidow.css({
                left: ((width - lwidow.outerWidth() - 10) / 2) + "px", top: ((height - lwidow.outerHeight() - 10) / 2) + "px"
            });
        }
    };
    //ȷ�Ϸ���
    function submit(id) {
        opts.submit.call(a.alertBox,id);
    }
    //�رշ���
    function close(id){
        opts.close.call(a.alertBox);
        a.alertBox.hide(id);
    }
    //ifram
    a.alertBox.iframe = function (options) {
        opts = $.extend({}, defaults, options);
        var arrHtml = tool.getTitle(opts);
        arrHtml.push('<div class="alert-main"><iframe FRAMEBORDER="0" style="width:' + options.iframeWidth + ';height:' + options.ifremeHeight + ';" src="');
        arrHtml.push(options.url + '"></iframe></div>');
        arrHtml.push(tool.getBtn(opts));
        arrHtml.push("</div>");
        tool.addBody(arrHtml.join(""));
    };
    //custom
    a.alertBox.custom = function (options) {
        options.tiptype = "custom";
        tool.cuscontent(options, "");
    }
    //info  �ش�  content ����
    a.alertBox.info = function (options) {
        var img = "<img src='resources/images/alertBox/info.png' width='70' height='70'/>";
        options.tiptype = "info";
        tool.cuscontent(options, img);
    };
    //error �ش�  content����
    a.alertBox.error = function (options) {
        var img = "<img src='resources/images/alertBox/error.png' width='70' height='70'/>";
        options.tiptype = "error";
        tool.cuscontent(options, img);
    };
    //success �ش�  content����
    a.alertBox.success = function (options) {
        var img = "<img src='resources/images/alertBox/success.png' width='70' height='70'/>";
        options.tiptype = "success";
        tool.cuscontent(options, img);
    };
    //confirm �ش�  content����
    a.alertBox.confirm = function (options) {
        var img = "<img src='resources/images/alertBox/confirm.png' width='70' height='70'/>";
        options.tiptype = "confirm";
        tool.cuscontent(options, img);
    };

    //���ֲ�����
    a.alertBox.hide = function (ids) {
        var id = ids || index;
        $("#box" + id).find(".close").unbind("click");
        $("#box" + id).find(".box-btn-close").unbind("click");
        $("#box" + id).find(".box-btn-submit").unbind("click");
        $("#box" + id).remove();
        $("#shade" + id).remove();
    }
    //����¼�
    function mouseDown(id, obj) {
        $("#box" + id).show();
        var et = obj || event;
        IsDown = true;
        $("body").bind("mousemove", move.bind([], id)).bind("mouseup", up);
        ex = et.clientX;
        ey = et.clientY;
        var lwidow = $("#box" + id);
        mx = lwidow.offset().left;
        my = lwidow.offset().top - $(window).scrollTop();
    }
    //�ƶ��¼�
    function move(id, obj) {
        var et = obj || event;
        var lwidow = $("#box" + id);
        var lwidth = lwidow.outerWidth();
        var lheight = lwidow.outerHeight();
        if (IsDown) {
            var movex = mx + et.clientX - ex;
            var movey = my + et.clientY - ey;
            //�趨width�߽�
            if (($(window).innerWidth() - mx - lwidth) < (et.clientX - ex)) {
                movex = $(window).innerWidth() - lwidth;
            }
            movex = movex < 0 ? 0 : movex;
            //�趨height�߽�
            if (($(window).innerHeight() - my - lheight) < (et.clientY - ey)) {
                movey = $(window).innerHeight() - lheight;
            }
            movey = movey < 0 ? 0 : movey;
            $(lwidow).css({
                "left": movex, "top": movey
            });
        }
    };
    //�Ƴ��ƶ��¼�
    function up() {
        IsDown = false;
        $("body").unbind("mousemove").unbind("mouseup");
    };
    window.alertBox = a.alertBox;



    angular.module('flowerDialog', [])



        .directive("showDialog",["$scope",function(scope){


        }])

        .factory("dialog",["$scope",function(scope){
            return {
                success:function(msg){


                }

            }
        }]);



})(window.angular);
