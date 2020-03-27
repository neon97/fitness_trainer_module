import 'package:flutter/material.dart';

import 'main.dart';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  //willing
  int radiovalue = 5;
  int actValue;
  void changeid(int value) {
    setState(() {
      radiovalue = value;
      switch (radiovalue) {
        case 1:
          actValue = radiovalue;
          break;
        case 2:
          actValue = radiovalue;
          break;
        case 3:
          actValue = radiovalue;
          break;
        case 4:
          actValue = radiovalue;
          break;
        case 5:
          actValue = radiovalue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text("Goals"),
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                texter("Please rate your readiness for change."),
                Row(
                  children: <Widget>[
                    stress(1, "1", radiovalue, changeid),
                    stress(2, "2", radiovalue, changeid),
                    stress(3, "3", radiovalue, changeid),
                    stress(4, "4", radiovalue, changeid),
                    stress(5, "5", radiovalue, changeid),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget stress(int no, String text, int groupvalue, void changer(int value)) {
    return Row(
      children: <Widget>[
        Radio(value: no, groupValue: groupvalue, onChanged: changer),
        texter(text)
      ],
    );
  }
}
