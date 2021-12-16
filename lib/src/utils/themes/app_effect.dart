class AppEffect {
  static final AppEffect _singleton = AppEffect._internal();

  factory AppEffect() {
    return _singleton;
  }
  AppEffect._internal();
}
