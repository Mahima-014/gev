import 'package:gev_app/models/event_list_model.dart';

class EventController
{
  List<EventListModel> getEventList(int year, String month)
  {
    List<EventListModel> eventList = [
    EventListModel(eventName: 'Govardhan Puja', date: '11/02/2021', description: 'Pooja'),
    EventListModel(eventName: 'Yamuna Arti', date: '11/02/2021', description: 'Pooja'),
    EventListModel(eventName: 'Evening Arti', date: '11/02/2021', description: 'Pooja'),
    ];
    return eventList;

    
  }

}