import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:gev_app/utilities/size_config.dart';
import 'package:gev_app/view/view_check_in_screen.dart';

class CheckInScreen extends StatefulWidget {
  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  bool isVisible=true;
  bool value = false;
  String nameStr;
  DateTime checkOutDate;
  TextEditingController checkOutDateCon = TextEditingController();
  DateTime checkInDate;
  TextEditingController checkInDateCon = TextEditingController();

  //global key for validation
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return false;
    }
    _formKey.currentState.save();
    return true;
  }
  @override
  Widget build(BuildContext context) {

    //Media Query
    SizeConfig().init(context);

    return Scaffold(
      bottomNavigationBar: BottomNavbar(),
      appBar: Common.appBar('Check-In'),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          height: double.infinity,
          decoration: Common.background(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 10, right: 10, top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: Common.buildInputDecoration(
                        Icons.phone, "Contact Number"),
                    validator: (value) {
                      if (value.isEmpty ||
                          !RegExp(r"^(?:[+0]9)?[0-9]{10}$")
                              .hasMatch(value)) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: TextFormField(
                      controller: checkInDateCon,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        pickupDateCheckIn();
                      },
                      decoration: Common.buildInputDecoration(
                          Icons.calendar_today_sharp, "Check-In Date"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please fill the date';
                        }
                        return null;
                      },

                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please fill the date';
                        }
                        return null;
                      },

                      controller: checkOutDateCon,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        pickupDateCheckOut();
                      },
                      decoration: Common.buildInputDecoration(
                          Icons.calendar_today_sharp, "Check-out Date"),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        Common.buildInputDecoration(Icons.lock, "Passcode"),
                    readOnly: !value,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                Center(
                  child: ListTile(
                    leading: Checkbox(
                        value: value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                            if(value==true)
                              {
                                setState(() {
                                  isVisible=!isVisible;
                                });
                              }
                            else
                              {
                                setState(() {
                                  isVisible=true;
                                });
                              }
                          });
                        },
                      activeColor: Colors.orangeAccent,
                      checkColor: Colors.white,
                    ),
                    title: Text(
                      'Already have Passcode?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                Center(
                  child: ButtonTheme(
                    minWidth: 120,
                    height: 42,
                    child: RaisedButton(
                      onPressed: () {
                        if(_submit()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewCheckInScreen()),
                            );}
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Color(Constant.buttonColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                          side: BorderSide(color: Color(Constant.buttonColor))),
                    ),
                  ),
                )
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
