exports.node_mssql = function () {
    var http = require("http");
    var node_mssql = require('node-mssql');
    var connetionObj = new node_mssql.Query({
        host: '10.20.22.119',
        port: 1433,
        username: 'sa',
        password: '123456',
        db: 'course'
    });
    return connetionObj;
}
exports.mssql = function () {
    var mssql = require('node-mssql').mssql;
    
    var config = {
        user: 'sa',
        password: '123456',
        server: '10.20.22.119',
        database: 'course',
        pool: {
            max: 10,
            min: 0,
            idleTimeoutMillis: 30000
        }
    };
    var getConn = function () {
        var connection = new sql.Connection(config);
        return connection;
    }
    return {
        query: function (sql, callback) {
            mssql.connect(config, function (err) {
                var request = new mssql.Request();
                request.query(sql, function (err, recordset) {
                    mssql.close();
                    callback(recordset);
                });
            });
        },
        request: function () {
            var conn = getConn();
            var request = new mssql.Request(conn);
            request.query('  select top 10 * from systemlog', function (err, recordset) {
                console.log(recordset[0]); // return 1
            });
        }
    };
}

