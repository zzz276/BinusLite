var express = require('express');
var router = express.Router();
var mysql = require('mysql');
const database = require('../database/database');

/* GET major listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;
