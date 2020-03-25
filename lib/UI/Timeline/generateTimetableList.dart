import 'dart:math';

import 'package:excelapp_prototype/UI/Home/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TimeTableList extends StatelessWidget {
  final List<Map<String, String>> eventDetails;
  List<Widget> eventList;
  TimeTableList(this.eventDetails);
  GlobalKey _listKey = GlobalKey();
  Size listSize;

  @override
  Widget build(BuildContext context) {
    addEventToList();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(36, 15.0, 0, 0),
      child: SingleChildScrollView(
        key: _listKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[] + eventList,
        ),
      ),
    );
  }

  addEventToList() {
    eventList = List<Widget>();
    for (var i = 0; i < eventDetails.length; i++) {
      eventList.add(
        Event(eventDetails[i]['content'], eventDetails[i]['name'],
            eventDetails[i]['image']),
      );
    }
  }
}

class Event extends StatefulWidget {
  final String _eventName;
  final String _content;
  final String _imgurl;

  Event(this._content, this._eventName, this._imgurl);
  @override
  EventState createState() =>
      EventState(this._content, this._eventName, this._imgurl);
}

class EventState extends State<Event> {
  final String _eventName;
  final String _content;
  final String _imgurl;

  double circleDiameter = 12;
  double circleTopMargin = 40;

  Size cardSize;
  GlobalKey _cardKey = GlobalKey();

  EventState(this._content, this._eventName, this._imgurl);

  //   @override
  // void initState() {
  //   //getting total height of e widget
  //   super.initState();
  //   SchedulerBinding.instance.addPostFrameCallback((_)=> getSize());
  // }

  // getSize() {
  //   setState(() {
  //     final RenderBox _listBox = _cardKey.currentContext.findRenderObject();
  //   cardSize = _listBox.size;
  //   circleTopMargin = cardSize.height / 2 - circleDiameter / pi;
  //   });

  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(50, 0, 0, 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.zero,
              ),
              color: Colors.deepPurpleAccent[400],
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: NetworkImage(_imgurl), fit: BoxFit.cover)),
          child: Container(
              padding: EdgeInsets.fromLTRB(30, 24, 0, 24),
              decoration: BoxDecoration(
                color: Color(0xee282849),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.zero,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    _eventName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: pfontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _content,
                    style: TextStyle(
                        fontFamily: sfontFamily,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
        ),
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              margin: EdgeInsets.only(top: circleTopMargin),
              height: circleDiameter,
              width: circleDiameter,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(30)),
            )),
      ],
    );
  }
}
