import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gev_app/utilities/constants.dart';

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
      // actions: <Widget>[
      //   PopupMenuButton<String>(
      //     onSelected: (String value) {
      //       switch (value) {
      //         case 'Logout':
      //           break;
      //         case 'Settings':
      //           break;
      //       }
      //     },
      //     itemBuilder: (BuildContext context) {
      //       return {'Logout', 'Settings'}.map((String choice) {
      //         return PopupMenuItem<String>(
      //           value: choice,
      //           child: Text(choice),
      //         );
      //       }).toList();
      //     },
      //   ),
      //],
    );
  }

  //appbar with logout button

  static AppBar appBarWithLogout(String title)
  {
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
              "assets/images/icons/event.png",
              scale: 1.5,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/icons/map.png",
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
              "assets/images/icons/schedule.png",
              scale: 1.5,
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/icons/profile.png",
              scale: 1.5,
            ),
            label: 'Profile',
          ),
        ],
        // backgroundColor: Colors.amber[400],
        unselectedItemColor: Colors.brown,
        // showUnselectedLabels: true,
        fixedColor: Colors.brown,
        // selectedItemColor: Colors.brown,
        // unselectedLabelStyle: TextStyle(color: Colors.black),
        onTap: null,
      ),
    );
  }
}


class FloatingHomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      elevation: 0.0,
      child: Image.asset(
        "assets/images/icons/home.png",
        scale: 1.5,
      ),
      backgroundColor: Colors.amber[300],
      onPressed: () {},
    );
  }
}