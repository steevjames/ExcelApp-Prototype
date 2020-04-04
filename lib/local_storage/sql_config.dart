import 'dart:async';
import 'package:excelapp_prototype/API/Events/eventsList_Class.dart';
import 'package:excelapp_prototype/API/eventDetails/eventDetails.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  factory DBProvider() {
    return db;  
  }

  Database _database;

  //if our database exist in mobile, use it otherwise create it (creation done once)
  Future<Database> get database async {
    if(_database != null)
      return _database;
    
    // creating our database(done once)
    _database = await initDB();
    return _database;
  }

  initDB() async {
    // android SQLite path
    String databasePath = await getDatabasesPath();
    // Our database path
    String path = join(databasePath, 'TestlastDB.db');

    // once database is created, we define our tables inside it
    return await openDatabase(path,version: 1,onOpen: (db){},
    onCreate: (Database db,int version) async {
    await db.execute("CREATE TABLE EventList ("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      "icon TEXT,"
      "category TEXT" 
      ")");
    await db.execute("CREATE TABLE EventsDetails("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      "category TEXT,"
      "venue TEXT,"
      "prize_money TEXT,"
      "date_time TEXT,"
      "about TEXT,"
      "format TEXT,"
      "rules TEXT"
      ")");
    });
  }

  void dispose() async {
    final db = await database;
    db.close();
  }

  // add event to database
  addEvent(Event event) async {
    final db = await database;
    await db.insert('EventList', event.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // add list of events from api call to database
  addAllEvents(List<Event> events) async {
    final db = await database;
    Batch batch = db.batch();
    for(var event in events)
    {
      batch.insert('EventList', event.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }


  // get list of all events from database
  Future<List<Event>> getEvents(String table) async {
    final db = await database;

    // all the rows from table -- list of maps
    final List<Map<String,dynamic>> res = await db.query(table);
    return res.map<Event>((row) => Event.fromJson(row)).toList();
  }

  //delete an event from table
  Future<void> removeEvent(int id) async {
    final db = await database;
    await db.delete('EventList',where: 'id = ?',whereArgs: [id]);
  }

  // add single event to database
  addSingleRecord(EventDetails eventDetails,String table) async {
    final db = await database;
    await db.insert(table, eventDetails.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // retrieve single event from database
  Future<EventDetails> getEventDetails(String table,int id) async {
    final db = await database;
    List<Map<String,dynamic>> res = await db.query(table,where: 'id = ?',whereArgs: [id]);
    Map<String,dynamic> event = res[0];
    EventDetails eventDetails = EventDetails.fromJson(event);
    return eventDetails;
  }

}