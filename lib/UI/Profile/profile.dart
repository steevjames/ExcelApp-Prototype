import 'package:cached_network_image/cached_network_image.dart';
import 'registeredPage.dart';
import 'package:flutter/material.dart';
import '../Home/Utils/constants.dart';
import '../Home/Utils/models.dart';
import '../Home/Utils/data.dart';
import 'editProfile.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<ProfilePage> {
  var bgColor = Colors.grey[200];
  double imageHeight = 160;
  var headingStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: pfontFamily,
      fontSize: 22.0,
      color: primaryColor);
  var nameStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: pfontFamily,
      fontSize: 24.0,
      color: primaryColor);
  var buttonTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: pfontFamily,
      fontWeight: FontWeight.w600);

  Person user = Person();
  @override
  void initState() {
    super.initState();
    user = Person.fromMapObject(userMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: bgColor,
      body: ListView(
        children: <Widget>[
          detailCard(),
          updateCard(),
          registeredCard(),
          logoutCard()
        ],
      ),
    );
  }

  detailCard() {
    return Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Card(
            color: Colors.white,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                profilePic(user.imageUrl),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(user.name, style: nameStyle),
                ),
                Card(
                  color: primaryColor,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: FlatButton(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Text("SHOW QR CODE", style: buttonTextStyle)),
                    onPressed: () {
                      qrDialog(context);
                    },
                  ),
                )
              ],
            )));
  }

  qrDialog(BuildContext context) {
    return showDialog(
        context: context,
        child: Center(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            child: Container(
              margin: EdgeInsets.all(24),
              width: imageHeight*1.6,
              height: imageHeight*1.6,
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor, width: 6),
              ),
              padding: EdgeInsets.all(4),
              child: CachedNetworkImage(
                imageUrl: user.qrUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        ));
  }

  updateCard() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 16, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Update Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: pfontFamily,
                      fontSize: 18.0,
                      color: primaryColor)),
              Icon(
                Icons.arrow_forward_ios,
                size: 22,
                color: primaryColor,
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfilePage()));
        },
      ),
    );
  }

  registeredCard() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 16, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Registered Events",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: pfontFamily,
                      fontSize: 18.0,
                      color: primaryColor)),
              Icon(
                Icons.arrow_forward_ios,
                size: 22,
                color: primaryColor,
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisteredPage()));
        },
      ),
    );
  }

  logoutCard() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 16, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Log Out",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: pfontFamily,
                      fontSize: 18.0,
                      color: primaryColor)),
              Icon(
                Icons.arrow_forward_ios,
                size: 22,
                color: primaryColor,
              )
            ],
          ),
        ),
        onPressed: () {
         
        },
      ),
    );
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
      title: new Text('Profile', style: headingStyle),
    );
  }

  profilePic(String url) {
    return Container(
      width: imageHeight,
      height: imageHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primaryColor, width: 6),
      ),
      padding: EdgeInsets.all(4),
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
