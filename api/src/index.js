require("dotenv").config();

const express = require("express");
require("./database/mongoose");
const morgan = require("morgan");
const port = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(morgan("dev"));

// ROUTER
app.get("/", function (req, res) {
  res.send("Active");
});

app.use("/staff", require("./routers/staff_router"));
app.use("/role", require("./routers/role_router"));

//SERVER
app.listen(port, function () {
  console.log(`Server listening on port ${port}`);
});
