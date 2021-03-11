import 'package:flutter/material.dart';
import 'package:gev_app/utilities/commons.dart';

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
    return Scaffold(
      appBar: Common.appBar('View Check-In'),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          height: double.infinity,
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
                    keyboardType: TextInputType.text,
                    decoration: Common.buildInputDecoration(
                        Icons.account_circle_outlined, "Full Name"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      nameStr = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: Common.buildInputDecoration(
                        Icons.phone, "Contact Number"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      nameStr = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    controller: checkInDateCon,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      pickupDateCheckIn();
                    },
                    keyboardType: TextInputType.text,
                    decoration: Common.buildInputDecoration(
                        Icons.calendar_today_sharp, "Check-In Date"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      nameStr = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    controller: checkOutDateCon,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      pickupDateCheckOut();
                    },
                    keyboardType: TextInputType.text,
                    decoration: Common.buildInputDecoration(
                        Icons.calendar_today_sharp, "Check-Out Date"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      nameStr = value;
                    },
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
                    decoration: Common.buildInputDecoration(
                        Icons.house_sharp, "Accommodation"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      nameStr = value;
                    },
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
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      nameStr = value;
                    },
                  ),
                ),

              ],
            ),
          )),
    );
  }

  pickupDateCheckOut() async {
    DateTime checkOutDateLoc = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
          DateTime.now().year - 5,
        ),
        lastDate: DateTime(
          DateTime.now().year + 5,
        ));
    if (checkOutDateLoc == null) {
      print(checkOutDateLoc);
    } else {
      {
        setState(() {
          checkOutDate = checkOutDateLoc;
          checkOutDateCon.text =
              "${checkOutDate.day}/${checkOutDate.month}/${checkOutDate.year}";
          print(checkOutDate);
        });
      }
    }
  }

  pickupDateCheckIn() async {
    DateTime checkInDateLoc = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
          DateTime.now().year - 5,
        ),
        lastDate: DateTime(
          DateTime.now().year + 5,
        ));
    if (checkInDateLoc == null) {
      print(checkInDateLoc);
    } else {
      {
        setState(() {
          checkInDate = checkInDateLoc;
          checkInDateCon.text =
              "${checkInDate.day}/${checkInDate.month}/${checkInDate.year}";
          print(checkInDate);
        });
      }
    }
  }
}
