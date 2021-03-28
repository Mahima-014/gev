import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager{

  var databasesPath;
  String path;
  Database database;
  int lastID;
  static List<Map> list;
  static const dbName = 'gev.db';

//   void connectToDB() async
//   {
//     // Get a location using getDatabasesPath
//     databasesPath = await getDatabasesPath();
//     path = join(databasesPath, 'gev.db');
//
// // Delete the database
//     //await deleteDatabase(path);
//
// // open the database
//     database = await openDatabase(path, version: 1,
//       // onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       // await db.execute(
//       //     'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, rollno TEXT)');
//       //}
//     );
//
//
//
//
// // Update some record
// //     int count = await database.rawUpdate(
// //         'UPDATE Test SET name = ?, value = ? WHERE name = ?',
// //         ['updated name', '9876', 'some name']);
// //     print('updated: $count');
//
// //   assert(const DeepCollectionEquality().equals(list, expectedList));
//
// // Count the records
// //     count = Sqflite
// //         .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
// //   assert(count == 2);
//
// // Delete a record
// //   count = await database
// //       .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
// //   assert(count == 1);
//
//   }
//
//   Future<List<Map>> getRecords() async
//   {
//     // Get the records
//     list = await database.rawQuery('SELECT * FROM User');
//     print(list);
//     return list;
//   }
//
//   void insert(String name, String rollno) async
//   {
//     // Insert some records in a transaction
//     lastID = await getLastID(); lastID++;
//     await database.transaction((txn) async {
//       int id1 = await txn.rawInsert(
//           'INSERT INTO User(id, name, rollno) VALUES($lastID, "$name", "$rollno")');
//       print('inserted: $id1');
//     });
//   }
//
//   Future<int> getLastID() async
//   {
//     //Get Last Inserted ID
//     List<Map> listOfLastInsertedID = await database.rawQuery('SELECT * FROM User ORDER BY id DESC LIMIT 1');
//     lastID = listOfLastInsertedID.elementAt(0).values.elementAt(0);
//     return lastID;
//   }
//
//   void closeDB() async
//   {
//     // Close the database
//     await database.close();
//   }


  //initialization
  connectToDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      //
    });
  }

  // Determine whether the table exists
  isTableExits(String tableName) async {
    //Built-in table sqlite_master
    var sql ="SELECT * FROM sqlite_master WHERE TYPE = 'table' AND NAME = '$tableName'";
    var res = await database.rawQuery(sql);
    var returnRes = res!=null && res.length > 0;
    return returnRes;
  }

  //Create table
  createTable(String query) async {
    //var sql = 'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type TEXT)';
    var sql = query;
    await database.execute(sql);
  }

  //insert
  insert(String tableName, Map map) async {
    // Determine whether the table exists
    if (await isTableExits(tableName) == true) {
      print('Table exists');
    } else {
      //Create table
      await createTable(tableName);
      print('Create table successfully');
    }
    //var values = {'name':'my_name','type':'my_type'};
    await database.insert(tableName, map);
  }

  //query
  query(String tableName, List list) async {
    //var myColumns = ['name', 'type'];
    var result = await database.query(tableName, columns: list);
    for (var x in result) {
      print(x.keys);
      print(x.values);
    }
  }


  //get records
  Future<List<Map>> getRecords(String query) async
  {
    // Get the records
    list = await database.rawQuery(query);
    print(list);
    return list;
  }

  //delete
  delete(String tableName, List list) async {
    var myWhere = 'name = ?';
    //var myArgs = ['cat'];
    await database.delete(tableName, where: myWhere, whereArgs: list);
  }

  //update
  update(String tableName, Map map) async {
    //var values = {'name':'my_name','type':'my_type'};
    await database.update(tableName, map);
  }

  //shut down
  close () async{
    database?.close();
    database = null;
  }

}