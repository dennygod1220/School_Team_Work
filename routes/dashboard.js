var express = require('express');
var router = express.Router();

const dashboardController = require('../controllers/dashboard');

router.get('/', dashboardController.getDashboard);

router.get('/moreinfo',dashboardController.moreinfo)

router.post('/addstudent',dashboardController.addstudent)
module.exports = router;