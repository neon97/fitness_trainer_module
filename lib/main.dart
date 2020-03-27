import 'package:fitness_training/start.dart';
import 'package:flutter/material.dart';

Color appbar = Color.fromRGBO(122, 111, 190, 1);
Widget texter(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 20.0),
  );
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: "BalooDa2",
      primaryColor: appbar
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Start();
  }
}
