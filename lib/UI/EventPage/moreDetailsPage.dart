import 'package:excelapp_prototype/UI/EventPage/backgroundImage.dart';
import 'package:excelapp_prototype/UI/EventPage/eventDescription.dart';
import 'package:flutter/material.dart';

String fontBold = 'Quicksand-Bold';
String fontLight = 'Quciksand-Light';

Color primaryColor = Color(0xff252a50);

class MoreDetails extends StatefulWidget {
  final eventDetails;
  MoreDetails({Key key, @required this.eventDetails}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MoreDetailsState(eventDetails);
  }
}

class MoreDetailsState extends State<MoreDetails> {
  var eventDetails;
  MoreDetailsState(this.eventDetails);
  //Stores the current active tab in more details
  String activeTab = 'About';

  //All paddings made as multiples of _minpadding
  double _minpadding = 5.0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: <Widget>[
      // Background Image
      getBackgroundImage(eventDetails, [
        Color.fromRGBO(0, 0, 0, 1),
        Color.fromRGBO(23, 18, 41, 0.8),
        Color.fromRGBO(0, 0, 0, .6)
      ]),

      Container(
          child: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  left: _minpadding * 7, top: deviceHeight * 0.15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Event Name Details
                  Expanded(
                    child: Hero(
                      tag: 'EventName',
                      child: Text(eventDetails['Name'],
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: fontBold,
                              height: 1.0,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                  ),

                  //Like Button
                  Hero(
                    tag: 'LikeButton',

                    //Code to make the button under a Material widget during animation which otherwise throws error
                    flightShuttleBuilder: (BuildContext flightContext,
                            Animation<double> animation,
                            HeroFlightDirection flightDirection,
                            BuildContext fromHeroContext,
                            BuildContext toHeroContext) =>
                        Material(
                            type: MaterialType.transparency,
                            child: toHeroContext.widget),
                    child: Padding(
                      padding: EdgeInsets.all(_minpadding),
                      child: likeButton(eventDetails['isLiked']),
                    ),
                  ),
                ],
              )),

          //EventDetails
          getEventDetails(eventDetails, _minpadding),

          SizedBox(height: _minpadding * 2),

          // More details card
          Container(
            height: deviceHeight * .57,
            padding: EdgeInsets.only(top: _minpadding),
            child: Hero(
              tag: 'Card',
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 4,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(60),
                      child: AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        bottom: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: primaryColor,
                          labelColor: primaryColor,
                          labelStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          tabs: [
                            Tab(
                              text: 'About',
                            ),
                            Tab(
                              text: 'Format',
                            ),
                            Tab(
                              text: 'Rules',
                            ),
                            Tab(
                              text: 'Contacts',
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: Container(
                      color: Colors.white,
                      child: TabBarView(
                        children: [
                          details(eventDetails['About']),
                          details(eventDetails['Format']),
                          details(eventDetails['Rules']),
                          details(eventDetails['Contacts'])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    ]));
  }

  Widget details(txt) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Text(
          txt*3,
          style: TextStyle(color: primaryColor),
        ),
      ),
    );
  }

  Widget likeButton(String isLiked) {
    bool likeState = isLiked == 'true';
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(0x99ffffff), width: 1)),
        child: IconButton(
            iconSize: 32,
            color: Colors.white,
            icon: !likeState
                ? Icon(Icons.favorite_border)
                : Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              //Insert function that enables this event as favourite
              //Over Here
              setState(() {
                likeState = !likeState;
                eventDetails['isLiked'] = '$likeState';
              });
            }));
  }
}
