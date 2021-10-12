const mongoose = require("mongoose");
const validator = require("validator");

const roleSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  color: {
    type: String,
    required: true,
    trim: true,
  },
});

const Role = mongoose.model("Role", roleSchema);

module.exports = Role;
