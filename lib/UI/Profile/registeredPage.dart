import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../constants.dart';
import '../Home/Utils/data.dart';
import '../Home/Utils/models.dart';

class RegisteredPage extends StatefulWidget {
  @override
  RegisteredPageState createState() => RegisteredPageState();
}

class RegisteredPageState extends State<RegisteredPage> {
  var favEvents;
  var isLiked;

  final double cardHeight = 160;
  final double cardRoundness = 24;
  var headingStyle = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.w600,
    fontFamily: pfontFamily,
    fontSize: 22.0,
  );
  final titleStyle = TextStyle(
      color: Colors.white,
      fontFamily: pfontFamily,
      fontSize: 26,
      fontWeight: FontWeight.w600);
  final contentStyle = TextStyle(
      color: Colors.white,
      fontFamily: sfontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w500);

  @override
  void initState() {
    super.initState();
    favEvents = List<Event>();
    for (int i = 0; i < highLightsMap.length; i++) {
      favEvents.add(Event.fromMapObject(highLightsMap[i]));
    }
    print("Favourite: ${favEvents.length}");
    favListBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[] +
                      favListBuilder()
                ),
          ),
            ),
        );
  }

  extraRoundcess(bool istop) {
    return Container(
        padding: istop ? EdgeInsets.only(top: 16) : EdgeInsets.only(bottom: 16),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: istop
                  ? BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
        ));
  }

  customAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 22,
        color: primaryColor,
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text(
        'Registered',
        style: headingStyle,
      ),
    );
  }

  favListBuilder() {
    var favListWidget = List<Widget>();
    for (int i = 0; i < favEvents.length; i++) {
      favListWidget.add(GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          height: cardHeight,
          child: Card(
              margin: EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cardRoundness)),
              child: Stack(
                children: <Widget>[
                  cardImage(favEvents[i].imageUrl),
                  highLightCardContent(favEvents[i], i)
                ],
              )),
        ),
        onTap: () {
          //Insert Function
          print("U tapped ${favEvents[i].eventName}");
        },
      ));
    }

    return favListWidget;
  }

  highLightCardContent(Event event, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                event.eventName,
                style: titleStyle,
              ),
              Text("${event.date} | ${event.time}", style: contentStyle)
            ],
          ),
        ],
      ),
    );
  }

  cardImage(String url) {
    var gradientcolor1 = Color(0xf224234A);
    var gradientcolor2 = Color(0xb324234A);
    var roundness = BorderRadius.circular(16);
    return Stack(children: <Widget>[
      CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              borderRadius: roundness,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        ),
      ),

      //gradient overlay
      Container(
        decoration: BoxDecoration(
            borderRadius: roundness,
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [gradientcolor1, gradientcolor2],
              stops: [0.0, 1.0],
            )),
      )
    ]);
  }
}
