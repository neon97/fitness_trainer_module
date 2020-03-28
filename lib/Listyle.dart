import 'package:fitness_training/Medical.dart';
import 'package:fitness_training/list.dart';
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
                  controller: living,
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
                    activity(2, "Moderate (light activity)"),
                    activity(3, "High (heavy labor, very active)"),
                  ],
                ),
                Divider(
                  height: 10.0,
                ),
//work time
                TextFormField(
                  controller: worktime,
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
                Divider(
                  height: 10.0,
                ),

//gym
                TextFormField(
                  controller: gym,
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
                    if (worktime.text.isEmpty ||
                        living.text.isEmpty ||
                        gym.text.isEmpty) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            child: new AlertDialog(
                              backgroundColor: appbar,
                              content: new Text(
                                "You have left fields Empty !!",
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              actions: <Widget>[
                                new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: new Text(
                                      "OK",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                              ],
                            ));
                    } else {
                      lifestyleInformation.insert(0, {
                        "Living": living.text,
                        "Activity": radiovalue.toString(),
                        "WorkTime": worktime.text,
                        "Travel": radiotravel.toString(),
                        "Gym": gym.text
                      });
                      print(lifestyleInformation);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Medical()));
                    }
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
        Radio(value: no, groupValue: radiovalue, onChanged: changeid,activeColor: appbar,),
        texter(text)
      ],
    );
  }
  

  Widget travel(int no, String text) {
    return Row(
      children: <Widget>[
        Radio(value: no, groupValue: radiotravel, onChanged: changeTravelid,activeColor: appbar,),
        texter(text)
      ],
    );
  }

  final worktime = TextEditingController();
  final living = TextEditingController();
  final gym = TextEditingController();
}
