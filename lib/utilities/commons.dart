import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:gev_app/views/event_screen.dart';
import 'package:gev_app/views/home.dart';
import 'package:gev_app/views/profile_screen.dart';
import 'package:gev_app/views/schedule_screen.dart';
import 'package:intl/intl.dart';

class Common {
  //App Bar
  static AppBar appBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color(Constant.appBarTextColor),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Color(Constant.appBarBackgroundColor),
    );
  }

  //appbar with logout button
  static AppBar appBarWithLogout(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color(Constant.appBarTextColor),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Color(Constant.appBarBackgroundColor),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(
            Icons.logout,
          ),
          onSelected: (String value) {
            switch (value) {
              case 'Logout':
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return {'Logout'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  //background image
  static BoxDecoration background() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/gev_background.jpeg"),
        fit: BoxFit.fill,
      ),
    );
  }

  //circular text field
  static InputDecoration buildInputDecoration(IconData icons, String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      prefixIcon: IconButton(
        icon: Icon(icons),
        onPressed: null,
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(color: Colors.white, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
    );
  }


  static InputDecoration buildInputDecorationComment(String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(color: Colors.white, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
    );
  }


  static List<DropdownMenuItem<int>> getYearDropDownButton()
  {
    return getYearList().map((int value) {
        return new DropdownMenuItem<int>(
          value: value,
          child: new Text(value.toString()),
        );
      }).toList();
  }


  static List<int> getYearList()
  {
    List<int> yearList = [];
    for(int i=DateTime.now().year; i>=2010; i--)
      yearList.add(i);

    return yearList;
  }


  static List<String> getMonthList()
  {
    List<String> monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    return monthList;
  }

  static String convertDateTimeToString(DateTime date)
  {
    return date.toIso8601String();
  }

  static DateTime convertStringToDateTime(String date)
  {
    return DateTime.parse(date);
  }

  static TimeOfDay convertStringToTimeOfDay(String time)
  {
    int hour;
    int minute;
    String ampm = time.substring(time.length - 2);
    String result = time.substring(0, time.indexOf(' '));
    if (ampm == 'AM' && int.parse(result.split(":")[1]) != 12) {
      hour = int.parse(result.split(':')[0]);
      if (hour == 12) hour = 0;
      minute = int.parse(result.split(":")[1]);
    } else {
      hour = int.parse(result.split(':')[0]) - 12;
      if (hour <= 0) {
        hour = 24 + hour;
      }
      minute = int.parse(result.split(":")[1]);
    }
    return TimeOfDay(hour: hour, minute: minute);
  }

  static String convertTimeOfDayToString(TimeOfDay time)
  {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
  }

  //Function to convert TimeOfDay into DateTime.

  static DateTime convertTimeOfDayToDateTime(TimeOfDay time)
  {
    final now = new DateTime.now();
    return new DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }
}


//BottomNavigationBar

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.amber[300],
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.brown,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: new TextStyle(
                  color: Colors
                      .black))), // sets the inactive color of the `BottomNavigationBar`
      child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/event.png",
              scale: 1.5,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/map.png",
              scale: 1.5,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(null
                // Icons.home,
                // size: 40,
                ),
            label: 'Home',
            // label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/schedule.png",
              scale: 1.5,
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/profile.png",
              scale: 1.5,
            ),
            label: 'Profile',
          ),
        ],
        // backgroundColor: Colors.amber[400],
        unselectedItemColor: Colors.brown,
        // showUnselectedLabels: true,
        fixedColor: Colors.brown,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => EventScreen()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ScheduleScreen()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}

// Floating home button.

class FloatingHomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      elevation: 0.0,
      child: Image.asset(
        "assets/icons/home.png",
        scale: 1.5,
      ),
      backgroundColor: Colors.amber[300],
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    );
  }
}
