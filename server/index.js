const express = require("express");
const mongoose = require("mongoose");

const app = express();

const mongoURI = "mongodb+srv://itsmeabhayrnair:mongodb%40123@cluster0.0pijabf.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

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
