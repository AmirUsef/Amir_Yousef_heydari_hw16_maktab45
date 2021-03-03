const express = require("express");
const router = express.Router();
const Company = require('../models/Company');


router.get('/page:pageNum', (req, res) => {
    Company.find({}, (err, companies) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        if (req.params.pageNum < 1 || companies.length + 6 <= req.params.pageNum * 6)
            res.status(404).send()
        res.render('company', { companies, page: parseInt(req.params.pageNum) })
    });
});

router.get('/all', (req, res) => {
    Company.find({}, (err, companies) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(companies);
    });
});

router.get('/:id', (req, res) => {
    Company.findOne({ _id: req.params.id }, (err, company) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(company);
    })
});

router.put('/', (req, res) => {
    const newCompany = new Company(req.body);
    newCompany.save((err, company) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(company);
    })
});

router.post('/:id', (req, res) => {
    Company.findOneAndUpdate({ _id: req.params.id }, req.body, { new: true, runValidators: true, useFindAndModify: false }, (err, company) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(company);
    })
});

router.delete('/:id', (req, res) => {
    Company.findOneAndDelete({ _id: req.params.id }, (err, company) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json({ company, msg: "success" });
    })
});

module.exports = router;