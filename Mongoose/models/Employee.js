const JDate = require('jalali-date');
const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const EmployeeSchema = new Schema({
    first_name: {
        type: String,
        required: true,
        trim: true,
        minlength: 2,
        maxlength: 30,
        set: v => v.toLowerCase()
    },
    last_name: {
        type: String,
        required: true,
        trim: true,
        minlength: 2,
        maxlength: 30,
        set: v => v.toLowerCase()
    },
    isManager: {
        type: Boolean,
        default: false
    },
    code_number: {
        type: String,
        required: true,
        unique: true,
        default: "00000000"
    },
    gender: {
        type: String,
        enum: ['male', 'female'],
        default: 'male'
    },
    birth_date: {
        year: {
            type: Number,
            min: 1,
            required: true
        },
        month: {
            type: Number,
            min: 1,
            max: 12,
            required: true
        },
        day: {
            type: Number,
            min: 1,
            max: 31,
            required: true
        },
    },
    age: {
        type: Number
    },
    CreatedAt: {
        type: Date,
        default: Date.now
    }
});

EmployeeSchema.methods.calculateAge = function() {
    const today = new JDate;
    const year = today.getFullYear();
    const month = today.getMonth();
    const day = today.getDay();
    if (month > this.birth_date.month || (month == this.birth_date.month && day >= this.birth_date.day))
        this.age = year - this.birth_date.year
    else
        this.age = year - this.birth_date.year - 1
};

EmployeeSchema.pre('save', function(next) {
    this.calculateAge()
    next()
});

// EmployeeSchema.post('findOneAndUpdate', { document: true, query: false }, function() {
//     console.log(1);
//     this.calculateAge()
// });

module.exports = mongoose.model('Employee', EmployeeSchema);