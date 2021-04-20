import 'package:flutter/material.dart';
import 'package:gev_app/models/mobile_user_details.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:gev_app/utilities/db_manager.dart';
import 'package:gev_app/views/view_walk_in_screen.dart';

class WalkInController {
  DbManager dbManager;
  BuildContext context;
  // time slot list for dropdown.
  List<String> timeSlotList = [
    '10:00 A.M. To 1:00 P.M.',
    '1:00 P.M. To 4:00 P.M.'
  ];

  WalkInController({this.context});

  List<String> getTimeSlots() {
    return timeSlotList;
  }

  //save time slot and additional member in db.
  saveDataInDB(MobileUserDetails mobileUserDetails) {
    mobileUserDetails = checkTimeSlot(mobileUserDetails);
    dbManager = DbManager();
    // dbManager.createTableIfNotExists(Constant.mobile_user_details,
    //     Constant.queryToCreateMobileUserDetailsTable);
    dbManager.getLastID(Constant.mobile_user_details);
    if (DbManager.lastID == 1) {
      dbManager.update(
          Constant.mobile_user_details, mobileUserDetails.toJson());
    } else {
      dbManager.insert(
          Constant.mobile_user_details, mobileUserDetails.toJson());
    }

    dbManager.getRecords(Constant.queryToGetAllRecordsOfMobileUserDetailsTable);
    navigateToCorrectScreen(mobileUserDetails);
  }

  // function to check time slot.
  MobileUserDetails checkTimeSlot(MobileUserDetails mobileUserDetails) {
    if (mobileUserDetails.slotTimeStart == '10:00 A.M. To 1:00 P.M.') {
      mobileUserDetails.slotTimeStart =
          Common.convertTimeOfDayToString(TimeOfDay(hour: 10, minute: 0));
      mobileUserDetails.slotTimeEnd =
          Common.convertTimeOfDayToString(TimeOfDay(hour: 13, minute: 0));
      return mobileUserDetails;
    } else if (mobileUserDetails.slotTimeStart == '1:00 P.M. To 4:00 P.M.') {
      mobileUserDetails.slotTimeStart =
          Common.convertTimeOfDayToString(TimeOfDay(hour: 13, minute: 0));
      mobileUserDetails.slotTimeEnd =
          Common.convertTimeOfDayToString(TimeOfDay(hour: 16, minute: 0));
      return mobileUserDetails;
    }
  }

  navigateToCorrectScreen(MobileUserDetails mobileUserDetails)
  {
    if(Common.convertStringToTimeOfDay(mobileUserDetails.slotTimeStart).hour == 10)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewWalkInScreen('assets/images/Walk_in_ticket.png')),);
      }
    else if(Common.convertStringToTimeOfDay(mobileUserDetails.slotTimeStart).hour == 13)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewWalkInScreen('assets/images/walk_in_ticket_green.png')),);
    }

  }
}
