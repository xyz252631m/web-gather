//require 定义模块方式
define(['page/temp/app'], function (app) {
    var list = [1, 2, 3, 4, 5, 6];
    //listCtrl controller 
    app.controller("listCtrl", function ($scope) {
        $scope.list = list;
        $scope.add = function () {
            list.push(Math.round(Math.random()*100));
        }
    });
})