const jwt = require("jsonwebtoken");
const Staff = require("../models/staff");

async function permission_role(req, res, next) {
  try {
    const staff = req.staff;
    let checkValidRole = Role.findOne({
      _id: staff.role,
      name: "Manager",
    }).exec();
    if (!checkValidRole) {
      const response = new ResponseHelper(
        true,
        "You dont have permission",
        null
      );
      res.status(403).json(response);
    }
    next();
  } catch (e) {
    const response = new ResponseHelper(true, e, null);
    res.status(403).json(response);
  }
}
module.exports = permission_role;
