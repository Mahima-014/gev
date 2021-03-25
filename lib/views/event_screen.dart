import 'package:flutter/material.dart';
import 'package:gev_app/controllers/event_controller.dart';
import 'package:gev_app/models/event_list_model.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:gev_app/utilities/constants.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EventController eventController = EventController();
  List<EventListModel> eventList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventList = eventController.getEventList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBar('Events'),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingHomeButton(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 50,top: 30),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top:10),
                            child: Column(
                              children: [
                                Text(
                                  'Year',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top:10),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_drop_down_circle_rounded,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15,top: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Month',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10,top: 10),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_drop_down_circle_rounded,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius. circular(20),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: eventController.getEventList().length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.only(top:10,bottom:10,right: 10,left: 10),
                            child: InkWell(
                              onTap:(){
                                showAlertBox(context,index);
                                },
                              child: Container(
                                height: 55,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(Constant.starColor),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25))),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,top:15,bottom:15),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${eventList[index].eventName}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right:10,top: 15,bottom: 15),
                                          child: Column(
                                            children: [
                                              Text(
                                                  '${eventList[index].date}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                ),

                              ),
                            ),
                          );
                      }
                    ),

                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AlertDialog showAlertBox(BuildContext context,int index) {
    var alertBox = AlertDialog(
      title: Text(
        'Name : ${eventList[index].eventName}',
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
                'Time: ${eventList[index].date}'
            ),
            SizedBox(
              height: 2,
            ),
            Text(
                'Description: ${eventList[index].description}'
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext) {
          return alertBox;
        });
  }
}
