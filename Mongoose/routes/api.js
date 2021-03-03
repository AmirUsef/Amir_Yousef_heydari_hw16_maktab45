const express = require("express");
const router = express.Router();
const employeeRouter = require('./employee');
const companyRouter = require('./company');
// const test = require('./test');

router.use('/employee', employeeRouter);
router.use('/company', companyRouter)



module.exports = router;