const { response } = require("express");
const app = require("./app");
const port = process.env.PORT || 3000;
const authMiddleWare = require("./middleware/auth");

// ROUTER
app.get("/", function (req, res) {
  res.send("Active");
});

app.use(authMiddleWare);

const staffRouter = require("./routers/staff_router");
app.use("/staff", staffRouter);

//SERVER
app.listen(port, function () {
  console.log(`Server listening on port ${port}`);
});
