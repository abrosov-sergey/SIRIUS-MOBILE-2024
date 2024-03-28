import 'package:shared_preferences/shared_preferences.dart';

abstract class MyLocator {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
