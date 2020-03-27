import 'package:fitness_training/Medical.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Lifestyle extends StatefulWidget {
  @override
  _LifestyleState createState() => _LifestyleState();
}

class _LifestyleState extends State<Lifestyle> {
  //activity
  int radiovalue = 1;
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
      }
    });
  }

  //trvel
  int radiotravel = 1;
  int actTravel;
  void changeTravelid(int value) {
    setState(() {
      radiotravel = value;
      switch (radiotravel) {
        case 1:
          actTravel = radiotravel;
          break;
        case 2:
          actTravel = radiotravel;
          break;
        case 3:
          actTravel = radiotravel;
          break;
        case 4:
          actTravel = radiotravel;
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
        title: Text("Lifestyle Information"),
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
//living
                TextFormField(
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "What do you do for living ?",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),

//activity level
                texter("Activity level at the Job ?"),
                Column(
                  children: <Widget>[
                    activity(1, "none (Seated only)"),
                    activity(2, "Moderate (light activity such as walking)"),
                    activity(3, "High (heavy labor, very active)"),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
//work time
                TextFormField(
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "What is your Work / Office Time ?",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),

//how do you trval
                texter("How often do you travel?"),
                Column(
                  children: <Widget>[
                    travel(1, "Rarely"),
                    travel(2, "A few times a year"),
                    travel(3, "A few times a month"),
                    travel(4, "Weekly"),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),

//excersices
                TextFormField(
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "Are you a Regular GYM member ?",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 60.0,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Medical()));
                  },
                  color: appbar,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget activity(int no, String text) {
    return Row(
      children: <Widget>[
        Radio(value: no, groupValue: radiovalue, onChanged: changeid),
        texter(text)
      ],
    );
  }

  Widget travel(int no, String text) {
    return Row(
      children: <Widget>[
        Radio(value: no, groupValue: radiotravel, onChanged: changeTravelid),
        texter(text)
      ],
    );
  }
}
