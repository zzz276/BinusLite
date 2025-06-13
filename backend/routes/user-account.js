const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.post('/signup', userController.signup);
router.post('/login', userController.login);
router.get('/:user_id/getProfile', userController.getUserProfile);
router.patch('/:user_id/updateProfile', userController.updateUserProfile);
router.patch('/:user_id/password', userController.updatePassword);

module.exports = router;
