const express = require("express");
const mongoose = require("mongoose");
require('dotenv').config({path:'./url.env'});

const app = express();

const mongoURI = process.env.MONGO_URI;

async function connectToDB() {
  try {
    await mongoose.connect(mongoURI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log("Connected to MongoDB using Mongoose");
  } catch (error) {
    console.error(" Failed to connect to MongoDB:", error);
  }
}

connectToDB();

app.listen(2000, () => {
  console.log("Server running on port 2000");
});
