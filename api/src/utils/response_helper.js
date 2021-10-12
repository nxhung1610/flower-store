function ResponseHelper(error = false, message, data) {
  this.error = error;
  this.message = message;
  this.data = data;
}

module.exports = ResponseHelper;
