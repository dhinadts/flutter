// tenkurals from adhikaram

import 'package:dhina/tapOption.dart';
import 'package:flutter/material.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:dhina/searchingKural.dart';
import 'Palkal_Class/Aram.dart';
import 'cate2pgview.dart';
import 'main_pages/starting4.dart';

var GlobalValueSet;

class TenSearchingKural extends StatefulWidget {
  TenSearchingKural({Key key}) : super(key: key);

  @override
  _TenSearchingKuralState createState() => _TenSearchingKuralState();
}

class _TenSearchingKuralState extends State<TenSearchingKural> {
  @override
  void initState() {
    super.initState();

    // result = db.any_query(query, dbName)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        primary: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Scaffold.of(context).openDrawer();
                //       Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FirstFragment()),
                // );
                Navigator.pop(context);
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text('${adhikaramIndex[indexKey]['adhikarm_tamil']}'),
      ),
      body: new ListView.builder(
          itemCount: adhikaramIndex.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return GestureDetector(
                onTap: () {
                  print("HI");
                  // indexKey = index;
                  // indexResult = result1;
                  //print(indexResult);
                  // _adhikaramDisplay();
                  // var db = DatabaseHelper();
                  // var sql =
                  //     'SELECT * from complete1 where adhikarm_tamil = "${iyalIndex[index]['kural_tamil1']}"';
                  // adhikaramIndex = await db.any_query(sql, "modi_kural_comp.db");
                  print(adhikaramIndex.length);
// var ref_carosel = MyApp4();
                  var jPAGE = (adhikaramIndex[index]["kural_no"]);
                  print(jPAGE);
                  var abcd = jPAGE.toString();
                  print("abcd " + abcd);
                  var ff = int.parse(abcd) - 1;
                  // controller.jumpToPage(ff);
                  // Navigator.of(context).pop();
// var jjj = MyApp4();
// controller.jumpToPage(jPAGE);
                  //  Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => // null ));
                  // MyApp4())); // null = AdhikaramKural()
                  var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new MyApp44(value: ff),
                );
                Navigator.of(context).push(route);

                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp4(GlobalValueSet: ff)));

                },
                child: SizedBox(
                    width: 150 * MediaQuery.of(context).devicePixelRatio,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      title: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            '${adhikaramIndex[index]['kural_tamil1']}',
                            style: new TextStyle(
                                fontWeight:
                                    FontWeight.bold), // textScaleFactor: 1.0,
                          ),
                        ],
                      ),
                    )));
          }),
    );
  }
}
