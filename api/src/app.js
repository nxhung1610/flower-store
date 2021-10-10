require("dotenv").config();

const express = require("express");
require("./database/mongoose");
const morgan = require("morgan");
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(morgan("dev"));

module.exports = app;
