import 'package:flutter/material.dart';
import 'package:gev_app/controllers/feedback_controller.dart';
import 'package:gev_app/models/feedback_list_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeSection7 extends StatefulWidget {
  @override
  _HomeSection7State createState() => _HomeSection7State();
}

class _HomeSection7State extends State<HomeSection7> {
  FeedbackController feedbackController = FeedbackController();
  List<FeedbackListModel> feedbackList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      feedbackList = feedbackController.getFeedbackList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Feedbacks',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See More'),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: WidgetSlider(context),
        ),
      ],
    );
  }

  Swiper WidgetSlider(context) {
    return new Swiper(
      autoplay: true,
      viewportFraction: 0.8,
      scale: 1,
      itemCount: feedbackController.getFeedbackList().length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 0, right: 40),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              // height: 50,
              // width: 10,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${feedbackList[index].name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SmoothStarRating(
                          allowHalfRating: true,
                          onRated: (v) {},
                          starCount: 5,
                          rating: feedbackList[index].rating,
                          size: 30.0,
                          isReadOnly: true,
                          // fullRatedIconData: Icons.blur_off,
                          // halfRatedIconData: Icons.blur_on,
                          color: Colors.white,
                          borderColor: Colors.white,
                          spacing: 0.0,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${feedbackList[index].text}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class $ {}
