import 'package:fitness_training/list.dart';
import 'package:flutter/material.dart';
import 'guideliness.dart';
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

  //goals
  int radiogoals = 5;
  int actgoals;
  void changeidGoals(int value) {
    setState(() {
      radiogoals = value;
      switch (radiogoals) {
        case 1:
          actgoals = radiogoals;
          break;
        case 2:
          actgoals = radiogoals;
          break;
        case 3:
          actgoals = radiogoals;
          break;
        case 4:
          actgoals = radiogoals;
          break;
        case 5:
          actgoals = radiogoals;
          break;
      }
    });
  }

  //achieve
  int radioach = 1;
  int actach;
  void changeidAch(int value) {
    setState(() {
      radioach = value;
      switch (radioach) {
        case 1:
          actach = radioach;
          break;
        case 2:
          actach = radioach;
          break;
        case 3:
          actach = radioach;
          break;
        case 4:
          actach = radioach;
          break;
        case 5:
          actach = radioach;
          break;
        case 6:
          actach = radioach;
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
//rating
                texter("Please rate your readiness for change."),
                Row(
                  children: <Widget>[
                    stress(1, "1", radiovalue, changeid),
                    stress(2, "2", radiovalue, changeid),
                    stress(3, "3", radiovalue, changeid),
                    stress(4, "4", radiovalue, changeid),
                    stress(5, "5", radiovalue, changeid),
                  ],
                ),
                Divider(
                  height: 10.0,
                ),

//goal fit
                texter(
                    "What following goals does best fit in with your goals?"),
                Column(
                  children: <Widget>[
                    stress(1, "Improved health", radiogoals, changeidGoals),
                    stress(2, "Improved endurance", radiogoals, changeidGoals),
                    stress(3, "Increased strength", radiogoals, changeidGoals),
                    stress(
                        4, "Increased muscle mass", radiogoals, changeidGoals),
                    stress(5, "Fat loss", radiogoals, changeidGoals),
                  ],
                ),
                Divider(
                  height: 10.0,
                ),

//gol training
                TextFormField(
                  controller: goalTrainig,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "What is your goal with your training?",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),

//timeine
                texter("Timeline for achieving your goal."),
                Column(
                  children: <Widget>[
                    stress(1, "8 WKS", radioach, changeidAch),
                    stress(2, "16 WKS", radioach, changeidAch),
                    stress(3, "24 WKS", radioach, changeidAch),
                    stress(4, "32 WKS", radioach, changeidAch),
                    stress(5, "40 WKS", radioach, changeidAch),
                    stress(6, "1 YEAR", radioach, changeidAch),
                  ],
                ),
                Divider(
                  height: 10.0,
                ),

//reach the goal
                TextFormField(
                  controller: expectations,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "Your Expectations with Personal Trainer?",
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
                    if (goalTrainig.text.isEmpty || expectations.text.isEmpty) {
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
                      goals.insert(0, {
                        "Rate": radiovalue.toString(),
                        "Goals": radiogoals.toString(),
                        "Traning": goalTrainig.text,
                        "Achieve": radioach.toString(),
                        "Expectations": expectations.text
                      });
                      print(goals);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Guideliness()));
                    }
                  },
                  color: appbar,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
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
        Radio(value: no, groupValue: groupvalue, onChanged: changer,activeColor: appbar,),
        texter(text)
      ],
    );
  }

  final goalTrainig = TextEditingController();
  final expectations = TextEditingController();
}
