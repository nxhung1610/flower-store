const mongoose = require("mongoose");
mongoose.connect(process.env.DB_STRING_CONNECTION, function () {
  console.log("Connect to Database");
});
