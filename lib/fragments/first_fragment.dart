import 'dart:core';
import 'dart:core' as prefix0;

import 'package:flutter/material.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/model/Getter_setter.dart';

List<Map> x = [];
List<String> items = <String>[];
List<Map<String, dynamic>> result;

List<Map> y = new Items() as List<Map>;

class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        // return new Container(
// width: 300.0,
        // padding: const EdgeInsets.only(top: 16.0),
        // )
        child: new Column(
      // new SizedBox(
      //  mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[
        RaisedButton(
            color: Color(1000),
            child: Text('start'),
            onPressed: () {
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text("Start"),
                    content: new Text("Starting"),
                  ));
            }),
        RaisedButton(
          color: Color(1100),
          child: Text('Continue'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondScreen();
            }));
          },
        ),
        RaisedButton(
          child: Text('Tamil calendar'),
          color: Color(5400),
          onPressed: () {
            print('hi');
          },
        ),
      ],
    ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: Text('Go To categories'),
          onPressed: () {
            //Use`Navigator` widget to pop oir go back to previous route / screen
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewerActivity1()),
            );
          },
        ),
      ),
    );
  }
}

class ViewerActivity1 extends StatelessWidget {
  // var pal_tamil;

  // get pal_tamil => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('third Screen'),
        ),
        body: Center(
            child: new Column(
          children: <Widget>[
            new RaisedButton(
              color: Colors.red,
              child: Text('Categories'),
              onPressed: () async {
                //Use`Navigator` widget to pop oir go back to previous route / screen
                var db = DatabaseHelper();
                result = await db.any_query(
                    'select DISTINCT pal_tamil from complete1',
                    'modi_kural_comp.db');
                List.generate(result.length, (i) {
                  Items(
                    pal_tamil: result[i]['pal_tamil'],
                  );
                });
                print(result.length);
                print(result);
                // Items I = new Items();
                // I = result as Items;
                // print(I.pal_tamil[0]);
                x = result;
                y = result;
                // Items P = new Items(); // as List<Map<String, >>;
                // Items P = new Items();
                // var P = new Pal();
                // P = result as Pal;
                // var z;
                // z = P[0].pal_tamil ;
                // // print("P is $P");
                // print(z);
                // print("Pal is ${P.pal_tamil[1]}");
                // print("tell it    ${result[1]}");
                // // List<Map> x = result; // as Items; // as Items;

                // one.forEach((row) => print(row));
                // items = result.toList();
                //items1 = result.toList();

                result.forEach((row) => 
                  print("pal in tamil: ${row['pal_tamil']}"));
                print("${result[0]['pal_tamil']}");
                print("${result[1]['pal_tamil']}");
                print("${result[2]['pal_tamil']}");
                // print("${row['pal_tamil']}");
                // print(x['pal_tamil']);
                // List<Map> x = result; // as Items; // as Items;
                // Items one = result as Items;
                // print("hi    ${y[1]}");
                // return result.toList();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListedViewEx()),
                );
              },
            ),
//             new Expanded(
//                 child: new ListView(
//               padding: new EdgeInsets.symmetric(vertical: 8.0),
//               children: <Widget>[
//                 Text("$x"),
// // Text("${result[0]['pal_tamil']}"),
// //                 Text("${result[1]['pal_tamil']}"),
// //                 Text("${result[2]['pal_tamil']}"),
//               ],
//             )),
          ],
        )));
  }
}

class Pal {
  String pal_tamil;
  Pal({this.pal_tamil});

  Pal.map(dynamic obj) {
    this.pal_tamil = obj['pal_tamil'];
  }
// String get pal_tamil => pal_tamil;
  // String get pal_tamil => pal_tamil;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['pal_tamil'] = pal_tamil;
    return map;
  }

  Pal.fromMap(Map<String, dynamic> json) {
    this.pal_tamil = json['pal_tamil'];
  }
}

class Items {
  String pal_tamil;
  Items({this.pal_tamil});

  Items.map(dynamic obj) {
    this.pal_tamil = obj['pal_tamil'];
  }

  // String get pal_tamil => pal_tamil;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['pal_tamil'] = pal_tamil;
    return map;
  }

  Items.fromMap(Map<String, dynamic> json) {
    this.pal_tamil = json['pal_tamil'];
  }
  //bool isSelected;
}

class ListedViewEx extends StatelessWidget {
  final List<String> items1;

  const ListedViewEx({Key key, this.items1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return new ListView.builder(
      itemCount: result.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new Column(
               children: <Widget>[
               Text('${result[index]['pal_tamil']}',  style: TextStyle(
          fontSize: 20.0, color: Colors.green, background: Paint(),
        )
        ),
              // Text("${result[0]['pal_tamil']}"),
              //   Text("${result[1]['pal_tamil']}"),
              //   Text("${result[2]['pal_tamil']}"),
            ],
          );
        });
  }
}
