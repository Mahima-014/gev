import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gev_app/models/user.dart';
import 'package:gev_app/models/mobile_user_details.dart';
import 'package:gev_app/utilities/local_notify_manager.dart';
import 'package:gev_app/utilities/preferences.dart';
import 'package:gev_app/views/feedback_screen.dart';
import 'package:path/path.dart';

class CheckInController {
  BuildContext context;
  Preferences preferences = Preferences();

  CheckInController({this.context});

  void saveUserAndMobileUserDetailsInPreferences(
      User user, MobileUserDetails mobileUserDetails) {
    String userJson = jsonEncode(user.toJson());
    String mobileUserDetailsJson = jsonEncode(mobileUserDetails.toJson());
    preferences.setPreferences(Preferences.userKey, userJson);
    print(preferences.getPreferences(Preferences.userKey));
    preferences.setPreferences(
        Preferences.mobileUserDetailsKey, mobileUserDetailsJson);
    print(preferences.getPreferences(Preferences.mobileUserDetailsKey));
  }

  User getUserModelFromPreferences() {
    String userJson = preferences.getPreferences(Preferences.userKey);
    Map userMap = jsonDecode(userJson);
    var userModel = User.fromJson(userMap);

    return userModel;
  }

  MobileUserDetails getMobileUserDetailsModelFromPreferences() {
    String mobileUserDetailsJson =
        preferences.getPreferences(Preferences.mobileUserDetailsKey);
    Map mobileUserDetailsMap = jsonDecode(mobileUserDetailsJson);
    var mobileUserDetailsModel =
        MobileUserDetails.fromJson(mobileUserDetailsMap);

    return mobileUserDetailsModel;
  }

  //Controller for feedback notification.

  feedbackNotification(DateTime checkOutDate) async {
    LocalNotifyManager.localNotifyManager = LocalNotifyManager.init();
    LocalNotifyManager.localNotifyManager
        .setOnNotificationReceive(onNotificationReceive);
    LocalNotifyManager.localNotifyManager
        .setOnNotificationClick(onNotificationClick);
    await LocalNotifyManager.localNotifyManager.scheduleNotification(checkOutDate,'Feedback', 'Please give us feedback', '');
  }

  onNotificationReceive(RecieveNotification notification) {
    print('Notification Recieved: ${notification.id}');
  }

  onNotificationClick(String payload) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FeedbackScreen();
    }));
  }
}
