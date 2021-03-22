import 'package:flutter/material.dart';
import 'package:gev_app/utilities/commons.dart';


class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBar('Events'),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingHomeButton(),
      body: Container(),
    );
  }
}
