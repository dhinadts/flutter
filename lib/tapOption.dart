import 'package:dhina/Palkal_Class/Inpam.dart';
import 'package:flutter/material.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:dhina/db/dbhelper.dart';
import 'package:dhina/pages/home_page.dart';
import 'Palkal_Class/Aram.dart';
import 'Palkal_Class/Porul.dart';
import 'Palkal_Class/Inpam.dart';

// void main() {
//   runApp(TabBarDemo());
// }
//  List<Map<String, dynamic>> result1, result2, result3;
var db = DatabaseHelper();
var indexKey;
var indexResult;
var iyalIndex;
// String $aaaa;
class TabBarDemo extends StatefulWidget { 

  @override
  TabState createState() {
    return new TabState();
  }
}

class TabState extends State<TabBarDemo> {

 @override
  void initState() {
    super.initState();
  //  _onSelectItem1(result[0]['pal_tamil']);
  //  _onSelectItem2(result[1]['pal_tamil']);
  //  _onSelectItem3(result[2]['pal_tamil']);
   // print("${result1.length}");

   
     // _onSelectItem1(result1[0]['pal_tamil']);
    }
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "அறம்",
                  icon: Icon(Icons.directions_car),
                ),
                Tab(text: "பொருள்", icon: Icon(Icons.directions_transit)),
                Tab(text: "இன்பம்", icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('முப்பால்'),
          ),
          body: TabBarView(
            children: <Widget>[
              new Aram(),
              // Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreenWithData(person: new Person("Priyank","28"))));
              new Porul(),
              new Inpam(),
              // new GestureDetector(
              //     child: Text("${result[1]['pal_tamil']}"),
              //     onTap: () async => {
              //           await _onSelectItem1(result[1]['pal_tamil']),
              //           await Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => ListedViewEx1()),
              //           )
              //         }),
              // new GestureDetector(
              //     child: Text("${result[2]['pal_tamil']}"),
              //     onTap: () async => {
              //           await _onSelectItem1(result[2]['pal_tamil']),
              //           await Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => ListedViewEx1()),
              //           )
              //         })
            ],
          ),
        ),
      ),
    );
  }

  
}

class ListedViewEx1 extends StatelessWidget {
  final List<String> items1;

  const ListedViewEx1({Key key, this.items1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: result1.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new Column(
            children: <Widget>[
              Text('${result1[index]['iyal_tamil']}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    background: Paint(),
                  )),
              // Text("${result[0]['pal_tamil']}"),
              //   Text("${result[1]['pal_tamil']}"),
              //   Text("${result[2]['pal_tamil']}"),
            ],
          );
        });
  }
}

// _onSelectItem1(String s) async {
//   var db = DatabaseHelper();
  
//   result1 = await db.any_query(
//       'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="அறத்துப்பால்"',
//       'modi_kural_comp.db');
//   // List.generate(result1.length, (i) {
//   //   Iyal(
//   //     iyal_tamil: result1[i]['iyal_tamil'],
//   //   );
//   // });
//   print(result1.length);
//   print(result1);

//   // Items I = new Items();
//   // I = result as Items;
//   // print(I.pal_tamil[0]);
// }
// _onSelectItem2(String s) async {
//   var db = DatabaseHelper();
//   result2 = await db.any_query(
//       'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
//       'modi_kural_comp.db');
//   // List.generate(result2.length, (i) {
//   //   Iyal(
//   //     iyal_tamil: result2[i]['iyal_tamil'],
//   //   );
//   // });
//   print(result2.length);
//   print(result2);

//   // Items I = new Items();
//   // I = result as Items;
//   // print(I.pal_tamil[0]);
// }

// _onSelectItem3(String s) async {
//   var db = DatabaseHelper();
//    result3 = await db.any_query(
//       'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
//       'modi_kural_comp.db');
//   // List.generate(result3.length, (i) {
//   //   Iyal(
//   //     iyal_tamil: result3[i]['iyal_tamil'],
//   //   );
//   // });
//   print(result3.length);
//   print(result3);

//   // Items I = new Items();
//   // I = result as Items;
//   // print(I.pal_tamil[0]);
// }





// class iyal {

//   String iyal_tamil;
//   Pal({this.iyal_tamil});

//   Pal.map(dynamic obj) {
//     this.iyal_tamil = obj['iyal_tamil'];
//   }
// // String get pal_tamil => pal_tamil;
//   // String get pal_tamil => pal_tamil;

//   Map<String, dynamic> toMap() {
//     var map = new Map<String, dynamic>();
//     map['pal_tamil'] = iyal_tamil;
//     return map;
//   }

//   Pal.fromMap(Map<String, dynamic> json) {
//     this.pal_tamil = json['pal_tamil'];
//   }
// }

// class Items {
//   String pal_tamil;
//   Items({this.pal_tamil});

//   Items.map(dynamic obj) {
//     this.pal_tamil = obj['pal_tamil'];
//   }

//   // String get pal_tamil => pal_tamil;

//   Map<String, dynamic> toMap() {
//     var map = new Map<String, dynamic>();
//     map['pal_tamil'] = pal_tamil;
//     return map;
//   }

//   Items.fromMap(Map<String, dynamic> json) {
//     this.pal_tamil = json['pal_tamil'];
//   }
//   //bool isSelected;
// }
// }
