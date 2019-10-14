import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


var jsonData = 'assets/complete1.json';
var parsedJson = json.decode(jsonData);
// print('${parsedJson.runtimeType} : $parsedJson');

class Kural extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
print('${parsedJson.runtimeType} : $parsedJson');
    return KuralState();
  }
  
}

class KuralState extends State<Kural> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Json"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              var myData = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemCount: myData == null ? 0 : myData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // final String adhikarm_no;
//   final String adhikarm_tamil;
//   final String desc1;
//   final String desc2;
//   final String id;
//   final String isfav;
//   final String iyal_tamil;
//   final String kural_no;
//   final String kural_tamil1;
//   final String kuralvilakam_tamil;
//   final String pal_tamil;

                        Text("kural_no: " + myData[index]["kural_no"]),
                        // Text("Age: " + myData[index]["desRc1"]),
                        // Text("Height: " + myData[index]["desc2"]),
                        Text("kural_tamil1: " + myData[index]["kural_tamil1"]),
                      ],
                    ),
                  );
                },
              );
            },
            future: DefaultAssetBundle.of(context).loadString("complete1.json"),
          ),
        ),
      ),
    );
  }
}

// // import 'package:sqflite/sqflite.dart';
// import 'dart:convert';

// import 'package:flutter/material.dart';

// abstract class Kural {
//   // final String Kural_no:1;
//   final String adhikarm_no;
//   final String adhikarm_tamil;
//   final String desc1;
//   final String desc2;
//   final String id;
//   final String isfav;
//   final String iyal_tamil;
//   final String kural_no;
//   final String kural_tamil1;
//   final String kuralvilakam_tamil;
//   final String pal_tamil;

//   Kural(
//       {this.adhikarm_no,
//       this.adhikarm_tamil,
//       this.desc1,
//       this.desc2,
//       this.id,
//       this.isfav,
//       this.iyal_tamil,
//       this.kural_no,
//       this.kural_tamil1,
//       this.kuralvilakam_tamil,
//       this.pal_tamil});

//   // Kural.fromJson(Map<String, dynamic> json)
//   //     : adhikarm_no = json['adhikarm_no'],
//   //       adhikarm_tamil = json['adhikarm_tamil'];
//   factory Kural.fromJson(Map<String, dynamic> json) {
//     return Kural(
//         adhikarm_no: json['adhikarm_no'],
//         adhikarm_tamil: json['adhikarm_tamil'],
//         desc1: json['desc1'],
//         desc2: json['desc2'],
//         id: json['id'],
//         isfav: json['isfav'],
//         iyal_tamil: json['iyal_tamil'],
//         kural_no: json['kural_no'],
//         kural_tamil1: json['kural_tamil1'],
//         kuralvilakam_tamil: json['kuralvilakam_tamil'],
//         pal_tamil: json['pal_tamil']);
//   }

//   static String get jsonString => null;

//   // static Map<String, > get userMap => null;

//   Map<String, dynamic> toJson() => {
//         'adhikarm_no': adhikarm_no,
//         'adhikarm_tamil': adhikarm_tamil,
//         'desc1': desc1,
//         'desc2': desc2,
//         'id': id,
//         'isfav': isfav,
//         'iyal_tamil': iyal_tamil,
//         'kural_no': kural_no,
//         'kural_tamil1': kural_tamil1,
//         'kuralvilakam_tamil': kuralvilakam_tamil,
//         'pal_tamil': pal_tamil,
//       };

// Map kuralMap = jsonDecode(jsonString);
// var kural = Kural.fromJson(kuralMap);

// print('${kural.kural_tamil1}!');
// print('We sent the verification link to ${kural.pal_tamil}.');

// }
