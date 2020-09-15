import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:path/path.dart';
import '../models/child.dart';

class DBHelper {
  static Database _db;

  // tables fields
  static const String ID = 'id';
  static const String AGE = 'age';
  static const String MONTH = 'month';
  static const String CHILD = 'child';

  static const String TABLE = 'Child';
  static const String DB_NAME = 'Nchild1.db'; // must .db extension

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $AGE TEXT,$MONTH TEXT, $CHILD TEXT)");
    Batch batch = db.batch();
    String childjson = await rootBundle.loadString('assets/childs.json');
    List childList = json.decode(childjson);
    childList.forEach((val) {
      Child child = Child.fromMap(val);
      batch.insert(TABLE, child.toMap());
    });
    batch.commit();
  }

  Future<Child> save(Child child) async {
    var dbClient = await db;
    child.id = await dbClient.insert(TABLE, child.toMap());
    print(child.id);
    return child;
  }

  Future<List<Child>> getChilds() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query(TABLE, columns: [ID, AGE, MONTH, CHILD]);
    final List<Child> childs = [];

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        childs.add(Child.fromMap(maps[i]));
      }
    }
    return childs;
  }

//  Future<List<Child>> listChild(String mage, String mchild) async {
  Future<List<Child>> listChild(String mage) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.rawQuery("SELECT * FROM $TABLE where $AGE=$mage  ");
    // List<Map> maps = await dbClient
    //     .rawQuery("SELECT * FROM $TABLE where $AGE=$mage AND $CHILD=$mchild ");
    // List<Map> maps = await dbClient.rawQuery(
    //     "SELECT * FROM $TABLE where $AGE='" +
    //         mage +
    //         "' AND $CHILD='" +
    //         mchild +
    //         "' ");

    final List<Child> childs = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        childs.add(Child.fromMap(maps[i]));
      }
    }
    return childs;
  }
  // Future<int> delete(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  // }

  // Future<int> update(Task task) async {
  //   var dbClient = await db;
  //   return await dbClient
  //       .update(TABLE, task.toMap(), where: '$ID = ?', whereArgs: [task.id]);
  // }

  // Future close() async {
  //   var dbClient = await db;
  //   dbClient.close();
  // }

  // Future<int> countInCompleted() async {
  //   var dbClient = await db;
  //   int val = 0;
  //   var count = await dbClient
  //       .rawQuery("SELECT COUNT(*) FROM $TABLE WHERE $ISCOMPLETED = $val");
  //   return Sqflite.firstIntValue(count);
  // }

  // Future<int> totalTasks() async {
  //   var dbClient = await db;
  //   var count = await dbClient.rawQuery("SELECT COUNT(*) FROM $TABLE");
  //   print(count);
  //   return Sqflite.firstIntValue(count);
  // }
}
