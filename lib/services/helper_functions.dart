import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = "isLoggedIn";
  static Future<bool> saveUserLoggedInSharedPreference(bool isLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(
        sharedPreferenceUserLoggedInKey, isLoggedIn);
  }

  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn =
        sharedPreferences.getBool(sharedPreferenceUserLoggedInKey) ?? false;

    return isLoggedIn;
  }
}
