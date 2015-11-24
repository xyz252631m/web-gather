//预定义变量
var vari;
var links;
//用DOM方法获得所有的link元素  
links = document.getElementsByTagName("link");
for (i = 0; links[i]; i++) {
    //即此link元素是否为样式表link  
    if (links[i].getAttribute("rel").indexOf("style") != -1 && links[i].getAttribute("title")) {
        var theme = getCookie('theme');
        if (theme != null) {

            if (theme == "red") {//red
                links[i].href = links[i].href.replace("green", theme);
                links[i].href = links[i].href.replace("blue", theme);
            } else if (theme == "green") {//green
                links[i].href = links[i].href.replace("red", theme);
                links[i].href = links[i].href.replace("blue", theme);
            } else { //blue
                links[i].href = links[i].href.replace("green", theme);
                links[i].href = links[i].href.replace("red", theme);
            }
        }
    }
}
//写cookies
function setCookie(name, value) {
    
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
//读取cookies 
function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}