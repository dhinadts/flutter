// import 'package:dhina/tapOption.dart';
// import 'package:flutter/material.dart';

// // List<Map<String, dynamic>> result2;

// class Aram extends StatefulWidget {
//   @override
//   AramState createState() {
//     return new AramState();
//   }
// }

// class AramState extends State<Aram> {
//   var xyz = TabBarDemo();

//   @override
//   void initState() {
//     super.initState();
//     // _onSelectItem2(result[1]['pal_tamil']);

//     // _onSelectItem1(result1[0]['pal_tamil']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new ListView.builder(
//       itemCount: result2.length,
//       itemBuilder: (context, i) => new Column(
//         children: <Widget>[
//           new Divider(
//             height: 10.0,
//           ),
//           new GestureDetector(
//               onTap: () async {
//                 // print("HI");
//                 await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => null)); //null = AdhikaramKural()
//               },
//               child:
//               new SingleChildScrollView(
//                   child: ListTile(
//                 title: new Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     new Text(
//                       result1[i]['iyal_tamil'],
//                       style: new TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               )))
//         ],
//       ),
//     );
//   }
// }

// // _onSelectItem2(String s) async {
// //   var db = DatabaseHelper();
// //   result2 = await db.any_query(
// //       'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
// //       'modi_kural_comp.db');
// //   // List.generate(result2.length, (i) {
// //   //   Iyal(
// //   //     iyal_tamil: result2[i]['iyal_tamil'],
// //   //   );
// //   // });
// //   print(result2.length);
// //   print(result2);

// //   // Items I = new Items();
// //   // I = result as Items;
// //   // print(I.pal_tamil[0]);
// // }

import 'package:dhina/pages/home_page.dart';
import 'package:dhina/tapOption.dart';
import 'package:flutter/material.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:dhina/tapOption.dart';

import '../controllers.dart';
import '../searchingKural.dart';
import 'Adhikaramkural.dart';

// List<Map<String, dynamic>> result2;

class Aram extends StatefulWidget {
  @override
  AramState createState() {
    return new AramState();
  }
}

class AramState extends State<Aram> {
  var xyz = TabBarDemo();
  @override
  void initState() {
    super.initState();
    iyalTamil(result[0]['pal_tamil']);
    // _adhikaramDisplay();

    // _onSelectItem1(result1[0]['pal_tamil']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'இயல்கள்',
            textAlign: TextAlign.justify,
          ),
        ),
        body: new ListView.builder(
          itemCount: result1.length,
          itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new GestureDetector(
                  onTap: () async {
                    // print("HI");
                    indexKey = i;
                    indexResult = result1;
                    print(indexResult);
                    // _adhikaramDisplay();
                    var db = DatabaseHelper();
                    var sql =
                        'SELECT DISTINCT adhikarm_tamil from complete1 where iyal_tamil = "${indexResult[i]['iyal_tamil']}"';
                    iyalIndex = await db.any_query(sql, "modi_kural_comp.db");
                    print(iyalIndex);

                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchingKural())); // null = AdhikaramKural()
                  },
                  child: ListTile(
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          result1[i]['iyal_tamil'],
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))

              /*
                  ListTile(
                    
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          iyal_S[i]['iyal_tamil'],
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ) */
            ],
          ),
        ));
  }
}

// _onSelectItem2(String s) async {
//   var db = DatabaseHelper();
//    result2 = await db.any_query(
//       'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
//       'modi_kural_comp.db');
//   List.generate(result2.length, (i) {
//     Iyal(
//       iyal_tamil: result2[i]['iyal_tamil'],
//     );
//   });
//   print(result2.length);
//   print(result2);

//   // Items I = new Items();
//   // I = result as Items;
//   // print(I.pal_tamil[0]);
// }
// _adhikaramDisplay() async {

// var db = DatabaseHelper();
// var sql = "SELECT DISTINCT adhikarm_tamil from complete1 where iyal_tamil = ${indexResult[indexKey]['iyal_tamil']}";
// iyalIndex = await db.any_query(sql, "modi_kural_comp.db");
// print(iyalIndex);

// }
