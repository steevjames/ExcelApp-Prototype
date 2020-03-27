import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp_prototype/API/Events/eventsList_Class.dart';
import 'package:flutter/material.dart';

class TestAPI extends StatefulWidget {
  @override
  _TestAPIState createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test API"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: EventsList.fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Event event = snapshot.data[index];
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text(event.id.toString()),
                      Text(event.name),
                      CachedNetworkImage(imageUrl: event.icon),
                      Text(event.category),
                    ],
                  ),
                );
              },
            );
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
