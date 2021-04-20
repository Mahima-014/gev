import 'package:flutter/cupertino.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:gev_app/utilities/db_manager.dart';

class ViewWalkInController {

   Future<List<Map>> getDataList() async
  {
    DbManager dbManager = DbManager();
    List<Map> list = await dbManager.getRecords(Constant.queryToGetAllRecordsOfMobileUserDetailsTable);
    return list;
  }

}