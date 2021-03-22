import 'dart:convert';
import 'package:gev_app/models/user.dart';
import 'package:gev_app/models/mobile_user_details.dart';
import 'package:gev_app/utilities/preferences.dart';

class CheckInController
{

  Preferences preferences = Preferences();

  void saveUserAndMobileUserDetailsInPreferences(User user, MobileUserDetails mobileUserDetails )
  {
    String userJson = jsonEncode(user.toJson());
    String mobileUserDetailsJson = jsonEncode(mobileUserDetails.toJson());
    preferences.setPreferences(Preferences.userKey, userJson);
    print(preferences.getPreferences(Preferences.userKey));
    preferences.setPreferences(Preferences.mobileUserDetailsKey, mobileUserDetailsJson);
    print(preferences.getPreferences(Preferences.mobileUserDetailsKey));
  }

  User getUserModelFromPreferences()
  {
    String userJson = preferences.getPreferences(Preferences.userKey);
    Map userMap = jsonDecode(userJson);
    var userModel = User.fromJson(userMap);

    return userModel;
  }

  MobileUserDetails getMobileUserDetailsModelFromPreferences()
  {
    String mobileUserDetailsJson = preferences.getPreferences(Preferences.mobileUserDetailsKey);
    Map mobileUserDetailsMap = jsonDecode(mobileUserDetailsJson);
    var mobileUserDetailsModel = MobileUserDetails.fromJson(mobileUserDetailsMap);

    return mobileUserDetailsModel;
  }
}