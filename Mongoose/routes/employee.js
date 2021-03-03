const express = require("express");
const router = express.Router();
const Employee = require('../models/employee');

router.get('/all', (req, res) => {
    Employee.find({}, (err, employees) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(employees);
    });
});

router.get('/:id', (req, res) => {
    Employee.findOne({ _id: req.params.id }, (err, employee) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(employee);
    })
});

router.put('/', (req, res) => {
    const newEmployee = new Employee(req.body);
    // newEmployee.calculateAge();
    newEmployee.save((err, employee) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(employee);
    })
});

router.post('/:id', (req, res) => {
    Employee.findOneAndUpdate({ _id: req.params.id }, req.body, { new: true, runValidators: true, useFindAndModify: false }, (err, employee) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(employee);
    })
});

router.delete('/:id', (req, res) => {
    Employee.findOneAndDelete({ _id: req.params.id }, (err, employee) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json({ employee, msg: "success" });
    })
});

module.exports = router;