const Staff = require("../models/staff");
const Role = require("../models/role");
const ResponseHelper = require("../utils/response_helper");
module.exports = {
  get_staff: async (req, res) => {
    try {
      Staff.find().then((doc) => {
        const response = new ResponseHelper(false, "Get All Staff", doc);
        res.status(200).json(response);
      });
    } catch (e) {
      const response = new ResponseHelper(true, e, null);
      res.status(403).json(response);
    }
  },
  get_special_staff: async (req, res) => {
    try {
      Staff.findById(req.params.id).then((doc) => {
        const response = new ResponseHelper(false, "Get Special Staff", doc);
        res.status(200).json(response);
      });
    } catch (e) {
      const response = new ResponseHelper(true, e, null);
      res.status(403).json(response);
    }
  },
};
