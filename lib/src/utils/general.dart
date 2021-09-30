/// Logging config
const kLOG_TAG = "[APP]";
const kLOG_ENABLE = true;

void printLog(dynamic data) {
  if (kLOG_ENABLE) {
    // ignore: avoid_print
    print("[${DateTime.now().toUtc()}]$kLOG_TAG${data.toString()}");
  }
}
