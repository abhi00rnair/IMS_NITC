const mongoose = require("mongoose");

const studentSchema = new mongoose.Schema({
  name: { type: String, required: true },
  rollno: { type: String, required: true },
  phone: { type: String, required: true },
  email: { type: String, required: true },
  DOB: { type: String },
  DOJ: { type: String },
  Degree: { type: String },
  Gender: { type: String },
  Specialisation: { type: String },
  cgpa: { type: mongoose.Schema.Types.Decimal128, default: 0.0 },
  APAAR_ID: { type: String },
  Admission_scheme: { type: String },
  Credit_earned: { type: Number, default: 0 },
  Min_credits: { type: Number, default: 0 },
  Year_of_admission: { type: String },

  Father_Email: { type: String },
  Father_Name: { type: String },
  Mother_Name: { type: String },
  Father_Phone: { type: String },
  Mother_Email: { type: String },
  Mother_Phone: { type: String },
});

module.exports = mongoose.model("Student", studentSchema);
