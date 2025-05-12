// Student.js
const mongoose = require("mongoose");

const studentSchema = new mongoose.Schema({
  name: String,
  rollno: String,
  course: String,
  email: String,
});

module.exports = mongoose.model("Student", studentSchema);
