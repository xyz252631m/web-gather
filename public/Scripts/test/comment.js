//li img --click
function imglistclick(img) {
    var imgdiv = $(img).parent().parent().next("div");
    $(img).parent().parent().find("li").removeClass("active");
    $(img).parent().addClass("active");
    if ($(imgdiv).is(":hidden")) {
        $(imgdiv).find("img").attr("src", $(img).attr("src").replace("280210","original"));
        $(imgdiv).find("img").attr("data-index", $(img).attr("data-index"));
        $(imgdiv).show();
    } else {
        if ($(imgdiv).find("img").attr("data-index") == $(img).attr("data-index")) {
            $(imgdiv).hide();
            $(img).parent().parent().find("li").removeClass("active");
        } else {
            $(imgdiv).find("img").attr("src", $(img).attr("src").replace("280210", "original"));
            $(imgdiv).find("img").attr("data-index", $(img).attr("data-index"));
        }
    }
};
//up img---click
function upimg(upspan) {
    var ming = $(upspan).parent().find("img");
    var mindex = $(ming).attr("data-index")
    var listimg = $(upspan).parent().parent().find(".ct-pics img");
    mindex == 0 && (mindex = listimg.length);
    var targetImg = listimg.eq(--mindex);
    setImg(upspan, targetImg, mindex);
};
//next img--click
function nextimg(upspan) {
    var ming = $(upspan).parent().find("img");
    var mindex = $(ming).attr("data-index")
    var listimg = $(upspan).parent().parent().find(".ct-pics img");
    mindex == listimg.length-1 && (mindex =-1);
    var targetImg = listimg.eq(++mindex);
    setImg(upspan, targetImg, mindex);
};
//tool -- set img index and src
function setImg(upspan, targetImg, mindex) {
    $(upspan).parent().find("img").attr("src", targetImg.attr("src").replace("280210", "original"));
    $(upspan).parent().find("img").attr("data-index", targetImg.attr("data-index"));
    $(upspan).parent().parent().find(".ct-pics li").removeClass("active");
    $(upspan).parent().parent().find(".ct-pics li").eq(mindex).addClass("active");
}