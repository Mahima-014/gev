import 'package:flutter/material.dart';
import 'package:gev_app/views/check_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gev_app/views/walkin.dart';

class HomeSection1 extends StatefulWidget {
  @override
  _HomeSection1State createState() => _HomeSection1State();
}

class _HomeSection1State extends State<HomeSection1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  // height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                    child: new ElevatedButton(
                      style: ButtonStyle(
                        // minimumSize: MaterialStateProperty.all(),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange[900]),
                        // minimumSize: MaterialStateProperty.all(),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckInScreen()),
                        );
                      },
                      child: new Text(
                        'Check-In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // height: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                  ),
                  child: Text(
                    'For our inhouse guests',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  // height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                    child: new ElevatedButton(
                      style: ButtonStyle(
                        // minimumSize: MaterialStateProperty.all(),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange[900]),
                        // minimumSize: MaterialStateProperty.all(),
                      ),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        if (prefs.getString('isSkippedUser') == "true") {
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Walkin()));
                        }
                      },
                      child: new Text(
                        'Walk-In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // height: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                  ),
                  child: Text(
                    'For our daily visitors',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
