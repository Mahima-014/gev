import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gev_app/utilities/commons.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBar('Today\'s Schedule'),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingHomeButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 40,left:40,right:40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 270,
                    child: Stack(
                      //fit: StackFit.expand,
                      children: [
                        Image.asset('assets/images/VrindavanForestTemple.jpeg'),
                        InkWell(
                          onTap: () {
                            showAlertBox(context);
                          },
                          child: ClipRRect(
                            // Clip it cleanly.
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 1.2, sigmaY: 1.2),
                              child: Container(
                                height: 150,
                                width: 220,
                                color: Colors.grey.withOpacity(0.1),
                                alignment: Alignment.center,
                                child: Text(
                                  'Temple 1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(left:40,right:40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 270,
                    child: Stack(
                      //fit: StackFit.expand,
                      children: [
                        Image.asset('assets/images/VrindavanBehariTemple.jpg'),
                        InkWell(
                          onTap: (){
                            showAlertBox(context);
                          },
                          child: ClipRRect(
                            // Clip it cleanly.
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                              child: Container(
                                height: 150,
                                width: 220,
                                color: Colors.grey.withOpacity(0.1),
                                alignment: Alignment.center,
                                child: Text(
                                  'Temple 2',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(left:40,right:40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 200,
                      width: 270,
                      child: Stack(
                        //fit: StackFit.expand,
                        children: [
                          Image.asset('assets/images/KeshiGhat.jpeg'),
                          InkWell(
                            onTap: (){
                              showAlertBox(context);
                            },
                            child: ClipRRect(
                              // Clip it cleanly.
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 1.2, sigmaY: 1.2),
                                child: Container(
                                  height: 150,
                                  width: 220,
                                  color: Colors.grey.withOpacity(0.1),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Temple 3',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 40,left: 40,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 200,
                      width: 400,
                      child: Stack(
                        //fit: StackFit.expand,
                        children: [
                          Image.asset('assets/images/MadanMohanTemple.jpg'),
                          InkWell(
                            onTap: (){
                              showAlertBox(context);
                            },
                            child: ClipRRect(
                              // Clip it cleanly.
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 1.2, sigmaY: 1.2),
                                child: Container(
                                  height: 150,
                                  width: 220,
                                  color: Colors.grey.withOpacity(0.1),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Temple 4',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    AlertDialog showAlertBox(BuildContext context){
      var alertBox=AlertDialog(
        title: Text('Ram Mandir'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Venue: Ram Mandir'),
            ],
          ),
        ),
      );
      showDialog(context: context, builder: (BuildContext){
        return alertBox;
      });
    }
}
