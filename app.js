
/**
 * Module dependencies.
 */

var express = require('express');
var http = require('http');
var path = require('path');
var ejs = require('ejs');
var app = express();
// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
//app.set('view engine', 'jade');
app.engine('html', ejs.__express);

app.set('view engine', 'html');
ejs.delimiter = '?';
//app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
//123
app.use(express.cookieParser('xiaocc_'));
//app.use(express.cookieSession({ secret: 'tobo!', cookie: { maxAge: 60*1000 } }));
app.use(express.session({ secret: 'tobo!', key: 'sid' , cookie: { maxAge: 20*60*1000 } }));
app.use(app.router);
app.use(require('stylus').middleware(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'content')));

////设置缺省响应
//app.get('/', function (req, res) {
//    // res.cookie('remember', 1, { maxAge: 60 });
//   res.cookie("username", "admin", { secret: 'xiaocc_', maxAge: 60 * 60 * 24 * 1000 });
//    //res.cookie["username"] ='admins';//保存cookie
//    res.cookie("msg", "用户名或密码不能为空", { maxAge: 60 * 60 * 24 * 1000 });
//   // req.session.sessname = 'i am a sesion';
////    req.session.pwd = '123456';
//    res.send('<form method="post"><p>Check to <label>' 
//      + '<input type="checkbox" name="remember"/> remember me</label> ' 
//      + '<input type="submit" value="Submit"/>.</p></form>');
//});

//app.get('/123', function (req, res) {
//    if (req.cookies.username != null) { //使用cookie req.session.sessname+ req.session.pwd 
//        res.send('ok' + res.cookie["username"] +'');
//    } else {
      
//        res.send('请登录');
//    }
//});
// development only
if ('development' == app.get('env')) {
    app.use(express.errorHandler());
}
var routes= require('./routes');
routes(app);

//var isLogin = require('./routes/tool/checkLogin');
//app.get('/imgs', isLogin, function (req, res) {
//    res.render('imgs', { title: 'Express' });
//});
//var routes_login = require('./routes');
//app.get("/login", function (req, res) { routes_login.login(req, res); });

//routes_login(app);




http.createServer(app).listen(app.get('port'), function () {
    console.log('Express server listening on port ' + app.get('port'));
});
