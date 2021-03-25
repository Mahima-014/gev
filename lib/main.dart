import 'package:flutter/material.dart';
import 'package:gev_app/utilities/preferences.dart';
import 'package:gev_app/views/check_in_screen.dart';
import 'package:gev_app/views/event_screen.dart';
import 'package:gev_app/views/feedback_screen.dart';
import 'package:gev_app/views/profile_screen.dart';
import 'package:gev_app/views/schedule_screen.dart';
import 'package:gev_app/views/support_a_cause_screen.dart';
import 'package:gev_app/views/view_check_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => CheckInScreen(),
        '/profile': (context) => ProfileScreen(),
        '/schedule': (context) => ScheduleScreen(),
        '/supportACause': (context) => SupportACause(),
        '/viewCheckIn':(context)=>ViewCheckInScreen(),
        '/feedback':(context)=>FeedbackScreen(),
        '/event':(context)=>EventScreen(),
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