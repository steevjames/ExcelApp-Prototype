import "package:flutter/material.dart";
import 'listView.dart';

String selection = "All";

var theme = Color.fromRGBO(15, 10, 70, 1);

var compets = [
  {
    "name": "RoboSoccer",
    "time": "11:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://previews.123rf.com/images/alexeitm/alexeitm1806/alexeitm180600002/103288124-classic-football-soccer-ball-on-green-grass-ground-in-front-of-white-goal-with-net.jpg"
  },
  {
    "name": "Algorithms",
    "time": "11:00am",
    "date": "12 Nov",
    "fav": false,
    "image":
        "https://image.shutterstock.com/image-vector/isometric-young-men-standing-near-260nw-1416555089.jpg"
  },
  {
    "name": "Reverse Coding",
    "time": "11:00am",
    "date": "11 Nov",
    "fav": false,
    "image":
        "https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9"
  },
  {
    "name": "CEO",
    "time": "3:00am",
    "date": "12 Nov",
    "fav": false,
    "image":
        "https://www.pngkey.com/png/detail/266-2665205_ceo-ceo-cartoon-png.png"
  },
  {
    "name": "Kryptos",
    "time": "3:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://blog.hightail.com/wp-content/uploads/2014/12/HIT_Encrypt_Cryptex.png"
  },
  {
    "name": "Wave Cloning",
    "time": "11:00am",
    "date": "11 Nov",
    "fav": false,
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZ1kbgQCF2jNIB6MCIqpzl2K5noCi10as_TMdnKhZoZZTIJSpa"
  },
  {
    "name": "Game Zone",
    "time": "3:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://www.reviewgeek.com/thumbcache/0/0/485d85e9482be63846f3b7a006e1ef39/p/uploads/2019/07/4a47a0db-16.png"
  },
  {
    "name": "The Khoj",
    "time": "3:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://bt-wpstatic.freetls.fastly.net/wp-content/blogs.dir/2207/files/2019/11/treasuremap.jpg.png"
  },
];

var tech = [
  {
    "name": "RoboSoccer",
    "time": "11:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://previews.123rf.com/images/alexeitm/alexeitm1806/alexeitm180600002/103288124-classic-football-soccer-ball-on-green-grass-ground-in-front-of-white-goal-with-net.jpg"
  },
  {
    "name": "Algorithms",
    "time": "11:00am",
    "date": "12 Nov",
    "fav": false,
    "image":
        "https://image.shutterstock.com/image-vector/isometric-young-men-standing-near-260nw-1416555089.jpg"
  },
  {
    "name": "Reverse Coding",
    "time": "11:00am",
    "date": "11 Nov",
    "fav": false,
    "image":
        "https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9"
  },
  {
    "name": "Wave Cloning",
    "time": "11:00am",
    "date": "11 Nov",
    "fav": false,
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZ1kbgQCF2jNIB6MCIqpzl2K5noCi10as_TMdnKhZoZZTIJSpa"
  },
];

var non = [
  {
    "name": "CEO",
    "time": "3:00am",
    "date": "12 Nov",
    "fav": false,
    "image":
        "https://www.pngkey.com/png/detail/266-2665205_ceo-ceo-cartoon-png.png"
  },
  {
    "name": "Kryptos",
    "time": "3:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://blog.hightail.com/wp-content/uploads/2014/12/HIT_Encrypt_Cryptex.png"
  },
  {
    "name": "Game Zone",
    "time": "3:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://www.reviewgeek.com/thumbcache/0/0/485d85e9482be63846f3b7a006e1ef39/p/uploads/2019/07/4a47a0db-16.png"
  },
  {
    "name": "The Khoj",
    "time": "3:00am",
    "date": "13 Nov",
    "fav": false,
    "image":
        "https://bt-wpstatic.freetls.fastly.net/wp-content/blogs.dir/2207/files/2019/11/treasuremap.jpg.png"
  },
];

class Competitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Excel",
        home: Scaffold(
            appBar: AppBar(
                elevation: 1,
                title: Row(
                  children: <Widget>[
                    Text("Event List",
                        style: TextStyle(
                            color: theme,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                    Expanded(child: SizedBox()),
                    IconButton(
                        icon: Icon(Icons.search),
                        color: theme,
                        onPressed: () {/*...*/})
                  ],
                ),
                backgroundColor: Colors.white),
            body: Category()));
  }
}

class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Category();
  }
}

class _Category extends State<Category> {
  @override
  Widget build(BuildContext context) {
    if (selection == "All") {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(
                  height: 30,
                  child: FlatButton(
                    padding: EdgeInsets.all(2),
                    color: theme,
                    highlightColor: theme,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onPressed: () {
                      setState(() {
                        selection = "All";
                      });
                    },
                    child: Text("All",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white)),
                  )),
              SizedBox(width: 10),
              SizedBox(
                  height: 30,
                  child: OutlineButton(
                    padding: EdgeInsets.all(2),
                    borderSide: BorderSide(color: theme, width: 1),
                    highlightColor: theme,
                    highlightedBorderColor: theme,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onPressed: () {
                      setState(() {
                        selection = "Tech";
                      });
                    },
                    child: Text("Tech",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: theme)),
                  )),
              SizedBox(width: 10),
              SizedBox(
                  height: 30,
                  child: OutlineButton(
                    padding: EdgeInsets.all(2),
                    borderSide: BorderSide(color: theme, width: 1),
                    highlightColor: theme,
                    highlightedBorderColor: theme,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onPressed: () {
                      setState(() {
                        selection = "Non-Tech";
                      });
                    },
                    child: Text("Non-Tech",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: theme)),
                  ))
            ]),
            SizedBox(height: 10),
            Expanded(child: getListView(compets))
          ]);
    } else if (selection == "Tech") {
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: 30,
              child: OutlineButton(
                padding: EdgeInsets.all(2),
                borderSide: BorderSide(color: theme, width: 1),
                highlightColor: theme,
                highlightedBorderColor: theme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  setState(() {
                    selection = "All";
                  });
                },
                child: Text("All",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: theme)),
              )),
          SizedBox(width: 10),
          SizedBox(
              height: 30,
              child: FlatButton(
                padding: EdgeInsets.all(2),
                color: theme,
                highlightColor: theme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  setState(() {
                    selection = "Tech";
                  });
                },
                child: Text("Tech",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white)),
              )),
          SizedBox(width: 10),
          SizedBox(
              height: 30,
              child: OutlineButton(
                padding: EdgeInsets.all(2),
                borderSide: BorderSide(color: theme, width: 1),
                highlightColor: theme,
                highlightedBorderColor: theme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  setState(() {
                    selection = "Non-Tech";
                  });
                },
                child: Text("Non-Tech",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: theme)),
              ))
        ]),
        SizedBox(height: 10),
        Expanded(child: getListView(tech))
      ]);
    } else {
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: 30,
              child: OutlineButton(
                padding: EdgeInsets.all(2),
                borderSide: BorderSide(color: theme, width: 1),
                highlightColor: theme,
                highlightedBorderColor: theme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  setState(() {
                    selection = "All";
                  });
                },
                child: Text("All",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: theme)),
              )),
          SizedBox(width: 10),
          SizedBox(
              height: 30,
              child: OutlineButton(
                padding: EdgeInsets.all(2),
                borderSide: BorderSide(color: theme, width: 1),
                highlightColor: theme,
                highlightedBorderColor: theme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  setState(() {
                    selection = "Tech";
                  });
                },
                child: Text("Tech",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: theme)),
              )),
          SizedBox(width: 10),
          SizedBox(
              height: 30,
              child: FlatButton(
                padding: EdgeInsets.all(2),
                color: theme,
                highlightColor: theme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  setState(() {
                    selection = "Non-Tech";
                  });
                },
                child: Text("Non-Tech",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white)),
              ))
        ]),
        SizedBox(height: 10),
        Expanded(child: getListView(non))
      ]);
    }
  }
}
