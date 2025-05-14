var mysql = require('mysql');
var database = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'binuslite'
});

database.connect();
module.exports = database;
