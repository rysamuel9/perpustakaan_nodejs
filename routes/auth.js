const express = require('express');
const authController = require('../controllers/auth');

const router = express.Router();

// route register
router.post('/register', authController.register);
// route login
router.post('/login', authController.login);

module.exports = router;