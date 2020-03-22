import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  int count = 0;
  final List<String> _eventName;
  final List<String> _content;
  Event(this._content, this._eventName, this.count);
  @override
  Widget build(BuildContext context) {
    return Container(width: 650.0,
      margin: EdgeInsets.fromLTRB(30, 10, 0, 20),
      padding: EdgeInsets.fromLTRB(20, 30, 0, 20),
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
              image: AssetImage('./images/roboSoccer.jpg'),
              fit: BoxFit.cover)),
      child: RichText(
        text: TextSpan(
          text: (_eventName[count]),
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: _content[count],
                style: TextStyle(color: Colors.white, fontSize: 14,fontWeight:FontWeight.normal )),
          ],
        ),
      ),
    );
  }
}