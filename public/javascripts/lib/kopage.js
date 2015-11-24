//分页ko model
(function () {
    var pages = {
        //总条数 , 获取数据的函数
        getmodel: function (count, fun, psizes, sizeList) {
            var psize = psizes || 15;  //init pageSize
            var self = this;
            self.pageShow = ko.observable(true);
            self.pageSizeList = sizeList || [5, 10, 15, 20, 25, 30];
            self.pageSize = ko.observable(psize);  //init pageSize
            self.pageIndex = ko.observable(1);  //init pageIndex
            self.listCount = ko.observable(count);
            self.listCount.subscribe(function () {
                !self.listCount() && (self.pageShow(false));
            });
            !self.listCount() && (self.pageShow(false));
            self.pageCount = ko.computed(function () {
                return Math.ceil(this.listCount() / this.pageSize());
            }, this);
            self.getclass = function (index) {
                return (self.pageIndex()) == index ? 'active' : '';
            }
            self.upbtn = ko.observable(false);
            self.uppage = function () {
                var tem = self.pageIndex();
                if (tem <= 1) {
                    return;
                }
                self.pageIndex(tem - 1);
                fun();
            }
            self.downbtn = ko.observable(true);
            self.downpage = function () {
                var tem = self.pageIndex();
                var cpage = self.pageCount();
                if (tem >= cpage) {
                    return;
                }
                self.pageIndex(tem + 1);
                fun();
            }
            self.pageclick = function () {
                var m = Number(this);
                self.pageIndex(m);
                fun();
            }
            //页码数列表
            var getpagelist = function () {
                var select = self.pageIndex();
                var pageindex = self.pageIndex();
                if (pageindex > 1) {
                    self.upbtn(true);
                }
                var list = fa.tool.getPageNumber(pageindex, self.pageCount(), 5);
                return { list: list, select: select };
            }
            self.getlist = ko.observable(getpagelist());
            self.pageIndex.subscribe(function () {
                self.getlist(getpagelist());
            });
            self.pageSize.subscribe(function () {
                self.getlist(getpagelist());
            });
            self.pageCount.subscribe(function () {
                self.getlist(getpagelist());
            });
            //pageSize 修改事件
            self.changSize = function () {
                self.pageIndex(1);
                fun();
            }
        }
    }
    this.pages = pages;
}
)();