import 'dart:io';

import 'package:fitness_training/list.dart';
import 'package:fitness_training/main.dart';
import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: height,
        width: width,
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: width,
              width: width,
              child: Image(image: AssetImage("assets/images/ftf.gif")),
            ),
            Text(
              "Welcome To,",
              style: TextStyle(
                  fontSize: 60.0, fontWeight: FontWeight.bold, color: appbar),
              textAlign: TextAlign.center,
            ),
            Text(
              "' Fat To Fit '",
              style: TextStyle(
                  fontSize: 60.0, fontWeight: FontWeight.bold, color: appbar),
              textAlign: TextAlign.center,
            ),
            Text(
              "Thank You,\nMr. ${basicInformation[0]["Name"].toString()}\nFor applying to the Gym !",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(exit(0));
        },
        backgroundColor: appbar,
        elevation: 2.0,
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
