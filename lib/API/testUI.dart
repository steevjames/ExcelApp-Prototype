// import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:excelapp_prototype/API/Events/eventsList_Class.dart';
import 'package:excelapp_prototype/API/eventDetails/eventDetails.dart';
import 'package:flutter/material.dart';
import '../local_storage/sql_config.dart';

class TestAPI extends StatefulWidget {
  @override
  _TestAPIState createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
  DBProvider db;
  bool isOnline;

  @override
  void initState() {
    super.initState();
    db = DBProvider();
  }

  @override
  void dispose() {
    db.dispose();
    super.dispose();
  }

  Future<List<Event>> testFunction() async {
    print("Fetching");
    List<Event> test = await EventsList.fetchEvents();
    print("Fetched from Internet\n");

    // add all events to database
    print("adding events to database");
    await db.addAllEvents(test);
    print("added to database");

    List<Event> result = await db.getEvents('EventList');
    print("from database");
    print(result.length);
    // return result;
    return result;
  }

  Future<EventDetails> detailsTestFunction() async {
    // check net connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // fetch from internet & update db
      print("Online");
      print("fetching");
      EventDetails eventDetails =
          await EventDetailsAPI.fetchEventDetails('events/1');
      print("Fetched from Internet");
      print("update database");
      await db.addSingleRecord(eventDetails, 'EventsDetails');
      print("added to database");
      return eventDetails;
    } else {
      print("Offline");
      print("fetching from db");
      EventDetails result = await db.getEventDetails('EventsDetails', 1);
      print("done");
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test API"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        // future: EventDetailsAPI.fetchEventDetails('events/1'),
        future: detailsTestFunction(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data);
            EventDetails eventDetails = snapshot.data;
            List<Map<String, String>> contacts = [];
            if (eventDetails.contacts != null) {
              eventDetails.contacts.forEach((c) {
                contacts.add(Map<String, String>.from(c));
              });
            } else {
              print(contacts);
              Map<String, String> m = {
                "name": "Net on cheyy mwonuse",
                "responsibility": "test",
                "phone_number": "test",
                "email": "test",
              };
              contacts.add(m);
              // print(contacts[0]);
            }
            return Column(
              children: <Widget>[
                Text(eventDetails.id.toString()),
                Text(eventDetails.name),
                Text(eventDetails.dateTime),
                Text(eventDetails.venue),
                Text(eventDetails.prize),
                Text("\n" + eventDetails.about),
                Text("\n" + eventDetails.format),
                Text("\n\n" + contacts[0]['name']),
                Text(contacts[0]['phone_number']),
              ],
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
