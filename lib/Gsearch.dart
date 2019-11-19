import 'package:dhina/cate2pgview.dart';
import 'package:dhina/newMainpage1.dart';
import 'package:flutter/material.dart';

import 'package:dhina/db/dbhelper.dart';

var db = DatabaseHelper();
var searchResult1;

class GlobalSearch extends StatefulWidget {
  GlobalSearch({Key key}) : super(key: key);

  @override
  _GlobalSearchState createState() => _GlobalSearchState();
}

class _GlobalSearchState extends State<GlobalSearch> {
  TextEditingController inputControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "WEB SERVICE",
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          // primary: true,
          appBar: AppBar(
            // backgroundColor: Color(0xFF),
            title: Text(
              'குறள் தேடல்...',
              textAlign: TextAlign.center,
            ),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new TextField(
                  controller: inputControler,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 20.0),
                      hintText: "Text search/உரைத்தேடல் ",
                      labelText: 'search/தேடல்: '),
                ),
                new Text('     '),
                new Text('     '),
                new RaisedButton(
                  onPressed: () async {
                    var kuralWord = (inputControler.text);
                    print(kuralWord);
                    var sql =
                        'SELECT * FROM complete1 WHERE kural_tamil1 like "%$kuralWord%"';
                    searchResult1 =
                        await db.any_query(sql, "modi_kural_comp.db");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GlobalSearchingKural()),
                    );
                    // print($iNF1);
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GlobalSearchingKural extends StatelessWidget {
  const GlobalSearchingKural({Key key}) : super(key: key);

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
          title: Text('குறள்கள்:'),
        ),
        body: ListView.builder(
            itemCount: searchResult1.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyApp444(
                                value:
                                    (searchResult1[index]['kural_no']) -1 )));
                    //GlobalSearchingNavigation() ));
                    // SearchingKural())); // null = AdhikaramKural()
                  },
                  child: Card(
                  child: ListTile(
                    leading: Text("${searchResult1[index]['kural_no']}"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: new Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // new SingleChildScrollView(
                      //scrollDirection: Axis.vertical,
                      // primary: true,
                      Expanded(
                         child: Text(
                          '${searchResult1[index]['kural_tamil1']}',
                          textScaleFactor: 1.0,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          style: new TextStyle(
                            fontSize: 13,
                            // fontWeight:
                            //     FontWeight.bold
                          ), // textScaleFactor: 1.0,
                        ),
                      )
                    ]),)));},));

    /*          Card(
                                       child: Text("${searchResult1[index]['kural_tamil1']}",  style: TextStyle(
                                                                                    fontSize: 15,
                                                                                    color: Colors.deepPurpleAccent, //purple[300],
                                                                                    // decoration: TextDecoration.underline,
                                                                                    // decorationColor: Colors.red,
                                                                                    // decorationStyle: TextDecorationStyle.wavy,
                                                                                    // fontWeight: FontWeight.bold,
                                                                                  ),), );
                                    }*/
    //),
  }
}

//                             class GlobalSearchingNavigation extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return

//     null;
//   }
// }
