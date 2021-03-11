import 'package:flutter/material.dart';
import 'package:gev_app/view/check_in_screen.dart';
import 'package:gev_app/view/feedback_screen.dart';
import 'package:gev_app/view/view_check_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
}