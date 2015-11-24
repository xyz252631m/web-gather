//module.exports = function (app) {
//    app.get('/', function (req, res) {
//        var conObj = require("../tool/connetion");
//        var where = "";
//        var sqlstr = "select top 100 * from SystemLog " + where + " order by id desc";
//        var queryObj = conObj.connetion();
//        queryObj.query(sqlstr, function (results) {
//            //  success callback 
       
//            res.render('list', { title: '测试', list: results });
//        }, function (err, sql) {
//            //  failed callback 
//            if (err)
//                console.log(err);
//            console.log(sql);
//        });
//        //  getTabel(req, res);
//    });
//    //test---get lognet4  ex list
//    var getTabel = function (req, res) {
//        var http = require("http");
//        var url = require("url");
//        var params = url.parse(req.url, true).query;
//        var node_mssql = require('node-mssql');
//        var queryObj = new node_mssql.Query({
//            host: '10.20.22.50',
//            port: 1433,
//            username: 'sa',
//            password: 'ZAQ!2wsx',
//            db: 'TravelDB'
//        });
//        var where = "";
//        if (params && params.level) {
//            where += " where level = '" + params.level + "'";
//        }
//        var sqlstr = "select top 100 * from SystemLog " + where + " order by id desc";
//        queryObj.query(sqlstr, function (results) {
//            //  success callback 
//            res.render('list', { title: '测试', list: results });
//        }, function (err, sql) {
//            //  failed callback 
//            if (err)
//                console.log(err);
//            console.log(sql);
//        });
//    }
//    app.post('/getlist', function (req, res) {
//        var http = require("http");
//        var url = require("url");
//        var params = url.parse(req.url, true).query;
//        var node_mssql = require('node-mssql');
//        var queryObj = new node_mssql.Query({
//            host: '10.20.22.50',
//            port: 1433,
//            username: 'sa',
//            password: 'ZAQ!2wsx',
//            db: 'TravelDB'
//        });
//        var where = "";
//        if (params && params.level) {
//            where += " where level = '" + params.level + "'";
//        }
//        var sqlstr = "select top 100 * from SystemLog " + where + " order by id desc";
//        queryObj.query(sqlstr, function (results) {
//            //  success callback 
//            res.json({ list: results });
//        }, function (err, sql) {
//            //  failed callback 
//            if (err)
//                console.log(err);
//            console.log(sql);
//        });
//        // var sql = node_mssql.mssql;
//        //var connection = new sql.Connection({
//        //    host: '10.20.22.50', 
//        //    port: 1433,
//        //    username: 'sa',
//        //    password: 'ZAQ!2wsx',
//        //    db: 'TravelDB'
//        //});
//        //connection.connect(function (err) {
//        //    console.log(err);
//        //});
//        //var sql = node_mssql.mssql;
//        //sql.connect({
//        //    server: '10.20.22.50',
//        //    user: 'sa',
//        //    password: 'ZAQ!2wsx'
//        //}, function (err) {
//        //    var request = new sql.Request();
//        //    var sqlstr = "select top 100 * from SystemLog";
//        //    request.query(sqlstr, function (results) {
//        //        res.render('list', { title: '测试', list: results });
//        //        console.log(results.message);
//        //    })
//        //});


//        //var tem = sql.connect({
//        //    server: '10.20.22.50',
//        //    user: 'sa',
//        //    password: 'ZAQ!2wsx',
//        //    db: 'TravelDB'
//        //}, function (err) {
//        //    console.log(err);
//        //});


//        //var request = tem.request();
//        //tem.connected = true;
//        //var sqlstr = "select top 100 * from TravelDB.dbo.SystemLog";
//        //request.query(sqlstr, function (results) { 
//        //    res.render('list', { title: '测试', list: results });
//        //    console.log(results.message);
//        //})


//        //queryObj.query(sqlstr,function (results) {
//        //    //  success callback 
//        //    res.render('list', { title: '测试',list: results });
//        //    console.log(results);
//        //}, function (err, sql) {
//        //    //  failed callback 
//        //    if (err)
//        //        console.log(err);

//        //    console.log(sql);
//        //});



//    });
//    app.get('/reg', function (req, res) {
//        res.render('lesshelper', {
//            title: '用戶註冊',
//        });
//    });
//};

exports.index = function (req, res) {
    res.render('index', { title: 'Index' });
};
exports.login = function (req, res) {
    res.render('admin/login', { title: '用户登陆' });
};
exports.doLogin = function (req, res) {
    var user = {
        username: 'admin',
        password: 'admin'
    }
    if (req.body.username === user.username && req.body.password === user.password) {
        res.redirect('/home');
    }
    res.redirect('/login');
};
exports.logout = function (req, res) {
    res.redirect('/');
};
exports.home = function (req, res) {
    var user = {
        username: 'admin',
        password: 'admin'
    }
    res.render('home', { title: 'Home', user: user });
};
