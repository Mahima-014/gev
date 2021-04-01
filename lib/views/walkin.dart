import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gev_app/utilities/textFields.dart';

class Walkin extends StatefulWidget {
  @override
  _WalkinState createState() => _WalkinState();
}

class _WalkinState extends State<Walkin> {
  @override
  void initState() {
    super.initState();

    // _loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 800,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            new SizedBox(
              height: 30.0,
            ),
            Container(
              child: Image.asset(
                "assets/images/logo.png",
                scale: 0.8,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new TextFormField(
                decoration: buildInputDecoration(Icons.timelapse, 'Slot'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new TextFormField(
                decoration:
                    buildInputDecoration(Icons.people, 'No. of Visitors'),
                keyboardType: TextInputType.phone,
              ),
            ),
            new SizedBox(
              height: 50.0,
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  const Radius.circular(15.0),
                ),
                child: new TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrange[900]),
                    // minimumSize: MaterialStateProperty.all(),
                  ),
                  onPressed: () {},
                  child: new Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
