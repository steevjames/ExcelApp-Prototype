import 'package:flutter/material.dart';
import 'package:excelidkwhichpage/MyHomePage.dart';
import 'questions.dart';
import 'questionHelper.dart';

class NavDrawer extends StatelessWidget {
  static final String id = 'Nav_bar';

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
                      Padding(
            padding: const EdgeInsets.only(right: 228.0, top: 18, bottom: 8),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 130.0, bottom: 10, top: 15),
            child: Text(
              'QUESTIONS',
              style: TextStyle(fontSize: 25),
            ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  questionsHelper.question.length,
                  (index) {
                    return Padding(
                      padding:  EdgeInsets.only(left:8.0,bottom: 8),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF041F30),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              (index+1).toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  questionsHelper.question.length,
                  (index) {
                    return Padding(
                      padding:  EdgeInsets.only(top:8,bottom: 20),
                      child: Text(
                        questionsHelper.question[index].toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
            ),
      ],
    ),
    Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(
                margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'End Test',
                  style: TextStyle(color: Colors.red),
                )),
              )),
          ],
        ));
  }
}