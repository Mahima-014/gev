import 'package:flutter/material.dart';
import 'package:gev_app/utilities/preferences.dart';
import 'package:gev_app/view/check_in_screen.dart';
import 'package:gev_app/view/feedback_screen.dart';
import 'package:gev_app/view/profile_screen.dart';
import 'package:gev_app/view/support_a_cause_screen.dart';
import 'package:gev_app/view/view_check_in_screen.dart';
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
      home:CheckInScreen(),
    );
  }

  void initialize()
  {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => Preferences.prefs = prefs);
    });
  }
}