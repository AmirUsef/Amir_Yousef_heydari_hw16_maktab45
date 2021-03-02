const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const CompanySchema = new Schema({
    name: {
        type: String,
        required: true,
        trim: true,
        minlength: 2,
        maxlength: 30
    },
    registration_number: {
        type: String,
        required: true,
        unique: true
    },
    state: {
        type: String
    },
    city: {
        type: String
    },
    phone_number: {
        type: String
    },
    CreatedAt: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Company', CompanySchema);