import 'package:dhina/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui' ;
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Thirukkural',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
  // Widget build(BuildContext context) {
  //   return new Row(
  //     children: <Widget>[
  //       Text("data"),
  //       Text("data"),
  //     ],
  //   )
  // }
}
