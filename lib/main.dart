import 'package:dhina/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui' ;
import 'package:splashscreen/splashscreen.dart';

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
      home: SplashScreenPage(title: 'Thirukkural'),
       routes: {
 
        'Home': (context) => HomePage(),
 
      },
      debugShowCheckedModeBanner: false,
    );
  }

}

  class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key, this.title}) : super(key: key);
  final String title;
 
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}
 
class _SplashScreenPageState extends State<SplashScreenPage> {
   
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: 'Home',//route
        title: new Text(
          'Nithra Edu Solutions',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
 
        image: new Image.asset('assets/spalsh_image.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(
            fontSize: 0
        ),
        photoSize: 150.0
        );
  }
}
  // Widget build(BuildContext context) {
  //   return new Row(
  //     children: <Widget>[
  //       Text("data"),
  //       Text("data"),
  //     ],
  //   )
  // }

