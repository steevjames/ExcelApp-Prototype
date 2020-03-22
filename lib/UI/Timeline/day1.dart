import 'package:flutter/material.dart';

import './event.dart';

class Day1 extends StatelessWidget {
final eventName =['RoboSoccer','Khoj','Reverse Coding','event','name'];
final content =['\nAmphitheatre\n10AM - 4PM','\nAmphitheatre\n10AM - 4PM','\nAmphitheatre\n10AM - 4PM','\nAmphitheatre\n10AM - 4PM','\nAmphitheatre\n10AM - 4PM'];
 

 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(40.0, 15.0, 0, 0),
      child:SingleChildScrollView(
        child:Column(
        children: <Widget>[
        Event(content, eventName,0),
        Event(content, eventName,1),
        Event(content, eventName,2),
        Event(content, eventName,3),
        Event(content, eventName,4),
          
        ],
      ),
      )
    );
  }
}
