import 'package:fitness_training/Listyle.dart';
import 'package:fitness_training/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class BasicInformation extends StatefulWidget {
  @override
  _BasicInformationState createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  int radiovalue = 1;
  int genderValue;
  void changeid(int value) {
    setState(() {
      radiovalue = value;
      switch (radiovalue) {
        case 1:
          genderValue = radiovalue;
          break;
        case 2:
          genderValue = radiovalue;
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
        title: Text("Basic Information"),
      ),
      body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
//full name
                  TextFormField(
                    controller: name,
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: "Full Name :",
                        labelStyle: new TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

//gender
                  Row(
                    children: <Widget>[
                      texter("Gender :"),
                      SizedBox(
                        width: 10.0,
                      ),
                      Radio(
                        activeColor: appbar,
                        value: 1,
                        groupValue: radiovalue,
                        onChanged: changeid,
                      ),
                      texter("Male"),
                      Radio(
                        activeColor: appbar,
                        value: 2,
                        groupValue: radiovalue,
                        onChanged: changeid,
                      ),
                      texter("Female"),
                    ],
                  ),
                  Divider(
                    height: 10.0,
                  ),

//date of birth
                  TextFormField(
                    controller: dob,
                    onTap: () async {
                      DateTime date;
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime(1990),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2003));
                      dob.text =
                          "${date.day.toString()} / ${date.month.toString()} / ${date.year.toString()}";
                    },
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: "Date of Birth :",
                        labelStyle: new TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

//Age
                  TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: "Age :",
                        labelStyle: new TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

//height
                  TextFormField(
                    controller: heights,
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: "Height :",
                        labelStyle: new TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

//width
                  TextFormField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: "Weight :",
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
                      if (name.text.isEmpty ||
                          dob.text.isEmpty ||
                          age.text.isEmpty ||
                          heights.text.isEmpty ||
                          weight.text.isEmpty) {
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
                        basicInformation.insert(0, {
                          "Name": name.text,
                          "Gender": radiovalue.toString(),
                          "DOB": dob.text,
                          "Age": age.text,
                          "Height": heights.text,
                          "Weight": weight.text
                        });
                        print(basicInformation);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Lifestyle()));
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
          )),
    );
  }

  final name = TextEditingController();
  final dob = TextEditingController();
  final age = TextEditingController();
  final heights = TextEditingController();
  final weight = TextEditingController();
}
