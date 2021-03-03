const Employee = require('../models/employee');
const Company = require('../models/Company');

Company.find({ CreatedAt: { $gte: new Date().setFullYear((new Date).getFullYear() - 1) } }, { name: 1, _id: 0 }, (err, companies) => {
    if (err) return console.log("something went wrong");
    console.log(companies);
});

Employee.find({ age: { "$gte": 20, "$lte": 30 } }, { _id: 0 }, (err, employees) => {
    if (err) return console.log("something went wrong");
    console.log(employees);
})

Employee.find({ isManager: true }, (err, employees) => {
    if (err) return console.log("something went wrong");
    console.log(employees)
})

Company.updateMany({}, { state: "tehran", city: "tehran" }, { new: true, runValidators: true }, (err, result) => {
    if (err) return console.log("something went wrong");
    console.log(result);
})