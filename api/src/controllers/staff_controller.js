const Staff = require("../models/staff");
const Role = require("../models/role");
const ResponseHelper = require("../utils/response_helper");
module.exports = {
  get_staff: async (req, res) => {
    try {
      Staff.find()
        .then((doc) => {
          const response = new ResponseHelper(false, "Get All Staff", doc);
          res.status(200).json(response);
        })
        .catch((e) => {
          const response = new ResponseHelper(true, e.message, null);
          res.status(403).json(response);
        });
    } catch (e) {
      const response = new ResponseHelper(true, e.message, null);
      res.status(403).json(response);
    }
  },
  get_special_staff: async (req, res) => {
    try {
      Staff.findById(req.params.id)
        .then((doc) => {
          const response = new ResponseHelper(false, "Get Special Staff", doc);
          res.status(200).json(response);
        })
        .catch((e) => {
          const response = new ResponseHelper(true, e.message, null);
          res.status(403).json(response);
        });
    } catch (e) {
      const response = new ResponseHelper(true, e.message, null);
      res.status(403).json(response);
    }
  },
  login: async (req, res) => {
    try {
      const staff = await Staff.findByCredentials(
        req.body.email,
        req.body.password
      );
      if (!staff) {
        const response = new ResponseHelper(
          true,
          "Email or Password incorrect"
        );
        res.status(400).json(response);
        return;
      }
      const tokenAuth = staff.getNewTokenAuth();
      const tokenRefesh = staff.getNewTokenRefesh();
      const response = new ResponseHelper(false, "Login Success", {
        tokenAuth: tokenAuth,
        tokenRefesh: tokenRefesh,
      });
      res.status(201).send(response);
    } catch (e) {
      const response = new ResponseHelper(true, e.message);
      res.status(400).json(response);
    }
  },
  register: async (req, res) => {
    try {
      const staff = new Staff(req.body);
      staff
        .save()
        .then((doc) => {
          const response = new ResponseHelper(false, "Register Success");
          res.status(201).send(response);
        })
        .catch((e) => {
          const response = new ResponseHelper(true, e.message);
          res.status(400).json(response);
        });
    } catch (e) {
      const response = new ResponseHelper(true, e.message);
      res.status(400).json(response);
    }
  },
};
