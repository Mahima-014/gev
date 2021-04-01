import 'package:flutter/material.dart';

class HomeSection3 extends StatefulWidget {
  @override
  _HomeSection3State createState() => _HomeSection3State();
}

class _HomeSection3State extends State<HomeSection3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/home_accomodation.jpg"),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/accommodation',
                          ModalRoute.withName('/accommodation'));
                    },
                  ),
                  Text('Accommodation'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/home_map.jpg"),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/map', ModalRoute.withName('/map'));
                    },
                  ),
                  Text('Map'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/home_donation.jpg"),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/supportACause',
                          ModalRoute.withName('/supportACause'));
                    },
                  ),
                  Text('Support a cause'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/home_feedback.jpg"),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/feedback', ModalRoute.withName('/feedback'));
                    },
                  ),
                  Text('Feedback'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
