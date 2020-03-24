import 'package:flutter/material.dart';

double cardHeight=95;
double imgCardWidth =275;
double sideCardWidth=75;
var theme=Color.fromRGBO(15,10,70,1);

cardImage(String url) {
    var gradientcolor1 = theme;// Color(0xe61f1a59);
  var gradientcolor2 = theme;
  // var gradientcolor1 = Color(0xe61f1a59);
  // var gradientcolor2 = Color(0x801f1a59);
  var roundness = BorderRadius.circular(16);
  return Stack(children: <Widget>[    
    Opacity(opacity: 1,
    child: Container(
      //width:imgCardWidth,
      height: cardHeight,decoration: new BoxDecoration(
        image: new DecorationImage(fit: BoxFit.cover,
        image: new NetworkImage(url),
      ),
      borderRadius: new BorderRadius.all(const  Radius.circular(20.0),)
    ))),
    //gradient overlay
    Opacity(opacity: 0.78,
    child:
    Container(
      //width: imgCardWidth,
      height:cardHeight,
      decoration: BoxDecoration(
          borderRadius: roundness,
          gradient: LinearGradient(
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            colors: [gradientcolor1, gradientcolor2],
            stops: [0.0, 1.0],
          )),
    )
  )
  ]);
}

sideCard() {
  var gradientcolor1 = Colors.grey;
  var gradientcolor2 = gradientcolor1;
  var roundness = BorderRadius.circular(16);
  return Stack(children: <Widget>[    
    Opacity(
      opacity: 0.19,
      child: 
    Container(
      width: sideCardWidth,height:cardHeight,
      decoration: BoxDecoration(
          borderRadius: roundness,
          gradient: LinearGradient(
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            colors: [gradientcolor1, gradientcolor2],
            stops: [0.0, 1.0],
          )),
    ))
  ]);
}
