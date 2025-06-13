const express = require('express');
const router = express.Router();
const majorController = require('../controllers/majorController');

router.post('/createMajor', majorController.createMajor);
router.get('/allMajor', majorController.getAllMajors);

module.exports = router;
