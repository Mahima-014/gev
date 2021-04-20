import 'package:flutter/material.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager{

  var databasesPath;
  String path;
  static Database database;
  static int lastID;
  static List<Map> list;
  static const dbName = 'gev.db';


  // To initialization the db.
  static connectToDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      //
      await db.execute(
        Constant.queryToCreateMobileUserDetailsTable
      );
    });
  }

  // Determine whether the table exists.
  isTableExits(String tableName) async {
    //Built-in table sqlite_master
    var sql ="SELECT * FROM sqlite_master WHERE TYPE = 'table' AND NAME = '$tableName'";
    var res = await database.rawQuery(sql);
    var returnRes = res!=null && res.length > 0;
    return returnRes;
  }

  //Create table
  createTableIfNotExists(String tableName, String query) async {
    //var sql = 'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type TEXT)';
    var sql = query;
    if (await isTableExits(tableName) == true) {
      print('createTableIfNotExists : Table does exists');
      return;
    }
    await database.execute(sql);
  }


  // To insert the data in db.
  insert(String tableName, Map map) async {
    // Determine whether the table exists
    if (await isTableExits(tableName) != true) {
      print('insert : Table does not exists');
      return;
    }
    //var values = {'name':'my_name','type':'my_type'};
    await database.insert(tableName, map);
  }

  // To query the data.
  query(String tableName, List list) async {
    //var myColumns = ['name', 'type'];
    var result = await database.query(tableName, columns: list);
    for (var x in result) {
      print(x.keys);
      print(x.values);
    }
  }


  // To get records from the table.
  Future<List<Map>> getRecords(String query) async
  {
    try{
      // Get the records
      list = await database.rawQuery(query);
      print("getRecords : $list");
      return list;
    }
    catch(e)
    {
      print("EXCEPTION getRecords: "+ e);
    }

  }

  // To delete data from table.
  delete(String tableName, List list) async {
    var myWhere = 'name = ?';
    //var myArgs = ['cat'];
    await database.delete(tableName, where: myWhere, whereArgs: list);
  }

  // To update the data from table.
  update(String tableName, Map map) async {
    //var values = {'name':'my_name','type':'my_type'};
    await database.update(tableName, map, where: 'id = 1');
  }


  //Get Last Inserted ID
  Future<int> getLastID(String tableName) async {

   try
   {
     List<Map> listOfLastInsertedID = await database.rawQuery('SELECT * FROM $tableName ORDER BY id DESC LIMIT 1');
     lastID = listOfLastInsertedID.elementAt(0).values.elementAt(0);
     print('LastID : $lastID');
     return lastID;
   }
   catch(e)
    {
      print("EXCEPTION getLastID: "+ e);
      return -2;
    }
  }



  // To shut down the db.
  close () async{
    database?.close();
    database = null;
  }

}