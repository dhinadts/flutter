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
              'Kural Searching...',
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
                      hintText: "Type word in tamil",
                      labelText: 'search'),
                ),
                
                new Text('     '),
                
                new Text('     '),
                new RaisedButton(
                  onPressed: () async {
                    
                      var kuralWord = (inputControler.text);
                      print(kuralWord);
                      var sql = 'SELECT * FROM complete1 WHERE kural_tamil1 like "%$kuralWord%"';
                      searchResult1 = await db.any_query(sql, "modi_kural_comp.db");
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GlobalSearchingKural()),
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
        title: Text('Results'),
      ),
      body: ListView.builder(
        itemCount: searchResult1.length,
        itemBuilder: (BuildContext context, int index) {
          return new Text("${searchResult1[index]['kural_tamil1']}",  style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.deepPurpleAccent, //purple[300],
                                                        // decoration: TextDecoration.underline,
                                                        // decorationColor: Colors.red,
                                                        // decorationStyle: TextDecorationStyle.wavy,
                                                        // fontWeight: FontWeight.bold,
                                                      ),);
        }
    ));
  }
}
