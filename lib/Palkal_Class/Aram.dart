import 'package:dhina/tapOption.dart';
import 'package:flutter/material.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:dhina/tapOption.dart';

import '../controllers.dart';
import 'Adhikaramkural.dart';

List<Map<String, dynamic>> result2;

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
    _onSelectItem2(result[1]['pal_tamil']);

    // _onSelectItem1(result1[0]['pal_tamil']);
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: result2.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 10.0,
          ),
          new GestureDetector(
              onTap: () async {
                // print("HI");
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdhikaramKural()));
              },
              child:   new SingleChildScrollView(
              
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
              )
          )
          )
              
        ],
      ),
    );
  }
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
