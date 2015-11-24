exports.md5 = function (value){
    var crypto = require('crypto');
    var md5 = crypto.createHash('md5');
    md5.update(value);
    var d = md5.digest('hex');
    return d;
}