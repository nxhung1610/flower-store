const express = require("express");

const router = express.Router();
const controller = require("../controllers/staff_controller");
const permissionRole = require("../middleware/permission_role");
const authMiddleWare = require("../middleware/auth");

// Login to staff account
router.post("/login", controller.login);

// Register new staff account
router.post("/register", controller.register);

router.use(authMiddleWare);

router.post("/logout", controller.logout);
// Get all staff
router.get("/", permissionRole, controller.get_staff);

//Get special staff by id
router.get("/:id", permissionRole, controller.get_special_staff);

module.exports = router;
