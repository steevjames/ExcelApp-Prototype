import 'package:flutter/material.dart';



import './day1.dart';
import './day2.dart';
import './day3.dart';

void main() {
  runApp(Slide());
}

var c=1;
class Slide extends StatefulWidget {
  
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {

  
  void count(int cnt){
    setState(() {
      c=cnt;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(
              top: 37.0,
            ),
            child: Text(
              'Timeline',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.w800),
            ),
          ),
          backgroundColor: Colors.grey[200],
          titleSpacing: 40.0,
          bottom: PreferredSize(
              child: Container(
                child: //Day()
                
                Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 80)),
        ButtonTheme(
          minWidth: 30,
          height: 80,
          child: RaisedButton(
              onPressed: () {
                print(c);
                count(1);
                print(c);
              },
              color: Colors.grey[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              child: RichText(text: TextSpan(
                text:'Day',style:TextStyle(color: Colors.black,fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n 01',
                    
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ]
              ))),
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        ButtonTheme(
          minWidth: 30,
          height: 80,
          child: RaisedButton(
            onPressed: () {
              count(2);
              print(2);
            },
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            child: RichText(text: TextSpan(
                text:'Day',style:TextStyle(color: Colors.black,fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n 02',
                    
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ]
              )),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        ButtonTheme(
          minWidth: 45,
          height: 80,
          child: RaisedButton(
            onPressed: () {
              count(3);
              print(c);
            },
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            child:RichText(text: TextSpan(
                text:'Day',style:TextStyle(color: Colors.black,fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n 03',
                    
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ]
              )),
          ),
        ),
      ],
    ),
                
                
                
                padding: EdgeInsets.only(bottom: 15),
              ),
              preferredSize: Size(10, 115)),
          elevation: 0.0,
         
        ),
        body: c==1?Day1(): c==2?Day2():Day3(),
        
      ),
    );
  }
}
