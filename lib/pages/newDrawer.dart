import 'dart:math';

import 'package:dhina/Gsearch.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/db/sharedpref.dart';
import 'package:dhina/feedback_ex.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:dhina/fragments/privacy_link.dart';
import 'package:dhina/tapOption.dart';
import 'package:flutter/material.dart';
import 'package:dhina/newMainpage1.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:launch_review/launch_review.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:open_appstore/open_appstore.dart';

import 'package:share/share.dart';
import 'package:dhina/main.dart';

import '../newMainpage1.dart';
// import 'package:dhina/utility/ScreenUtil.dart';

var db = DatabaseHelper();
var prefs = Shared_Preference();
var payloadNo;
var searchResult1;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

// var newData;
//List<Map<String, dynamic>> newData1;
List<Map<String, dynamic>> pal2iyal, iyal2adhikaram;
// ScreenUtil.instance = ScreenUtil.getInstance().init(context);
TextEditingController _textFieldController = TextEditingController();
TextEditingController inputControler = new TextEditingController();

// void main() => runApp(MyApp12345());

class MyApp12345 extends StatefulWidget {
  MyApp12345({Key key}) : super(key: key);

  @override
  _MyApp12345State createState() => _MyApp12345State();
}

class _MyApp12345State extends State<MyApp12345> {
  @override
  void initState() {
    // todo: implement initState
    // @override
    // Future<String> _loadAStudentAsset() async {
    //   newData = await rootBundle.loadString('assets/complete1.json');
    //    await db.db_move();

    // }
    // dbmove() async {
    //   await db.db_move();
    //   //newData1 = await db.any_query("select * from complete1", "modi_kural_comp.db");
    //   ResultFav = await db.any_query(
    //       'SELECT * from complete', //1 where isfav=1',
    //       //1 where isfav=1',
    //       "modi_kural_comp.db");
    // }

    super.initState();
    // dbmove();

// _showDailyAtTime();
//     flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOS = new IOSInitializationSettings();
//     var initSetttings = new InitializationSettings(android, iOS);
//     flutterLocalNotificationsPlugin.initialize(initSetttings,
//         onSelectNotification: onSelectNotification);
//         _showDailyAtTime();
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyApp444(
                value: payloadNo - 1,
                currentPageValue: payloadNo - 1,
                fontSize1: 0,
              )),
    );
  }

  Future<void> _showDailyAtTime() async {
    final _random = new Random();
    var values = newData1.toList();
    var element = values[_random.nextInt(values.length)];
    payloadNo = element['kural_no'];
    // print("element: $element");
    print("Random Kural No: ${element['kural_no']}");
    var time = new Time(9, 0, 0);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0, 'தினம் ஒரு குறள்', 'இன்றைய குறள்', time, platformChannelSpecifics,
        payload: element['kural_tamil1']);
  }

  Future<bool> _inBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Doyou want to quit this app"),
        actions: <Widget>[
          FlatButton(
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.pop(context, true);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: appTitle,
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,

      home:
          // WillPopScope(
          //   //         onWillPop: () async {
          //   //   if (Navigator.of(context).userGestureInProgress)
          //   //     return false;
          //   //   else
          //   //     return true;
          //   // },
          //   onWillPop: null,// _inBackPressed,
          //   child:
          Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text('திருக்குறள்'),
          //   automaticallyImplyLeading: false, // this will hide Drawer hamburger icon

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share("Nithra Edu Solutions Thirukkural Appp Id: ");
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_alert),
              onPressed: () {
                // openPage(context);
                // return new MyApp2();
                print("object");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MyApp2()),
                // );
              },
            ),
//           new GestureDetector(
// onTap: () {
//                     return Share.share("Text");
//                   },
//                   child: Text("share"),
//           ),

//           Text("Noti")
          ],
          // title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        ),
        body: MyHomePage(),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,

            children: ListTile.divideTiles(
              context: context,
              tiles: [
                // <Widget>[
                DrawerHeader(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/thirukural_round.png",
                        width: 100,
                        height: 100,
                      ),
                      Text('திருக்குறள்'),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                ),

                //       ListView(
                // children: ListTile.divideTiles(
                //   context: context,
                //   tiles: [
                // Card( child:
                ListTile(
                  // contentPadding: EdgeInsets.all(8.0),
                  leading: Image.asset(
                    "home.png",
                    height: 20,
                    width: 20,
                  ),
                  title: Text(
                    'முகப்பு',
                  ),
                  onTap: () async {
                    // Navigator.of(context).pop();
                    // Navigator.of(context).maybePop();

                    // Navigator.pop(context, true);
                    a = await prefs.getDouble("fontSize1");
                    newData1 = await db.any_query(
                        "select * from complete1", "modi_kural_comp.db");

                    await Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new MyApp12345();
                    }));
                    // await Navigator.of(context).push(
                    //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                    //   return new MyApp4(fontSize1 : fontSize1);
                    // }));
                  },
                  // )
                ),

                ListTile(
                  leading: Image.asset("play1.png", width: 20, height: 20),
                  title: Text('முழு பட்டியல்'),
                  onTap: () async {
                    // Navigator.of(context).pop();
                    // Navigator.of(context).maybePop();
                    // Navigator.pushReplacementNamed(context, '/');

                    // Navigator.pop(context, true);
                    a = await prefs.getDouble("fontSize1");
                    newData1 = await db.any_query(
                        "select * from complete1", "modi_kural_comp.db");
                    await Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new MyApp444(
                        value: 0,
                        currentPageValue: 0,
                        fontSize1: a,
                      ); // fontSize11),);
                    }));
                    // await Navigator.of(context).push(
                    //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                    //   return new MyApp4(fontSize1 : fontSize1);
                    // }));
                  },
                ),
                ListTile(
                  leading: Image.asset("skip.png", width: 20, height: 20),
                  title: Text('தொடர்க'),
                  onTap: () async {
                    int v = await prefs.getInt("cursor");
                    a = await prefs.getDouble("fontSize1");

                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new MyApp444(
                        value: v,
                        currentPageValue: v,
                        fontSize1: a,
                      );
                    }));

                    // Navigator.of(context).push(
                    //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                    //   return new MyApp44(value: v);
                    // }));
                  },
                ),
                ListTile(
                  leading: Image.asset("category.png", width: 20, height: 20),
                  title: Text('வகைப்பட்டியல்'),
                  onTap: () async {
                    result = await db.any_query(
                        'select DISTINCT pal_tamil from complete1',
                        'modi_kural_comp.db');
                    await _onSelectItem1(result[0]['pal_tamil']);
                    await _onSelectItem2(result[1]['pal_tamil']);
                    await _onSelectItem3(result[2]['pal_tamil']);
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new TabBarDemo();
                    }));
                  },
                ),
                ListTile(
                  leading: Image.asset("gotoSearch.png", width: 20, height: 20),
                  title: Text('செல்'),
                  onTap: () async {
                    
                    return showDialog(
                      context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                        var _value;
                        return AlertDialog(
                          titlePadding: EdgeInsets.all(0.0),
                                        title: IconButton(
                                          icon: Icon(Icons.close),
                                          alignment: Alignment.topRight,
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                        content: SingleChildScrollView(
                                            child: ListBody(children: <Widget>[
                                          Text(
                                            'குறள் எண்ணை உள்ளிடவும்',
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType
                                                .number, //numberWithOptions(decimal: true),
                                            controller: _textFieldController,
                                            decoration: InputDecoration(
                                                hintText: "குறள் எண்: "),
                                            // onSaved: (input) =>
                                            //     _value = int.tryParse(input),
                                            // textInputAction: controller.jumpTo(_value),
                                          ),
                                        ])),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: new Text('இல்லை'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                            new FlatButton(
                              child: new Text('ஆம்'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                print(
                                    "text.controller:  ${_textFieldController.text}");
                                var abcd =
                                    (_textFieldController.text).toString();
                                print("abcd " + abcd);
                                var ff = int.parse(abcd) - 1;
                                //               var route = new MaterialPageRoute(
                                //   builder: (BuildContext context) =>
                                //       new MyApp44(value: ff, ),
                                // );
                                // Navigator.of(context).push(route);
                                // Navigator.of(context).push(route);

                                Navigator.of(context).push(
                                    MaterialPageRoute<Null>(
                                        builder: (BuildContext context) {
                                  return new MyApp444(value: ff);
                                }));

                                //Navigator.of(context).pop();

                                // controller.jumpToPage(ff);
                                // Navigator.of(context)
                                //     .pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                    leading: Image.asset("search.png", width: 20, height: 20),
                    title: Text('தேடல்'),
                    onTap: () async {
                       return showDialog(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      // child: IconButton(
                      //           icon: const Icon(Icons.close),
                      //           onPressed: () {
                      //             Navigator.of(context).pop();
                      //           },
                      //         ),
                      builder: (BuildContext context) {
                        return AlertDialog(
                          titlePadding: EdgeInsets.all(0.0),
                          title: IconButton(
                            icon: Icon(Icons.close),
                            alignment: Alignment.topRight,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.grey,
                                  textColor: Colors.white,
                                  child: Text(" எழுத்து மூலம் தேட "),
                                  onPressed: () async {

                                    Navigator.of(context, rootNavigator: true).pop(
                                        result); //                   Navigator.pop(context);

                                    result = await db.any_query(
                                        'select DISTINCT pal_tamil from complete1',
                                        'modi_kural_comp.db');

                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(
                                            builder: (BuildContext context) {
                                      return new GlobalSearch();
                                    }));
                                  },
                                ),
                                FlatButton(
                                  color: Colors.grey,
                                  textColor: Colors.white,
                                  child: Text("வகைவாரியாக தேட"),
                                  onPressed: () async {
                                    // Navigator.of(context).pop();

                                    Navigator.of(context, rootNavigator: true).pop(
                                        result); //                   Navigator.pop(context);

                                    result = await db.any_query(
                                        'select DISTINCT pal_tamil from complete1',
                                        'modi_kural_comp.db');
                                    await _onSelectItem1(
                                        result[0]['pal_tamil']);
                                    await _onSelectItem2(
                                        result[1]['pal_tamil']);
                                    await _onSelectItem3(
                                        result[2]['pal_tamil']);
                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(
                                            builder: (BuildContext context) {
                                      return new TabBarDemo();
                                    }));
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            // FlatButton(
                            //   child: Text('Regret'),
                            //   onPressed: () {
                            //     Navigator.of(context).pop();
                            //   },
                            // ),
                          ],
                        );
                      },
                    );

                  },
                    ),
                /*
                ListTile(
                  leading: Image.asset("star.png", width: 20, height: 20),
                  title: Text('பிடித்தவைகள்'),
                  onTap: () async {
                    // BackupKurals = await db.any_query("SELECT kural_no ", dbName)
                    ResultFav = await db.any_query(
                        'SELECT * from complete1 where isfav=1',
                        //1 where isfav=1',
                        "modi_kural_comp.db");
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new Favorite11(); // HomePage1();
                    }));
                    // ResultFav = await db.any_query(
                    //     'SELECT * from complete', //1 where isfav=1',
                    //     //1 where isfav=1',
                    //     "modi_kural_comp.db");
                    // Navigator.of(context).push(
                    //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                    //   return new Favorite11(); // HomePage1();
                    // }));
                  },
                ),

                
                ListTile(
                  leading: Image.asset("protection.png", width: 20, height: 20),
                  title: Text('அமைப்புகள்'),
                  onTap: () {
                    //_value1 = true;
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new LocalNoti(); // HomePage1();
                    }));
                  },
                ),

                */
                ListTile(
                  leading: Image.asset("protection.png", width: 20, height: 20),
                  title: Text('தனியுரிமைக் கொள்கை'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new MyApp2(); // HomePage1();
                    }));
                  },
                ),
                ListTile(
                  leading: Image.asset("feedback.png", width: 20, height: 20),
                  title: Text('கருத்து'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new Feedback_ex(); // HomePage1();
                    }));
                  },
                ),
                ListTile(
                  leading: Image.asset("share.png", width: 20, height: 20),
                  title: Text('பகிரவும்'),
                  onTap: () {
                    return sharing3();
                  },
                ),
                // ListTile(
                //   leading: Image.asset("rate.png", width: 20, height: 20),
                //   title: Text('மதிப்பிடவும்'),
                //   onTap: () {
                //     // return dia_rateUs();
                //     Navigator.of(context).push(MaterialPageRoute<Null>(
                //         builder: (BuildContext context) {
                //       return new dia_rateUs(); // HomePage1();
                //     }));
                //   },
                // ),
                // ],).toList(),)
              ],
            ).toList(),
          ),
        ),
      ),
      // MyHomePage(title: appTitle),

//       home: Scaffold(
//         appBar: new AppBar(
//           // here we display the title corresponding to the fragment
//           // you can instead choose to have a static title
//           title: new Text('திருக்குறள்'),
//           //   automaticallyImplyLeading: false, // this will hide Drawer hamburger icon

//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.share),
//               onPressed: () {
//                 Share.share("Nithra Edu Solutions Thirukkural Appp Id: ");
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.add_alert),
//               onPressed: () {
//                 // openPage(context);
//                 // return new MyApp2();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyApp2()),
//                 );
//               },
//             ),
// //           new GestureDetector(
// // onTap: () {
// //                     return Share.share("Text");
// //                   },
// //                   child: Text("share"),
// //           ),

// //           Text("Noti")
//           ],
//           // title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
//         ),
//         body: MyHomePage(
//           title: '',
//         ),
//       ),

      // MyHomePage(title: appTitle),
      //)
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(title: Text(title)),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: SingleChildScrollView(
              child:
                  // padding: EdgeInsets.all(10.0),
                  // child:
                  Center(
                      child: new SizedBox(
            // width: 300.0,
            // height: 500.0,
            child: SingleChildScrollView(
                child: new Column(
              // new SizedBox(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
                Card(
                  // color: Colors.grey,
                  child: RaisedButton(
                      color: Colors.white,
                      // child: SizedBox(
                      //     height: 60,
                      child: Container(
                          alignment: Alignment.center,
                          height: 65.5,
                          margin: EdgeInsets.all(8.0),
                          // height: 60, // MediaQuery.of(context).size.height,
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/play1.png',
                            ),
                            Expanded(
                              flex: 1,
                              // height: 60,
                              // child: SingleChildScrollView(
                              child: Column(
                                // height: 60,
                                mainAxisAlignment: MainAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text("      ஆரம்பிக்க       ",
                                      softWrap: true),
                                  Text("----------------------",
                                      softWrap: true),
                                  Text("        Start         ",
                                      softWrap: true),
                                ],
                              ),
                            )
                            //)
                          ]))
                      // )
                      ,
                      onPressed: () async {
                        a = await prefs.getDouble("fontSize1");
                        newData1 = await db.any_query(
                            "select * from complete1", "modi_kural_comp.db");
                        await Navigator.of(context).push(
                            MaterialPageRoute<Null>(
                                builder: (BuildContext context) {
                          return new MyApp444(
                            value: 0,
                            currentPageValue: 0,
                            fontSize1: a,
                          ); // fontSize11),);
                        }));
                        // await Navigator.of(context).push(
                        //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                        //   return new MyApp4(fontSize1 : fontSize1);
                        // }));
                      }),
                ),
                Card(
                  color: Colors.grey,
                  child: RaisedButton(
                    color: Colors.white,
                    // child: SizedBox(
                    //  height: 60,
                    child: Container(
                        alignment: Alignment.center,
                        height: 65.5,
                        margin: EdgeInsets.all(8.0),
                        child: Row(children: <Widget>[
                          Image.asset(
                            'assets/skip.png',
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text("        தொடர்க       "),
                                  Text("----------------------"),
                                  Text("        Continue      "),
                                ],
                              ))
                        ])
                        //)
                        //  )
                        ),
                    onPressed: () async {
                      //   int v = await prefs.getInt("cursor");
                      //   double ab = await prefs.getDouble("fontSize1");
                      //   if (v == 0) {
                      //     Navigator.of(context).push(
                      //         MaterialPageRoute<Null>(builder: (BuildContext context) {
                      //       return new MyApp44(value: 0, fontSize1: ab,);
                      //     }));
                      //   } else {
                      //     Navigator.of(context).push(
                      //         MaterialPageRoute<Null>(builder: (BuildContext context) {
                      //       return new MyApp44(value: v, currentPageValue: v, fontSize1: a,);
                      //     }));
                      //   }
                      //   // Navigator.of(context).push(
                      //   //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                      //   //   return new MyApp44(value: v);
                      //   // }));
                      // },
                      int v = await prefs.getInt("cursor");
                      a = await prefs.getDouble("fontSize1");
                      if (v == 0) {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new MyApp444(
                            value: 0,
                            currentPageValue: 0,
                            fontSize1: a,
                          );
                        }));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new MyApp444(
                            value: v,
                            currentPageValue: v,
                            fontSize1: a,
                          );
                        }));
                      }
                      // Navigator.of(context).push(
                      //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                      //   return new MyApp44(value: v);
                      // }));
                    },
                  ),
                ),
                Card(
                    color: Colors.grey,
                    child: RaisedButton(
                      color: Colors.white,
                      // child: SizedBox(
                      //     height: 60,
                      child: Container(
                          alignment: Alignment.center,
                          height: 65.5,
                          margin: EdgeInsets.all(8.0),
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/category.png',
                            ),
                            Expanded(
                                flex: 1,
                                // child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Text("     வகைப்பட்டியல்     "),
                                    Text("----------------------"),
                                    Text("       Category       "),
                                  ],
                                  // )
                                ))
                          ]))
                      // )
                      // )
                      ,
                      onPressed: () async {
                        result = await db.any_query(
                            'select DISTINCT pal_tamil from complete1',
                            'modi_kural_comp.db');
                        await _onSelectItem1(result[0]['pal_tamil']);
                        await _onSelectItem2(result[1]['pal_tamil']);
                        await _onSelectItem3(result[2]['pal_tamil']);
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new TabBarDemo();
                        }));
                      },
                    )),
                //  Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      mainAxisSize: MainAxisSize.max,
                //      children: <Widget>[
                Card(
                    color: Colors.grey,
                    child: RaisedButton(
                      color: Colors.white,
                      // child: SizedBox(
                      //     height: 60,
                      child: Container(
                          alignment: Alignment.center,
                          height: 65.5,
                          margin: EdgeInsets.all(8.0),
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/gobutton.png',
                            ),
                            Expanded(
                                flex: 1,
                                // child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    // Text("hi"),

                                    Text("         செல்         "),
                                    Text("----------------------"),
                                    Text("          Goto        "),
                                  ],
                                )
                                // )
                                )
                          ]))
                      // )
                      // )
                      ,
                      onPressed: () async {
                        a = await prefs.getDouble("fontSize1");
                        return showDialog(
                          context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                            var _value;
                            return AlertDialog(
                                        titlePadding: EdgeInsets.all(0.0),
                                        title: IconButton(
                                          icon: Icon(Icons.close),
                                          alignment: Alignment.topRight,
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                        content: SingleChildScrollView(
                                            child: ListBody(children: <Widget>[
                                          Text(
                                            'குறள் எண்ணை உள்ளிடவும்',
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType
                                                .number, //numberWithOptions(decimal: true),
                                            controller: _textFieldController,
                                            decoration: InputDecoration(
                                                hintText: "குறள் எண்: "),
                                            // onSaved: (input) =>
                                            //     _value = int.tryParse(input),
                                            // textInputAction: controller.jumpTo(_value),
                                          ),
                                        ])),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: new Text('இல்லை'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                new FlatButton(
                                  child: new Text('ஆம்'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    print(
                                        "text.controller:  ${_textFieldController.text}");
                                    var abcd =
                                        (_textFieldController.text).toString();
                                    print("abcd " + abcd);
                                    var ff = int.parse(abcd) - 1;
                                    //               var route = new MaterialPageRoute(
                                    //   builder: (BuildContext context) =>
                                    //       new MyApp44(value: ff, ),
                                    // );
                                    // Navigator.of(context).push(route);
                                    // Navigator.of(context).push(route);

                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(
                                            builder: (BuildContext context) {
                                      return new MyApp444(
                                        value: ff,
                                        fontSize1: a,
                                      );
                                    }));

                                    //Navigator.of(context).pop();

                                    // controller.jumpToPage(ff);
                                    // Navigator.of(context)
                                    //     .pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    )),

                /*
                Card(
                    color: Colors.grey,
                    child: RaisedButton(
                        color: Colors.white,
                        // child: SizedBox(
                        //     height: 60,
                        child: Container(
                            alignment: Alignment.center,
                            height: 65.5,
                            margin: EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Image.asset(
                                'assets/search.png',
                              ),
                              Expanded(
                                  flex: 1,
                                  // child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text("        தேடல்         "),
                                      Text("----------------------"),
                                      Text("        Search        "),
                                    ],
                                  ))
                              // )
                            ])
                            //)
                            //)
                            ),
                        onPressed: () async {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              var _value;

                              return AlertDialog(
                                title: Text('எழுத்து மூலம் தேட '),
                                content: TextField(
                                  controller: inputControler,
                                  decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        // borderRadius: new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(),
                                      ),
                                      //fillColor: Colors.green
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                      hintText: " Text search/உரைத்தேடல் ",
                                      labelText: ' search/தேடல்: '),
                                  onChanged: (input) => _value = input,
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text('இல்லை'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      // Navigator.of(context).pop();
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text('ஆம்'),
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      print(
                                          "text.controller:  ${inputControler.text}");
                                      var abcd = (inputControler.text);

                                      var kuralWord = (inputControler.text);
                                      print(kuralWord);
                                      var sql =
                                          'SELECT * FROM complete1 WHERE kural_tamil1 like "%$kuralWord%" or kural_thanglish1 like "%$kuralWord%" or kural_thanglish2 like "%$kuralWord%" ';
                                      searchResult1 = await db.any_query(
                                          sql, "modi_kural_comp.db");

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GlobalSearchingKural()),
                                      );
                                    },
                                  ),
                                ],
                              );

                              /*
                        result = await db.any_query(
                            'select DISTINCT pal_tamil from complete1',
                            'modi_kural_comp.db');
                        
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new GlobalSearch();
                        }));
                        */
                           
                // )),
                // ]),
                */

                Card(
                    color: Colors.grey,
                    child: RaisedButton(
                        color: Colors.white,
                        // child: SizedBox(
                        //     height: 60,
                        child: Container(
                            alignment: Alignment.center,
                            height: 65.5,
                            margin: EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Image.asset(
                                'assets/search.png',
                              ),
                              Expanded(
                                  flex: 1,
                                  // child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text("        தேடல்         "),
                                      Text("----------------------"),
                                      Text("        Search        "),
                                    ],
                                  ))
                              // )
                            ])
                            //)
                            //)
                            ),
                        onPressed: () async {
                         return showDialog(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      // child: IconButton(
                      //           icon: const Icon(Icons.close),
                      //           onPressed: () {
                      //             Navigator.of(context).pop();
                      //           },
                      //         ),
                      builder: (BuildContext context) {
                        return AlertDialog(
                          titlePadding: EdgeInsets.all(0.0),
                          title: IconButton(
                            icon: Icon(Icons.close),
                            alignment: Alignment.topRight,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.grey,
                                  textColor: Colors.white,
                                  child: Text(" எழுத்து மூலம் தேட "),
                                  onPressed: () async {
// GlobalSearch();
                                    Navigator.of(context, rootNavigator: true).pop(
                                        result); //                   Navigator.pop(context);

                                    result = await db.any_query(
                                        'select DISTINCT pal_tamil from complete1',
                                        'modi_kural_comp.db');

                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(
                                            builder: (BuildContext context) {
                                      return new GlobalSearch();
                                    }));

// Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 GlobalSearch()),
                                    // );
                                  },
                                ),
                                FlatButton(
                                  color: Colors.grey,
                                  textColor: Colors.white,
                                  child: Text("வகைவாரியாக தேட"),
                                  onPressed: () async {
                                    // Navigator.of(context).pop();

                                    Navigator.of(context, rootNavigator: true).pop(
                                        result); //                   Navigator.pop(context);

                                    result = await db.any_query(
                                        'select DISTINCT pal_tamil from complete1',
                                        'modi_kural_comp.db');
                                    await _onSelectItem1(
                                        result[0]['pal_tamil']);
                                    await _onSelectItem2(
                                        result[1]['pal_tamil']);
                                    await _onSelectItem3(
                                        result[2]['pal_tamil']);
                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(
                                            builder: (BuildContext context) {
                                      return new TabBarDemo();
                                    }));
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            // FlatButton(
                            //   child: Text('Regret'),
                            //   onPressed: () {
                            //     Navigator.of(context).pop();
                            //   },
                            // ),
                          ],
                        );
                      },
                    );

                    // );

                    // ResultFav = await db.any_query(
                    //     'SELECT * from complete1 where isfav=1',
                    //     //1 where isfav=1',
                    //     "modi_kural_comp.db");
                    // Navigator.of(context).push(MaterialPageRoute<Null>(
                    //     builder: (BuildContext context) {
                    //   return new Favorite11(); // HomePage1();
                    // }));
                  },
                        )
                        ),
                // )),
                // ]),

                Card(
                    color: Colors.grey,
                    child: RaisedButton(
                        color: Colors.white,
                        // child: SizedBox(
                        //     height: 60,
                        child: Container(
                            // alignment: Alignment.center,
                            height: 65.5,
                            margin: EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/tamil_calendar.webp',
                                  ),
                                  //  ListView(
                                  //    shrinkWrap: true,
                                  //  children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      // child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        // mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                                "  நித்ரா தமிழ் நாட்காட்டி  "),
                                          ),
                                          Expanded(
                                            child:
                                                Text("----------------------"),
                                          ),
                                          Expanded(
                                            child:
                                                Text("Nithra Tamil Calendar"),
                                          ),
                                        ],
                                      )),

                                  Container(
                                      // margin: EdgeInsets.all(0.0),

                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        'assets/ads.png',
                                        width: 25,
                                        height: 25,
                                      )),

                                  // )
                                  // )
                                ])
                            //)
                            //)
                            ),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute<Null>(
                          //     builder: (BuildContext context) {
                          //   return new MyApp444(
                          //     value: 0,
                          //     currentPageValue: 0,
                          //     fontSize1: 0,
                          //   );
                          // }));
                          //OpenAppstore.launch(androidAppId: "com.facebook.katana&hl=ko", iOSAppId: "284882215")
                          LaunchReview.launch(
                              androidAppId: "nithra.tamil.quiz",
                              iOSAppId: "id1484332988");
                        })),

//                 RaisedButton(
//                   color: Color(1100),
//                   child: Text('Favourites using "isfav'),
//                   onPressed: () async {
//                     return showDialog(
//                       context: context,
//                       barrierDismissible: true, // user must tap button!
//                       // child: IconButton(
//                       //           icon: const Icon(Icons.close),
//                       //           onPressed: () {
//                       //             Navigator.of(context).pop();
//                       //           },
//                       //         ),
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           titlePadding: EdgeInsets.all(0.0),
//                           title: IconButton(
//                             icon: Icon(Icons.close),
//                             alignment: Alignment.topRight,
//                             onPressed: () => Navigator.of(context).pop(),
//                           ),
//                           content: SingleChildScrollView(
//                             child: ListBody(
//                               children: <Widget>[
//                                 FlatButton(
//                                   color: Colors.grey,
//                                   textColor: Colors.white,
//                                   child: Text(" எழுத்து மூலம் தேட "),
//                                   onPressed: () async {
// // GlobalSearch();
//                                     Navigator.of(context, rootNavigator: true).pop(
//                                         result); //                   Navigator.pop(context);

//                                     result = await db.any_query(
//                                         'select DISTINCT pal_tamil from complete1',
//                                         'modi_kural_comp.db');

//                                     Navigator.of(context).push(
//                                         MaterialPageRoute<Null>(
//                                             builder: (BuildContext context) {
//                                       return new GlobalSearch();
//                                     }));

// // Navigator.push(
// //                                         context,
// //                                         MaterialPageRoute(
// //                                             builder: (context) =>
// //                                                 GlobalSearch()),
//                                     // );
//                                   },
//                                 ),
//                                 FlatButton(
//                                   color: Colors.grey,
//                                   textColor: Colors.white,
//                                   child: Text("வகைவாரியாக தேட"),
//                                   onPressed: () async {
//                                     // Navigator.of(context).pop();

//                                     Navigator.of(context, rootNavigator: true).pop(
//                                         result); //                   Navigator.pop(context);

//                                     result = await db.any_query(
//                                         'select DISTINCT pal_tamil from complete1',
//                                         'modi_kural_comp.db');
//                                     await _onSelectItem1(
//                                         result[0]['pal_tamil']);
//                                     await _onSelectItem2(
//                                         result[1]['pal_tamil']);
//                                     await _onSelectItem3(
//                                         result[2]['pal_tamil']);
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute<Null>(
//                                             builder: (BuildContext context) {
//                                       return new TabBarDemo();
//                                     }));
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           actions: <Widget>[
//                             // FlatButton(
//                             //   child: Text('Regret'),
//                             //   onPressed: () {
//                             //     Navigator.of(context).pop();
//                             //   },
//                             // ),
//                           ],
//                         );
//                       },
//                     );

//                     // );

//                     // ResultFav = await db.any_query(
//                     //     'SELECT * from complete1 where isfav=1',
//                     //     //1 where isfav=1',
//                     //     "modi_kural_comp.db");
//                     // Navigator.of(context).push(MaterialPageRoute<Null>(
//                     //     builder: (BuildContext context) {
//                     //   return new Favorite11(); // HomePage1();
//                     // }));
//                   },
//                 ),

                // RaisedButton(
                //   child: Text("Local Notification "),
                //   onPressed: () async {
                //     // // print("Rate this object")
                //     // // LaunchReview.launch(
                //     // //   androidAppId: "com.iyaffle.kural",
                //     // //   iOSAppId: "585027354",
                //     // //   writeReview: true,
                //     // // );
                //     // newData1 = await db.any_query(
                //     //     "select * from complete1", "modi_kural_comp.db");
                //     // final _random = new Random();
                //     // var values = newData1.toList();
                //     // var element = values[_random.nextInt(values.length)];
                //     // print(element);
                //     // print("${element['kural_no']}");

                //     // Navigator.of(context).push(MaterialPageRoute<Null>(
                //     //     builder: (BuildContext context) {
                //     //   return new LocalNoti(
                //     //     payload: element['kural_tamil1'],
                //     //     payload_kural_no: element['kural_no'],
                //     //   ); // HomePage1();
                //     // }));
                //   },
                // ),

                // RaisedButton(
                //   child: Text('Favourites using complete table'),
                //   color: Color(5400),
                //   onPressed: ()  {
                //     // BackupKurals = await db.any_query("SELECT kural_no ", dbName)
                //     // ResultFav = await db.any_query(
                //     //     'SELECT * from complete', //1 where isfav=1',
                //     //     //1 where isfav=1',
                //     //     "modi_kural_comp.db");
                //        LaunchReview.launch(androidAppId: "nithra.tamil.quiz", iOSAppId: "id1484332988");
                //     // Navigator.of(context).push(MaterialPageRoute<Null>(
                //     //     builder: (BuildContext context) {
                //     //   return new Favorite11(); // HomePage1();
                //     // }));
                //   },
                // ),
              ],
            )),
          ))),
          // drawer: Drawer(
          //   // Add a ListView to the drawer. This ensures the user can scroll
          //   // through the options in the drawer if there isn't enough vertical
          //   // space to fit everything.
          //   child: ListView(
          //     // Important: Remove any padding from the ListView.
          //     padding: EdgeInsets.zero,
          //     children: <Widget>[
          //       DrawerHeader(
          //         child: Text('Thirukkural'),
          //         decoration: BoxDecoration(
          //           color: Colors.blueGrey,
          //         ),
          //       ),
          //       ListTile(
          //         title: Text('Start'),
          //         onTap: () async {
          //           a = await prefs.getDouble("fontSize1");
          //           newData1 = await db.any_query(
          //               "select * from complete1", "modi_kural_comp.db");
          //           await Navigator.of(context).push(
          //               MaterialPageRoute<Null>(builder: (BuildContext context) {
          //             return new MyApp444(
          //               value: 0,
          //               currentPageValue: 0,
          //               fontSize1: a,
          //             ); // fontSize11),);
          //           }));
          //           // await Navigator.of(context).push(
          //           //     MaterialPageRoute<Null>(builder: (BuildContext context) {
          //           //   return new MyApp4(fontSize1 : fontSize1);
          //           // }));
          //         },
          //       ),
          //       ListTile(
          //         title: Text('Continue'),
          //         onTap: () async {
          //           int v = await prefs.getInt("cursor");
          //           a = await prefs.getDouble("fontSize1");
          //           if (v == 0) {
          //             Navigator.of(context).push(
          //                 MaterialPageRoute<Null>(builder: (BuildContext context) {
          //               return new MyApp444(
          //                 value: 0,
          //                 currentPageValue: 0,
          //                 fontSize1: a,
          //               );
          //             }));
          //           } else {
          //             Navigator.of(context).push(
          //                 MaterialPageRoute<Null>(builder: (BuildContext context) {
          //               return new MyApp444(
          //                 value: v,
          //                 currentPageValue: v,
          //                 fontSize1: a,
          //               );
          //             }));
          //           }
          //           // Navigator.of(context).push(
          //           //     MaterialPageRoute<Null>(builder: (BuildContext context) {
          //           //   return new MyApp44(value: v);
          //           // }));
          //         },
          //       ),
          //       ListTile(
          //         title: Text('categories'),
          //         onTap: () async {
          //           result = await db.any_query(
          //               'select DISTINCT pal_tamil from complete1',
          //               'modi_kural_comp.db');
          //           await _onSelectItem1(result[0]['pal_tamil']);
          //           await _onSelectItem2(result[1]['pal_tamil']);
          //           await _onSelectItem3(result[2]['pal_tamil']);
          //           Navigator.of(context).push(
          //               MaterialPageRoute<Null>(builder: (BuildContext context) {
          //             return new TabBarDemo();
          //           }));
          //         },
          //       ),
          //       ListTile(
          //         title: Text('goto'),
          //         onTap: () async {
          //           return showDialog(
          //             context: context,
          //             builder: (context) {
          //               var _value;
          //               return AlertDialog(
          //                 title: Text('குறள் எண்ணை தட்டவும்'),
          //                 content: TextFormField(
          //                   keyboardType: TextInputType
          //                       .number, //numberWithOptions(decimal: true),
          //                   controller: _textFieldController,
          //                   decoration: InputDecoration(hintText: "குறள் எண்: "),
          //                   onSaved: (input) => _value = int.tryParse(input),
          //                   // textInputAction: controller.jumpTo(value),
          //                 ),
          //                 actions: <Widget>[
          //                   new FlatButton(
          //                     child: new Text('இல்லை'),
          //                     onPressed: () {
          //                       Navigator.of(context).pop();
          //                       // Navigator.of(context).pop();
          //                     },
          //                   ),
          //                   new FlatButton(
          //                     child: new Text('ஆம்'),
          //                     onPressed: () {
          //                       Navigator.of(context).pop();
          //                       print(
          //                           "text.controller:  ${_textFieldController.text}");
          //                       var abcd = (_textFieldController.text).toString();
          //                       print("abcd " + abcd);
          //                       var ff = int.parse(abcd) - 1;
          //                       //               var route = new MaterialPageRoute(
          //                       //   builder: (BuildContext context) =>
          //                       //       new MyApp44(value: ff, ),
          //                       // );
          //                       // Navigator.of(context).push(route);
          //                       // Navigator.of(context).push(route);

          //                       Navigator.of(context).push(MaterialPageRoute<Null>(
          //                           builder: (BuildContext context) {
          //                         return new MyApp444(value: ff);
          //                       }));

          //                       //Navigator.of(context).pop();

          //                       // controller.jumpToPage(ff);
          //                       // Navigator.of(context)
          //                       //     .pop();
          //                     },
          //                   )
          //                 ],
          //               );
          //             },
          //           );
          //         },
          //       ),
          //       ListTile(
          //         title: Text('search'),
          //         onTap: () async {
          //           var kuralNo = "ஆதி";
          //           var sql =
          //               "SELECT * FROM complete1 WHERE kural_tamil1 like '%$kuralNo%'";
          //           // var sql1 = "SELECT * FROM kural where kural_no = $kuralNo";
          //           var searchResult =
          //               await db.any_query(sql, "modi_kural_comp.db");
          //           print(searchResult);
          //           Navigator.of(context).push(
          //               MaterialPageRoute<Null>(builder: (BuildContext context) {
          //             return new GlobalSearch();
          //           }));
          //         },
          //       ),
          //       ListTile(
          //         title: Text('favourites'),
          //         onTap: () async {
          //           // BackupKurals = await db.any_query("SELECT kural_no ", dbName)
          //           ResultFav = await db.any_query(
          //               'SELECT * from complete', //1 where isfav=1',
          //               //1 where isfav=1',
          //               "modi_kural_comp.db");
          //           Navigator.of(context).push(
          //               MaterialPageRoute<Null>(builder: (BuildContext context) {
          //             return new Favorite11(); // HomePage1();
          //           }));
          //         },
          //       ),
          //       ListTile(
          //         title: Text('Privacy Policy'),
          //         onTap: () {
          //           Navigator.of(context).push(
          //               MaterialPageRoute<Null>(builder: (BuildContext context) {
          //             return new MyApp2(); // HomePage1();
          //           }));
          //         },
          //       ),
          //       ListTile(
          //         title: Text('FeedBack Form'),
          //         onTap: () {
          //           Navigator.of(context).push(
          //               MaterialPageRoute<Null>(builder: (BuildContext context) {
          //             return new Feedback_ex(); // HomePage1();
          //           }));
          //         },
          //       ),
          //       ListTile(
          //         title: Text('Sharing'),
          //         onTap: () {
          //           return sharing3();
          //         },
          //       ),
          //       ListTile(
          //         title: Text('மதிப்பிடவும்'),
          //         onTap: () {
          //           return dia_rateUs();
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ));
  }
}

sharing3() {
  Share.share('App Link... www.nithra.mobi');
  return new FirstFragment();
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => FirstFragment()),
  // );
}

_onSelectItem1(String s) async {
  var db = DatabaseHelper();

  result1 = await db.any_query(
      'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="அறத்துப்பால்"',
      'modi_kural_comp.db');
  // List.generate(result1.length, (i) {
  //   Iyal(
  //     iyal_tamil: result1[i]['iyal_tamil'],
  //   );
  // });
  print(result1.length);
  print(result1);

  // Items I = new Items();
  // I = result as Items;
  // print(I.pal_tamil[0]);
}

_onSelectItem2(String s) async {
  var db = DatabaseHelper();
  result2 = await db.any_query(
      'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
      'modi_kural_comp.db');
  // List.generate(result2.length, (i) {
  //   Iyal(
  //     iyal_tamil: result2[i]['iyal_tamil'],
  //   );
  // });
  print(result2.length);
  print(result2);

  // Items I = new Items();
  // I = result as Items;
  // print(I.pal_tamil[0]);
}

_onSelectItem3(String s) async {
  var db = DatabaseHelper();
  result3 = await db.any_query(
      'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
      'modi_kural_comp.db');
  // List.generate(result3.length, (i) {
  //   Iyal(
  //     iyal_tamil: result3[i]['iyal_tamil'],
  //   );
  // });
  print(result3.length);
  print(result3);

  // Items I = new Items();
  // I = result as Items;
  // print(I.pal_tamil[0]);
}
