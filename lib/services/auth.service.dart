import 'package:flutter_auth_template/constants/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static SharedPreferences prefs;
  static Future<SharedPreferences> getPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    return prefs;
  }

  //
  static bool firstTimeOnApp() {
    return prefs.getBool(AppStrings.firstTimeOnApp) ?? true;
  }

  //
  static bool authenticated() {
    return prefs.getBool(AppStrings.authenticated) ?? false;
  }

  static Future<String> getAuthBearerToken() async {
    return prefs.getString(AppStrings.userAuthToken) ?? "";
  }
}
