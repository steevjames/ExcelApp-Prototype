import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp_prototype/API/Events/eventsList_Class.dart';
import 'package:excelapp_prototype/API/eventDetails/eventDetails.dart';
import 'package:flutter/material.dart';
import '../local_storage/sql_config.dart';

class TestAPI extends StatefulWidget {
  @override
  _TestAPIState createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
  final db = DBProvider();

  Future<List<Event>> testFunction() async {
    print("Fetching");
    List<Event> test = await EventsList.fetchEvents();
    print("Fetched from Internet\n");
    
    // add all events to database
    print("adding events to database");
    await db.addAllEvents(test);
    print("added to database");
   
    List<Event> result = await db.getEvents();
    print("from database");
    print(result.length);
    // return result;
    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test API"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: EventDetailsAPI.fetchEventDetails('events/1'),
        builder: (context, snapshot) {
          if (snapshot.hasData)
          {
            // print(snapshot.data);
            EventDetails eventDetails = snapshot.data;
            print(eventDetails.contacts[0].runtimeType);
            List<Map<String,String>> contacts = List<Map<String,String>>();
            eventDetails.contacts.forEach((c) {
              contacts.add(Map<String,String>.from(c));
            });
            return Column(
              children: <Widget>[
                Text(eventDetails.id.toString()),
                Text(eventDetails.name),
                Text(eventDetails.dateTime),
                Text(eventDetails.venue),
                Text(eventDetails.prize),
                Text("\n"+eventDetails.about),
                // Text("\n"+eventDetails.format),
                Text("\n\n"+ contacts[0]['name']),
                Text(contacts[0]['phone_number']),
              ],
            );
          }
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
