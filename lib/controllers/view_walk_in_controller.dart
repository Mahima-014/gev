import 'package:flutter/cupertino.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:gev_app/utilities/db_manager.dart';

class ViewWalkInController {

   getDataList()
  {
    DbManager dbManager = DbManager();
    dbManager.getRecords(Constant.queryToGetAllRecordsOfMobileUserDetailsTable);
  }

}