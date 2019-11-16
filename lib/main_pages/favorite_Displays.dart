

import 'package:dhina/tapOption.dart';
import 'package:flutter/material.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/fragments/first_fragment.dart';



import '../cate2pgview.dart';
import '../searchingKural.dart';


// List<Map<String, dynamic>> result2;


var db = DatabaseHelper();
class Favorite11 extends StatefulWidget {
  @override
  FavState createState() {
    return new FavState();
  }
}

class FavState extends State<Favorite11> {
  
  @override
  void initState() {
    // ResultFav = await db.any_query('SELECT * from complete', "modi_kural_comp.db");
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourites',
            textAlign: TextAlign.justify,
          ),
        ),
        body: new ListView.builder(
          itemCount: ResultFav.length,
          itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new GestureDetector(
                  onTap: () async {
                     print("HI");
                    // indexKey = i;
                    // indexResult = ResultFav;
                    // print(indexResult);
                    // _adhikaramDisplay();
                    // var db = DatabaseHelper();
                    // var sql =
                    //     'SELECT * from complete';
                    // ResultFav = await db.any_query(sql, "modi_kural_comp.db");


                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyApp44(value: (ResultFav[i]['kural_no']-1 ),))); // null = AdhikaramKural()
                  },
                  // child: Expanded(
                  child: ListTile(
                    
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                        child: new Text(
                          ResultFav[i]['kural_tamil1'],
                          textScaleFactor: 1.0,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          style: new TextStyle(
                            fontSize: 13,
                          // style: new TextStyle(fontWeight: FontWeight.bold),
                        ))),
                      ],
                    ),
                  ), 
                  // )
                  ),

              
            ],
          ),
        ));
  }
}
