module.exports = function (app) {
    var isLogin = require('./tool/checkLogin');
    var tool = require('./tool/methoed.js');
    var conObj = require('./tool/connetion');
    //app.get('/', function (req, res) {
    //    res.render('lesshelper', { title: 'Express' });
    //});
    app.get('/', function (req, res) {
        res.render('test/ngAlert', { title: 'ngAlert' });
    });
    app.get('/webview', function (req, res) {
        res.render('test/webview-app', { title: 'gulp' });
    });
       app.get('/up', function (req, res) {
        res.render('test/up', { title: 'up' });
    });
    app.get('/require.html', function (req, res) {
        res.render('test/require', { title: 'require' });
    });
    app.get('/index.html', function (req, res) {
        res.render('test/index', { title: 'gulp' });
    });
    
    app.get('/imglist', function (req, res) {
        res.render('test/imglist', { title: 'gulp' });
    });
    
    app.get('/clist2', function (req, res) {
        res.render('test/contentlist2', { title: 'gulp' });
    });

    app.get('/clist', function (req, res) {
        res.render('test/contentlist', { title: 'gulp' });
    });
    app.get('/123', function (req, res) {
        conObj.mssql().request();
    });

    app.get('/login', function (req, res) {
        res.render('admin/login', { title: 'Express' ,errorInfo:''});
    });
    app.post('/login', function (req, res) {
  
        var queryObj = conObj.node_mssql();
        var sql = "select * from usersinfo where loginname='" + req.body.username + "' and loginpwd='" + tool.md5(req.body.password) + "'";
        queryObj.query(sql, function (results) {
            if (results.length>0) {
                req.session.user = results[0];
                res.redirect("/test");
            } else {
                res.render('admin/login', { title: 'Express', errorInfo:'用户名或密码错误！' });
            }
        }, function (err, sql) {
            if (err)
                console.log(err);
            console.log(sql);
        });
    });
    app.get('/test', isLogin.isLogin, function (req, res) {
        res.render('lesshelper', { title: 'Express' });
    });
}