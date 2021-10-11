const app = require("./app");
const port = process.env.PORT || 3000;

// ROUTER
app.get("/", function (req, res) {
  res.send("Active");
});

//SERVER
app.listen(port, function () {
  console.log(`Server listening on port ${port}`);
});
