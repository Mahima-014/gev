import 'dart:collection';

import 'package:gev_app/models/event_list_model.dart';
import 'package:gev_app/utilities/db_manager.dart';

class EventController
{
  DbManager dbManager;
  List<EventListModel> getEventList(int year, String month)
  {

    HashMap map = HashMap<String,String>();
    //dbManager.insert("", map);

    List<EventListModel> eventList = [
    EventListModel(eventName: 'Govardhan Puja', date: '11/02/2021', description: 'Pooja'),
    EventListModel(eventName: 'Yamuna Arti', date: '11/02/2021', description: 'Pooja'),
    EventListModel(eventName: 'Evening Arti', date: '11/02/2021', description: 'Pooja'),
    ];
    return eventList;

    
  }

}