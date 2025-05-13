var mysql = require('mysql');
var database = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'binus_lite'
});

database.connect();
module.exports = database;
