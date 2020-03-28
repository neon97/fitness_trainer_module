import 'package:fitness_training/goals.dart';
import 'package:fitness_training/list.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Medical extends StatefulWidget {
  @override
  _MedicalState createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
  //stress
  int radiovalue = 2;
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
      }
    });
  }

  //disease
  int radiodisease = 2;
  int actdisease;
  void changeiddisease(int value) {
    setState(() {
      radiodisease = value;
      switch (radiodisease) {
        case 1:
          actdisease = radiodisease;
          break;
        case 2:
          actdisease = radiodisease;
          break;
      }
    });
  }

  //ciggrate
  int radiocig = 2;
  int actcig;
  void changeCig(int value) {
    setState(() {
      radiocig = value;
      switch (radiocig) {
        case 1:
          actcig = radiocig;
          break;
        case 2:
          actcig = radiocig;
          break;
      }
    });
  }

  //diet
  int radiodiet = 4;
  int actdiet;
  void changeDiet(int value) {
    setState(() {
      radiodiet = value;
      switch (radiodiet) {
        case 1:
          actdiet = radiodiet;
          break;
        case 2:
          actdiet = radiodiet;
          break;
        case 3:
          actdiet = radiodiet;
          break;
        case 4:
          actdiet = radiodiet;
          break;
        case 5:
          actdiet = radiodiet;
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
        title: Text("Medical Information"),
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
//health problems
                TextFormField(
                  controller: health,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "If you have any health problems list them",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),

//medications
                TextFormField(
                  controller: medications,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText:
                          "If you are on any medications, please list them",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),

//therapies
                TextFormField(
                  controller: therapies,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "If Undergone any therapies, List them",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),

//injuries
                TextFormField(
                  controller: injuries,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: "Any Injuries, List them",
                      labelStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),

//stress
                texter("Are you experiencing any stresses problem"),
                Row(
                  children: <Widget>[
                    stress(1, "Yes", radiovalue, changeid),
                    stress(2, "No", radiovalue, changeid)
                  ],
                ),
                Divider(
                  height: 10.0,
                ),

//disease
                texter("Do you suffer from any diseases?"),
                Row(
                  children: <Widget>[
                    stress(1, "Yes", radiodisease, changeiddisease),
                    stress(2, "No", radiodisease, changeiddisease)
                  ],
                ),
                Divider(
                  height: 10.0,
                ),

//disease yes
                radiodisease == 1
                    ? TextFormField(
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            labelText: "List the diseases:",
                            labelStyle: new TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            )),
                      )
                    : SizedBox(),
                Divider(
                  height: 10.0,
                ),

//smoker
                texter("Are you a current cigarette smoker?"),
                Row(
                  children: <Widget>[
                    stress(1, "Yes", radiocig, changeCig),
                    stress(2, "No", radiocig, changeCig)
                  ],
                ),
                Divider(
                  height: 10.0,
                ),

//diet
                texter("Your current diet could be best characterized as:"),
                Column(
                  children: <Widget>[
                    stress(1, "low-fat", radiodiet, changeDiet),
                    stress(2, "low-carb", radiodiet, changeDiet),
                    stress(3, "high-protein", radiodiet, changeDiet),
                    stress(4, "Vegetarian/Vegan", radiodiet, changeDiet),
                    stress(5, "No special diet", radiodiet, changeDiet)
                  ],
                ),
                SizedBox(
                  height: 60.0,
                )
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
                    if (health.text.isEmpty ||
                        medications.text.isEmpty ||
                        therapies.text.isEmpty ||
                        injuries.text.isEmpty) {
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
                      medicalInformation.insert(0, {
                        "Health": health.text,
                        "Medication": medications.text,
                        "Therapies": therapies.text,
                        "Injuries": injuries.text,
                        "Stress": radiovalue.toString(),
                        "Disease": radiodisease.toString(),
                        "Smoker": radiocig.toString(),
                        "Diet": radiodiet.toString()
                      });
                      print(medicalInformation);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Goals()));
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

  final health = TextEditingController();
  final medications = TextEditingController();
  final therapies = TextEditingController();
  final injuries = TextEditingController();
}
