import 'package:dhina/cate2pgview.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/pages/home_page.dart';
import 'package:dhina/pages/newDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' ;
import 'package:splashscreen/splashscreen.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Thirukkural',
//       theme: new ThemeData(
//         primarySwatch: Colors.blueGrey,
//       ),
//       home: SplashScreenPage(title: 'Thirukkural'),
//        routes: {
 
//         'Home': (context) => MyApp12345(),
 
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }

// }
 List<Map<String, dynamic>> newData1;
 var newData; 

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


  var dbhelp = DatabaseHelper();
var db = DatabaseHelper();

  void main() => runApp(new HomePageMain());

class HomePageMain extends StatefulWidget {
  HomePageMain({Key key}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Thirukkural',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SplashScreenPage(title: 'Thirukkural'),
       routes: {
 
        'Home': (context) => MyApp12345(),
 
      },
      debugShowCheckedModeBanner: false,
    );
    
  }

  @override
  void initState() {
    // todo: implement initState
    @override
    Future<String> _loadAStudentAsset() async {
      newData = await rootBundle.loadString('assets/complete1.json');
       // await db.db_move();
       
    }
    dbmove() async {
      await db.db_move();
      newData1 =
        await db.any_query("select * from complete1", "modi_kural_comp.db");
      // newData1 = await db.any_query("select * from complete1", "modi_kural_comp.db");
      ResultFav =  await db.any_query('SELECT * from complete', //1 where isfav=1', 
                   //1 where isfav=1', 
                   "modi_kural_comp.db");
    }
    
  //   loadDb() async {
    
  // }

    super.initState();
    dbmove();
    // dbhelp.db_move();
    _loadAStudentAsset();
  }

}