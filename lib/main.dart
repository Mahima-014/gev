import 'package:flutter/material.dart';
import 'package:gev_app/views/second_splash_screen.dart';
import 'package:gev_app/views/first_splash_screen.dart';
import 'package:gev_app/views/login.dart';
import 'package:gev_app/views/home.dart';
import 'package:gev_app/views/register.dart';
import 'package:gev_app/views/walkin.dart';
import 'package:gev_app/utilities/preferences.dart';
import 'package:gev_app/views/check_in_screen.dart';
import 'package:gev_app/views/event_screen.dart';
import 'package:gev_app/views/feedback_screen.dart';
import 'package:gev_app/views/profile_screen.dart';
import 'package:gev_app/views/schedule_screen.dart';
import 'package:gev_app/views/support_a_cause_screen.dart';
import 'package:gev_app/views/view_check_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/check_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => FirstSplashScreen(),
        '/profile': (context) => ProfileScreen(),
        '/schedule': (context) => ScheduleScreen(),
        '/supportACause': (context) => SupportACause(),
        '/viewCheckIn':(context)=>ViewCheckInScreen(),
        '/feedback':(context)=>FeedbackScreen(),
        '/event':(context)=>EventScreen(),
        '/checkInScreen': (context) => CheckInScreen(),
        '/splash': (context) => SecondSplashScreen(),
        '/login': (context) => Login(),
        '/home': (context) => MyHomePage(),
        '/register': (context) => Register(),
        '/walkin': (context) => Walkin(),
      },
    );
  }

  void initialize()
  {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => Preferences.prefs = prefs);
    });
  }
}

