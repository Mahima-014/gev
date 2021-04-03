import 'package:flutter/material.dart';
import 'package:gev_app/models/feedback.dart';
import 'package:gev_app/models/feedback_list_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedbackController {
  List<FeedbackListModel> getFeedbackList() {
    List<FeedbackListModel> feedbackList = [
      FeedbackListModel(
        name: 'Raman',
        text: 'Here is the text',
        rating: 4.0,
      ),
      FeedbackListModel(
        name: 'Rohan',
        text: 'Here is the text',
        rating: 4.0,
      ),
      FeedbackListModel(
        name: 'Raman',
        text: 'Here is the text',
        rating: 4.0,
      ),
      FeedbackListModel(
        name: 'Raman',
        text: 'Here is the text',
        rating: 4.0,
      ),
    ];
    print("getFeedbackList() : ${feedbackList[0].name}");
    return feedbackList;
  }


  List<FeedbackModel> getViewDetailsList() {
    List<FeedbackModel> viewDetailsList =[

      FeedbackModel(
          text : "Overall Experience",
          rating: 3.0
      ),
      FeedbackModel(
          text : "Reservation Experience",
          rating: 3.0
      ),
      FeedbackModel(
          text : "Staff Experience",
          rating:  3.0
      ),
      FeedbackModel(
          text : "Events Organization"
          ,rating:  3.0
      ),
      FeedbackModel(
          text : "Value For Money",
          rating:  3.0
      ),
    ];

    print("getFeedbackList() : ${viewDetailsList[0].text}");
    return viewDetailsList;
  }
}
