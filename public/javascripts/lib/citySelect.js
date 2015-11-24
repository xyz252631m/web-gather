(function ($, widow) {
    var _citys = {};
    jQuery.fn.citySelect = function (_options) {
        var defaults = {
            titleList: []
        };
    //    var _oSelf = this,
    //    $this = $(this);
      //  this.options = $.extend(defaults, _options);
        function indexViewModel() {
            var self = this;
            this.IsInit = false;
            this.InIt = function (tlist, clist) {
                self.titlelist(tlist);
                self.citylist(clist);
                self.isShow("block");
                this.IsInit = true;
            }
            //var tlist = ["国内热门", "ABCDEF", "GHJK", "LMNPQ", "RSTW", "XYZ"];
            //var clist = [[[1, "X", "西安"], [2, "A", "咸阳"], [1, "X", "西安2"], [1, "B", "西安2"]], [[1, "X", "西安2"], [2, "B", "咸阳2"]]];
            self.isShow = ko.observable("none");
            self.titleIndex = ko.observable(0);
            self.citylist = ko.observableArray();
            self.titlelist = ko.observableArray();
            self.getCitys = function () {
                var nm = [];
                var tem = function () {
                    return {
                        title: "",  //A  B  C
                        list: []
                    }
                };
                if (self.citylist().length == 0) {
                    return;
                }
                var item = self.citylist()[self.titleIndex()];
                if (!self.titleIndex()) {
                    var t = new tem();
                    ko.utils.arrayForEach(item, function (a) {
                        var Id = a[0], cityName = a[2];
                        var model = new Array();
                        model[0] = Id;
                        model[1] = cityName;
                        t.list.push(model);
                    });
                    nm.push(t);
                    return nm;
                }
                var temTitle = [];
                ko.utils.arrayForEach(item, function (a) {
                    var Id = a[0], charName = a[1], cityName = a[2];
                    var index = ko.utils.arrayIndexOf(temTitle, charName);  //当前索引
                    if (index == -1) {
                        var t = new tem();
                        temTitle.push(charName);
                        t.title = charName;
                        var model = new Array();
                        model[0] = Id;
                        model[1] = cityName;
                        t.list.push(model);
                        nm.push(t);
                    } else {
                        var model = new Array();
                        model[0] = Id;
                        model[1] = cityName;
                        nm[index].list.push(model);
                    }
                });
                nm.sort(function (a, b) { return a.title.charCodeAt(0) - b.title.charCodeAt(0) });
                return nm;
            };
            self.cityClick = function () {
                var m = this;
                var id = $(".tip-citys").attr("data-id");
                if (id == "hover") {
                    var exitCity = $("#js-salecity").find("a");
                    if ($("#js-salecity").find("a[data-value=" + m[0] + "]").length > 0) {
                        $("#js-salecity").find("a").removeClass("active");
                        $("#js-salecity").find("a[data-value=" + m[0] + "]").addClass("active");
                    } else {
                        var a_city = $("#js-salecity").find("a").last();
                        a_city.html(m[1]);
                        a_city.attr("data-value", m[0]);
                        $("#js-salecity").find("a").removeClass("active");
                        a_city.addClass("active");
                    }
                    getSaleTicket(m[1]);
                } else {
                    $("#" + id).attr("data-value", m[0]);
                    $("#" + id).val(m[1]);
                }
                self.isShow("none");
                self.titleIndex(0);
            };
            self.getMenuClass = function (i) {
                return self.titleIndex() == i ? "active" : "";
            };
            self.tabClick = function (i) {
                self.titleIndex(i);
            };
            self.closeCity = function () {
                self.isShow("none");
                self.titleIndex(0);
            };
        }
        var indexm = new indexViewModel();
        ko.applyBindings(indexm, $(".tip-citys")[0]);
    }
});


