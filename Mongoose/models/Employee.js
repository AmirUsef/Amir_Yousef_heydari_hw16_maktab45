const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const EmployeeSchema = new Schema({
    first_name: {
        type: String,
        required: true,
        trim: true,
        minlength: 2,
        maxlength: 30,
    },
    last_name: {
        type: String,
        required: true,
        trim: true,
        minlength: 2,
        maxlength: 30
    },
    isManager: {
        type: Boolean,
        default: false
    },
    code_number: {
        type: String,
        required: true,
        default: "00000000"
    },
    gender: {
        type: String,
        enum: ['male', 'female'],
        default: 'male'
    },
    birth_date: {
        type: Date,
        default: Date.now
    },
    CreatedAt: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Employee', EmployeeSchema);