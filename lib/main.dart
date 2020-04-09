import 'package:excelapp_prototype/API/testUI.dart';
import 'package:excelapp_prototype/UI/Profile/profile.dart';
import 'package:flutter/material.dart';
import './UI/Home/home.dart';
import './UI/EventPage/eventPage.dart';
import './UI/Timeline/timeline.dart';
import './UI/Competitions/competitionsScreen.dart';
import 'UI/Favourites/favouritesPage.dart';
// import 'UI/Home/profile.dart';

void main() => runApp(MyApp());

// Import Pages to Navigation/pageNavigator.dart and assign them to tabs

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excel 2020',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: DemoPage(),
      home: TestAPI(),
      routes: {
        // '/': (BuildContext context) => MyHomePage(),
      },
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pages'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 30),
              // Links to pages
              RaisedButton(
                  child: Text('Home Page'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }),
              RaisedButton(
                  child: Text('Timeline'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Timeline()));
                  }),
              RaisedButton(
                  child: Text('Event Page'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventPage()));
                  }),
              RaisedButton(
                  child: Text('Competitions Page'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Competitions()));
                  }),
              RaisedButton(
                  child: Text('Profile Page'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  }),
              RaisedButton(
                  child: Text('Favourites Page'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavouritePage()));
                  }),
              RaisedButton(
                  child: Text('Excel Play'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExcelPlayPage()));
                  }),
            ],
          ),
        ));
  }
}
