var isExitJson = (typeof (JSON) !== 'undefined');
require.config({
    baseUrl: '/Scripts/',
    paths: {
        jquery: ['http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min', 'jquery-1.7.1.min'],
        knockout: 'knockout-3.3.0',
        citylist: 'lib/tool-city',
        json2: 'lib/json2',
        alertBox: 'lib/alertBox.min',
        domReady: 'base/domReady',
        date: 'lib/My97DatePicker/WdatePicker',
        absoluteShow: 'lib/absoluteShow',
        kopages: 'lib/kopages.min',
        btnmove: 'lib/btnmove'
    },
    shim: {
        'alertBox': {
            deps: ['jquery'],
            exports: '$.alertBox'
        },
        'knockout': {
            //deps: ['jquery', isExitJson || 'json2']
          deps: [isExitJson || 'json2']
        },
        'absoluteShow': {
            deps: ['jquery']
        },
        'citylist': {}
    }
});
var fa = {
    tool: {
        //获取分页数字
        getPageNumber: function (pageindex, pageCount, num) {
            var list = [];
            var txtnumber = num || 5, minpageindex = 1, maxpageindex = 1//数字数量
            var numberflag = Math.floor(txtnumber / 2);
            //判断起止数字，然后循环
            if (pageindex - numberflag <= 1) {
                minpageindex = 1;
                if (txtnumber > pageCount)
                    maxpageindex = pageCount;
                else {
                    maxpageindex = txtnumber;
                }
            } else {
                minpageindex = pageindex - numberflag;
                if (pageindex + numberflag >= pageCount) {
                    minpageindex = pageCount - txtnumber + 1;
                    maxpageindex = pageCount;
                } else {
                    maxpageindex = pageindex + numberflag;
                }
            }
            if (minpageindex <= 0) minpageindex = 1;
            for (var i = minpageindex; i <= maxpageindex; i++) {
                list.push(i);
            }
            return list;
        },
        //时间戳转为 hh:mm
        getDateStr: function (m) {
            m = m.replace("/Date(", "").replace(")/", "");
            return (new Date(parseInt(m))).Format("HH:mm");
        },
        //时间戳转为日期
        ToDataStr: function (m, f) {
            var format = f || 'yyyy-MM-dd HH:mm';
            m = m.replace("/Date(", "").replace(")/", "");
            return (new Date(parseInt(m))).Format(format);
        },
        //全选 th:当前节点  node  input 的父节点
        AllSelect: function (th, node) {
            $(node).find("input[type=checkbox]").prop("checked", $(th).attr("checked") || false);
        },
        //获取选中值的数组
        GetArry: function (node) {
            var select_length = $(node).find("input[type=checkbox]:checked").length;
            var idArry = new Array();
            for (var mlength = 0; mlength < select_length; mlength++) {
                idstr.push($(node).find("input[type=checkbox]:checked")[mlength].value);
            }
            return idArry;
        }
    },
    ticket: {
        //获取单程 or 往返
        getTypeName: function (str) {
            switch (str) {
                case 'RoundTrip':
                    return '往返';
                case 'OneWay':
                    return "单程";
                default:
                    return "";
            }
        }
    },
    hotel: {}
};
Date.Parse = function (date) {
    return eval('new ' + date.replace('/', '', 'g').replace('/', '', 'g'));
}
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份          
        "d+": this.getDate(), //日          
        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时          
        "H+": this.getHours(), //小时          
        "m+": this.getMinutes(), //分          
        "s+": this.getSeconds(), //秒          
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度          
        "S": this.getMilliseconds() //毫秒          
    };
    var week = {
        "0": "\u65e5",
        "1": "\u4e00",
        "2": "\u4e8c",
        "3": "\u4e09",
        "4": "\u56db",
        "5": "\u4e94",
        "6": "\u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}
Date.Parseformat = function (date, format) {
    date = date.replace("/Date(", "").replace(")/", "");
    return (new Date(parseInt(date))).Format(format);
}