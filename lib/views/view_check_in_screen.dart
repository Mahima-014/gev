import 'package:flutter/material.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:gev_app/utilities/size_config.dart';

// Screen to get the details of check in user.

class ViewCheckInScreen extends StatefulWidget {
  @override
  _ViewCheckInScreenState createState() => _ViewCheckInScreenState();
}

class _ViewCheckInScreenState extends State<ViewCheckInScreen> {
  String nameStr;
  String checkOutDateStr;
  DateTime checkOutDate;
  TextEditingController checkOutDateCon = TextEditingController();
  String checkInDateStr;
  DateTime checkInDate;
  TextEditingController checkInDateCon = TextEditingController();


  //global key for validation
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    _form.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: Common.appBar('View Check-In'),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingHomeButton(),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            //width: double.infinity,
            //height: double.infinity,
            decoration: Common.background(),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 10, right: 10, top: 30),
                    child: TextFormField(
                      readOnly: true,
                      decoration: Common.buildInputDecoration(
                          Icons.account_circle_outlined, "Full Name"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: TextFormField(
                      readOnly: true,
                      decoration: Common.buildInputDecoration(
                          Icons.phone, "Contact Number"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: TextFormField(
                      readOnly: true,
                      decoration: Common.buildInputDecoration(
                          Icons.calendar_today_sharp, "Check-In Date"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: TextFormField(
                      readOnly: true,
                      decoration: Common.buildInputDecoration(
                          Icons.calendar_today_sharp, "Check-Out Date"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: TextFormField(
                      readOnly: true,
                      decoration: Common.buildInputDecoration(
                          Icons.house_sharp, "Accommodation"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      decoration:
                      Common.buildInputDecoration(Icons.lock, "Passcode"),
                    ),
                  ),

                ],
              ),
            )),
      ),
    );
  }
}