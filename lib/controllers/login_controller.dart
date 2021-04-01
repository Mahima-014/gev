import 'package:gev_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInController {
  void login(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('phoneNo') == user.userPhone.toString()) {
      prefs.setString('isLoggedIn', "true");
      print("You are logged in. DETAILS : phoneNo : ${user.userPhone}");
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isLoggedIn", "false");
    // new User().setUser();
    prefs.setString("phoneNo", "");
    prefs.setString("name", "");
    prefs.setString("email", "");

    print("You are logged out.");
  }
}
