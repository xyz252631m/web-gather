define([], function () {
    var tool = {
        edit: function (str) {
            var arry = [];
            if (str) {
                var len = str.length - 1;
                for (var i = len; i >= 0; i--) {
                    arry.push(str[i]);
                }
            }
            return arry.join("");
        }
    };
    return tool.edit;
});