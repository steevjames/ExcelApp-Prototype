import '../Home/Utils/data.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Home/Utils/models.dart';

class EditProfilePage extends StatefulWidget {
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfilePage> {
  var bgColor = Colors.grey[200];
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  Person user = Person();
  double imageHeight = 150;

  TextEditingController nameController,
      emailController,
      phoneController,
      iidController,
      inameController;
  final _formKey = GlobalKey<FormState>();
  int _radioValue1;

  @override
  void initState() {
    super.initState();
    user = Person.fromMapObject(userMap);
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone);
    iidController = TextEditingController(text: "${user.institutionId}");
    inameController = TextEditingController(text: user.institutionName);
    if (user.isCollege)
      _radioValue1 = 0;
    else
      _radioValue1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: Container(
          color: bgColor,
          child: Card(
            margin: EdgeInsets.all(12),
            elevation: 0,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          height: 250.0,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: profilePic(user.imageUrl)),
                      new Container(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 40.0, right: 40.0, top: 0),
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text(
                                        'Info',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: pfontFamily,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      _status
                                          ? _getEditIcon()
                                          : new Container(),
                                    ],
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Form(
                                key: _formKey,
                                child: textFields(),
                              ),
                              !_status
                                  ? FlatButton(
                                      color: primaryColor,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 32, vertical: 16),
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: sfontFamily),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _status = true;
                                          });

                                          /*
                                      Function to update data
                                    */
                                        }
                                      },
                                    )
                                  : Container(width: 0, height: 0)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
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
      title: new Text('Update Profile',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: pfontFamily,
              fontSize: 22.0,
              color: primaryColor)),
    );
  }

  profilePic(String url) {
    return Container(
      width: imageHeight,
      height: imageHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primaryColor, width: 6),
        image: new DecorationImage(
          image: new NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 24.0,
            child: new Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          )),
    );
  }

  divider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: 1,
      height: imageHeight,
      color: Colors.grey[300],
    );
  }

  qrCode(String url) {
    return Container(
      width: imageHeight,
      height: imageHeight,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 4),
        image: new DecorationImage(
            image: new NetworkImage(url), fit: BoxFit.contain),
      ),
    );
  }

  textFields() {
    const enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(width: 1, color: primaryColor),
    );
    const border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(20.0),
      ),
    );

    const validatorMessage = 'This field should not be empty';

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (val) => val.isEmpty ? validatorMessage : null,
            onChanged: (val) {
              setState(() => user.name = val);
            },
            controller: nameController,
            decoration: const InputDecoration(
              enabledBorder: enabledBorder,
              border: border,
              labelText: "Name",
              labelStyle: TextStyle(fontFamily: sfontFamily),
            ),
            enabled: false,
            autofocus: false,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            validator: (val) => val.isEmpty ? validatorMessage : null,
            onChanged: (val) {
              setState(() => user.email = val);
            },
            controller: emailController,
            decoration: const InputDecoration(
              enabledBorder: enabledBorder,
              border: border,
              labelText: "Email",
              labelStyle: TextStyle(fontFamily: sfontFamily),
            ),
            enabled: false,
            autofocus: false,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            validator: (val) => val.isEmpty ? validatorMessage : null,
            onChanged: (val) {
              setState(() => user.phone = val);
            },
            controller: phoneController,
            decoration: const InputDecoration(
              enabledBorder: enabledBorder,
              border: border,
              labelText: "Phone Number",
              labelStyle: TextStyle(fontFamily: sfontFamily),
            ),
            enabled: !_status,
            autofocus: !_status,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            validator: (val) => val.isEmpty ? validatorMessage : null,
            onChanged: (val) {
              setState(() => user.name = val);
            },
            controller: iidController,
            decoration: const InputDecoration(
              enabledBorder: enabledBorder,
              border: border,
              labelText: "Institution ID",
              labelStyle: TextStyle(fontFamily: sfontFamily),
            ),
            enabled: !_status,
            autofocus: !_status,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            validator: (val) => val.isEmpty ? validatorMessage : null,
            onChanged: (val) {
              setState(() => user.email = val);
            },
            controller: inameController,
            decoration: const InputDecoration(
              enabledBorder: enabledBorder,
              border: border,
              labelText: "Instituition Name",
              labelStyle: TextStyle(fontFamily: sfontFamily),
            ),
            enabled: !_status,
            autofocus: !_status,
          ),
          Padding(padding: EdgeInsets.all(16)),
          Text("Are you studying in College",
              style: TextStyle(fontSize: 14, fontFamily: pfontFamily)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioValue1,
                activeColor: !_status ? primaryColor : Colors.grey[400],
                onChanged: (value) => _handleRadioValueChange(value),
              ),
              Text("True",
                  style: TextStyle(
                      color: !_status ? primaryColor : Colors.grey[400],
                      fontFamily: pfontFamily)),
              Radio(
                value: 1,
                groupValue: _radioValue1,
                activeColor: !_status ? primaryColor : Colors.grey[400],
                onChanged: (value) => _handleRadioValueChange(value),
              ),
              Text("False",
                  style: TextStyle(
                      color: !_status ? primaryColor : Colors.grey[400],
                      fontFamily: pfontFamily)),
            ],
          ),
        ],
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      if (!_status) {
        _radioValue1 = value;
      }
    });
  }

  _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: primaryColor,
        radius: 18.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
