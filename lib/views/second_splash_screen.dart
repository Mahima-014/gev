import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:gev_app/controllers/register_controller.dart';

class SecondSplashScreen extends StatefulWidget {
  @override
  _SecondSplashScreenState createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  String phoneNo = "";

  RegisterController registerController = RegisterController();

  @override
  void initState() {
    super.initState();
    startTime();

    // _loadUserInfo();
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, _loadUserInfo);
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('isValidCheckin', "false");
    prefs.setString('isValidWalkin', "false");
    prefs.setString('isSkippedUser', "false");

    phoneNo = (prefs.getString('phoneNo') ?? "");
    // if (phoneNo == "") {
    // phoneNo = (preferences.getPreferences('phoneNo') ?? "");
    if (phoneNo == "") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/register', ModalRoute.withName('/register'));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/gev.jpg"),
            colorFilter: ColorFilter.srgbToLinearGamma(),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              // scale: 0.8,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(25),
                child: Text(
                  'Welcome to Govardhan Eco Village',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            new SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
