import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:excelidkwhichpage/Navbar.dart';

//import 'package:neumorphic/neumorphic.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyHomePage extends StatefulWidget {
  static final String id = 'My_home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _clr1 = Colors.white;
  var _clr2 = Colors.white;
  var _clr3 = Colors.white;
  var _clr4 = Colors.white;
  var _fontclr1 = Colors.black;
  var _fontclr2 = Colors.black;
  var _fontclr3 = Colors.black;
  var _fontclr4 = Colors.black;
  var _selected;
  var _selected1 = false;
  var _selected2 = false;
  var _selected3 = false;
  var _selected4 = false;

void selected()
{
  if(_selected1 == true)
    {
      _clr1 = Color(0xFF00008B);
      _fontclr1 = Colors.white;
    }
  else if(_selected2 == true)
    {
      _clr2 = Color(0xFF00008B);
      _fontclr2 = Colors.white;
    }
  else if(_selected3 == true)
  {
    _clr3 = Color(0xFF00008B);
    _fontclr3 = Colors.white;
  }
  else
    {
      _clr4 = Color(0xFF00008B);
      _fontclr4 = Colors.white;
    }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text(
            'Question 05',
            style: TextStyle(
              color: Color(0xFF00008B),
            ),
          ),
          iconTheme: new IconThemeData(color: Color(0xFF00008B)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1484347727553-f0643c73b62d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                    fit: BoxFit.fill,
                    height: 150.0,
                    width: 250.0,
                  ),
                ),
              ),
              Text(
                'IDENTIFY THIS VIRUS WHICH SHOOK \n THE ENTIRE WORLD IN 2020',
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                    child: NeumorphicButton(
                      onClick: () {
                        setState(() {
                          _selected1 = true;
                          selected();
                        });
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          depth: 3,
                          intensity: 1.5,
                          surfaceIntensity: 0.1,
                          oppositeShadowLightSource: false,
                          lightSource: LightSource.topLeft,
                          color: _clr1),
                      child: Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 2, right: 120),
                        child: Text(
                          'A.    Coronavirus',
                          style: TextStyle(color: _fontclr1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                    child: NeumorphicButton(
                      onClick: () {
                        setState(() {
                          _selected2 = true;
                          selected();
                        });
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          depth: 3,
                          intensity: 1.5,
                          surfaceIntensity: 0.1,
                          oppositeShadowLightSource: false,
                          lightSource: LightSource.topLeft,
                          color: _clr2),
                      child: Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 2, right: 120),
                        child: Text(
                          'B.    Coronavirus',
                          style: TextStyle(color: _fontclr2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                    child: NeumorphicButton(
                      onClick: () {
                        setState(() {
                          _selected3 = true;
                          selected();
                        });
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          depth: 3,
                          intensity: 1.5,
                          surfaceIntensity: 0.1,
                          oppositeShadowLightSource: false,
                          lightSource: LightSource.topLeft,
                          color: _clr3),
                      child: Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 2, right: 120),
                        child: Text(
                          'C.    Coronavirus',
                          style: TextStyle(color: _fontclr3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                    child: NeumorphicButton(
                      onClick: () {
                        setState(() {
                          _selected4 = true;
                          selected();
                        });
                      },
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          depth: 3,
                          intensity: 1.5,
                          surfaceIntensity: 0.1,
                          oppositeShadowLightSource: false,
                          lightSource: LightSource.topLeft,
                          color: _clr4),
                      child: Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 2, right: 120),
                        child: Text(
                          'D.    Coronavirus',
                          style: TextStyle(color: _fontclr4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){print('prev');},
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xFF00008B))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_back, size: 15),
                          ),
                          Text('Previous'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){print('next');},
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF00002E),
                          border: Border.all(color: Color(0xFF00008B))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:  EdgeInsets.only(left:25.0,right: 8.0),
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
