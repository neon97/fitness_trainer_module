import 'package:fitness_training/main.dart';
import 'package:fitness_training/review.dart';
import 'package:flutter/material.dart';

class Guideliness extends StatefulWidget {
  @override
  _GuidelinessState createState() => _GuidelinessState();
}

class _GuidelinessState extends State<Guideliness> {
  //agree
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions"),
        backgroundColor: appbar,
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            texter("1.) CANCELLATIONS"),
            SizedBox(
              height: 10.0,
            ),
            texte(
                "Cancellations should be made at least 24 hours in advance of a scheduled session. Sessions cancelled less than 24 hours in advance will be charged in full to the client."),
            Divider(
              height: 20.0,
            ),
            texter("2.) LATE ARRIVALS"),
            SizedBox(
              height: 10.0,
            ),
            texte(
                "Each session shall be 1 hour in length. Sessions will not be extended (unless time is available) due to the lateness of the client or due to interruptions caused by the client."),
            Divider(
              height: 20.0,
            ),
            texter("3.) ALL THE INFORMATION I HAVE GIVEN IS CORRECT"),
            SizedBox(
              height: 10.0,
            ),
            texte(
                "All the information on this form is correct and to the best of my knowledge. I have sought and followed any necessary medical advice. I understand that all the information given will be kept confidential."),
            Divider(
              height: 20.0,
            ),
            texter("I AGREE TO THE ABOVE TERMS & CONDITIONS!"),
            Row(
              children: <Widget>[
                agrre(1, "Yes", radiovalue, changeid),
                agrre(2, "No", radiovalue, changeid),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                radiovalue == 1?Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Review())):print("");
              },
              color: appbar,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget agrre(int no, String text, int groupvalue, void changer(int value)) {
    return Row(
      children: <Widget>[
        Radio(value: no, groupValue: groupvalue, onChanged: changer),
        texter(text)
      ],
    );
  }
}
