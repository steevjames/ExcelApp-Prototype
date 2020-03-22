import 'package:flutter/material.dart';

class TimeTableList extends StatelessWidget {
  final List<Map<String, String>> eventDetails;
  TimeTableList(this.eventDetails);

  @override
  Widget build(BuildContext context) {
    List<Widget> eventList = [];
    for (var i = 0; i < eventDetails.length; i++) {
      eventList.add(
        Event(eventDetails[i]['content'], eventDetails[i]['name'], eventDetails[i]['image']),
      );
    }
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(40.0, 15.0, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[] + eventList,
          ),
        ));
  }
}

class Event extends StatelessWidget {
  final String _eventName;
  final String _content;
  final String _imgurl;
  Event(this._content, this._eventName, this._imgurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 0, 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.zero,
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.zero,
            ),
            color: Colors.deepPurpleAccent[400],
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: NetworkImage(_imgurl),
                fit: BoxFit.cover)),
        child: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
            decoration: BoxDecoration(
              color: Color(0xee282849),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.zero,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  _eventName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  _content,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ],
            )),
      ),
    );
  }
}
