const express = require('express');
const homeController = require('../controllers/home');

const router = express.Router();

// route dashboard
router.get('/dashboard', (req, res) => {
    res.render('sites/dashboard');
});
// route login
// router.post('/login', authController.login);

module.exports = router;