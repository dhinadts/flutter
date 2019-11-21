import 'package:dhina/Gsearch.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/db/sharedpref.dart';
import 'package:dhina/dia_rating.dart';
import 'package:dhina/feedback_ex.dart';
import 'package:dhina/firstPage.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:dhina/fragments/privacy_link.dart';
import 'package:dhina/fragments/second_fragment.dart';
import 'package:dhina/main_pages/favorite_Displays.dart';
import 'package:dhina/pages/home_page.dart';
import 'package:dhina/tapOption.dart';
import 'package:flutter/material.dart';
import 'package:dhina/newMainpage1.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:dhina/main.dart';


import '../cate2pgview.dart';
import '../newMainpage1.dart';

var db = DatabaseHelper();
var prefs = Shared_Preference();
// var newData;
//List<Map<String, dynamic>> newData1;

TextEditingController _textFieldController = TextEditingController();

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
    dbmove() async {
      await db.db_move();
      //newData1 = await db.any_query("select * from complete1", "modi_kural_comp.db");
      ResultFav =  await db.any_query('SELECT * from complete', //1 where isfav=1', 
                   //1 where isfav=1', 
                   "modi_kural_comp.db");
    }

    super.initState();
    dbmove();
    // dbhelp.db_move();
    // _loadAStudentAsset();
  }
  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      // title: appTitle,
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,

      home: Scaffold(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp2()),
                );
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
            children: <Widget>[
              DrawerHeader(
                child: Text('திருக்குறள்'),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('முகப்பு'),
                onTap: () async {
                  a = await prefs.getDouble("fontSize1");
                  newData1 = await db.any_query(
                      "select * from complete1", "modi_kural_comp.db");
                  await Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new MyApp12345();
                      
                  }));
                  // await Navigator.of(context).push(
                  //     MaterialPageRoute<Null>(builder: (BuildContext context) {
                  //   return new MyApp4(fontSize1 : fontSize1);
                  // }));
                },
              ),
              ListTile(
                title: Text('முழு பட்டியல்'),
                onTap: () async {
                  a = await prefs.getDouble("fontSize1");
                  newData1 = await db.any_query(
                      "select * from complete1", "modi_kural_comp.db");
                  await Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
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
                title: Text('வகைப்பட்டியல்'),
                onTap: () async {
                  result = await db.any_query(
                      'select DISTINCT pal_tamil from complete1',
                      'modi_kural_comp.db');
                  await _onSelectItem1(result[0]['pal_tamil']);
                  await _onSelectItem2(result[1]['pal_tamil']);
                  await _onSelectItem3(result[2]['pal_tamil']);
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new TabBarDemo();
                  }));
                },
              ),
              ListTile(
                title: Text('செல்'),
                onTap: () async {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      var _value;
                      return AlertDialog(
                        title: Text('குறள் எண்ணை உள்ளிடவும்'),
                        content: TextFormField(
                          keyboardType: TextInputType
                              .number, //numberWithOptions(decimal: true),
                          controller: _textFieldController,
                          decoration: InputDecoration(hintText: "குறள் எண்: "),
                          onSaved: (input) => _value = int.tryParse(input),
                          // textInputAction: controller.jumpTo(value),
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
                            onPressed: () {
                              Navigator.of(context).pop();
                              print(
                                  "text.controller:  ${_textFieldController.text}");
                              var abcd = (_textFieldController.text).toString();
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
                title: Text('தேடல்'),
                onTap: () async {
                  var kuralNo = "ஆதி";
                  var sql =
                      "SELECT * FROM complete1 WHERE kural_tamil1 like '%$kuralNo%'";
                  // var sql1 = "SELECT * FROM kural where kural_no = $kuralNo";
                  var searchResult =
                      await db.any_query(sql, "modi_kural_comp.db");
                  print(searchResult);
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new GlobalSearch();
                  }));
                },
              ),
              ListTile(
                title: Text('பிடித்தவைகள்'),
                onTap: () async {
                  // BackupKurals = await db.any_query("SELECT kural_no ", dbName)
                  ResultFav = await db.any_query(
                      'SELECT * from complete', //1 where isfav=1',
                      //1 where isfav=1',
                      "modi_kural_comp.db");
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new Favorite11(); // HomePage1();
                  }));
                },
              ),
              ListTile(
                title: Text('தனியுரிமைக் கொள்கை'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new MyApp2(); // HomePage1();
                  }));
                },
              ),
              ListTile(
                title: Text('கருத்து'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new Feedback_ex(); // HomePage1();
                  }));
                },
              ),
              ListTile(
                title: Text('பகிரவும்'),
                onTap: () {
                  return sharing3();
                },
              ),
              ListTile(
                title: Text('மதிப்பிடவும்'),
                onTap: () {
                  return dia_rateUs();
                },
              ),
            ],
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
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(title)),
      body: Container(
          color: Colors.grey,
          child: Center(
              child: new SizedBox(
            width: 300.0,
            height: 500.0,
            child: new Column(
              // new SizedBox(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
                Card(
                  color: Colors.grey,
                  child: RaisedButton(
                      color: Colors.white,
                      // child: SizedBox(
                      //     height: 60,
                      child: Container(
                          margin: EdgeInsets.all(8.0),
                          height: 50,
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/play1.png',
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                    "                 ஆரம்பிக்க               "),
                                Text(
                                    "  --------------------------------------"),
                                Text(
                                    "                   Start                "),
                              ],
                            )
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
                        margin: EdgeInsets.all(8.0),
                        height: 50,
                        child: Row(children: <Widget>[
                          Image.asset(
                            'assets/skip.png',
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text("                  தொடர்க               "),
                              Text("  --------------------------------------"),
                              Text("                 Continue               "),
                            ],
                          )
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
                          margin: EdgeInsets.all(8.0),
                          height: 50,
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/category.png',
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                    "               வகைப்பட்டியல்             "),
                                Text(
                                    "  --------------------------------------"),
                                Text(
                                    "                 Category               "),
                              ],
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
                          margin: EdgeInsets.all(8.0),
                          height: 50,
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/gobutton.png',
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                // Text("hi"),
                                Text(
                                    "                  செல்                  "),
                                Text(
                                    "  --------------------------------------"),
                                Text(
                                    "                  Goto                  "),
                              ],
                            ))
                          ]))
                      // )
                      // )
                      ,
                      onPressed: () async {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            var _value;
                            return AlertDialog(
                              title: Text('குறள் எண்ணை தட்டவும்'),
                              content: TextFormField(
                                keyboardType: TextInputType
                                    .number, //numberWithOptions(decimal: true),
                                controller: _textFieldController,
                                decoration:
                                    InputDecoration(hintText: "குறள் எண்: "),
                                onSaved: (input) =>
                                    _value = int.tryParse(input),
                                // textInputAction: controller.jumpTo(value),
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
                    )),
                Card(
                    color: Colors.grey,
                    child: RaisedButton(
                      color: Colors.white,
                      // child: SizedBox(
                      //     height: 60,
                      child: Container(
                          margin: EdgeInsets.all(8.0),
                          height: 50,
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/search.png',
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                    "                  தேடல்                 "),
                                Text(
                                    "  --------------------------------------"),
                                Text(
                                    "                  Search                "),
                              ],
                            ))
                          ])
                          //)
                          //)
                          ),
                      onPressed: () async {
                        var kuralNo = "ஆதி";
                        var sql =
                            "SELECT * FROM complete1 WHERE kural_tamil1 like '%$kuralNo%'";
                        // var sql1 = "SELECT * FROM kural where kural_no = $kuralNo";
                        var searchResult =
                            await db.any_query(sql, "modi_kural_comp.db");
                        print(searchResult);
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new GlobalSearch();
                        }));
                      },
                    )),
                // ]),
                /*
                  Card(
                      color: Colors.grey,
                      child: RaisedButton(
                        color: Colors.white,
                        // child: SizedBox(
                        //     height: 60,
                        child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 50,
                            child: Row(children: <Widget>[
                              Image.asset(
                                'assets/tamil_calendar.webp',
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                      "       நித்ரா தமிழ் நாட்காட்டி           "),
                                  Text(
                                      "  -------------------------------------"),
                                  Text(
                                      "         Nithra Tamil Calendar        "),
                                ],
                              ))
                            ])
                            //)
                            //)
                            ),
                        onPressed: () => 
                          // Navigator.of(context).push(MaterialPageRoute<Null>(
                          //     builder: (BuildContext context) {
                          //   return new MyApp444(
                          //     value: 0,
                          //     currentPageValue: 0,
                          //     fontSize1: 0,
                          //   );
                          // }));
                          //OpenAppstore.launch(androidAppId: "com.facebook.katana&hl=ko", iOSAppId: "284882215")
                          LaunchReview.launch(        androidAppId: "nithra.tamil.quiz",        iOSAppId: "id1484332988")

                        ,
                      )),

                      */
                RaisedButton(
                  color: Color(1100),
                  child: Text('Favourites using "isfav'),
                  onPressed: () async {
                    ResultFav = await db.any_query(
                        'SELECT * from complete1 where isfav=1',
                        //1 where isfav=1',
                        "modi_kural_comp.db");
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new Favorite11(); // HomePage1();
                    }));
                    // OpenAppstore.launch(androidAppId: "com.facebook.katana&hl=ko", iOSAppId: "284882215");
                  },
                ),
                RaisedButton(
                  child: Text('Favourites using complete table'),
                  color: Color(5400),
                  onPressed: () async {
                    // BackupKurals = await db.any_query("SELECT kural_no ", dbName)
                    ResultFav = await db.any_query(
                        'SELECT * from complete', //1 where isfav=1',
                        //1 where isfav=1',
                        "modi_kural_comp.db");
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new Favorite11(); // HomePage1();
                    }));
                  },
                ),
              ],
            ),
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
    );
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
