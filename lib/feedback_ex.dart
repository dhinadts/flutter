import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dhina/fragments/privacy_link.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

import 'device.dart';

// var url = 'https://www.nithra.mobi/apps/appfeedback.php';
var url = 'http://localhost:3000/addfeedback';

// print(await http.read('https://www.nithra.mobi/apps/appfeedback.php'));



String inf3;
String summa = "";

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo;
fetchDeviceInfo() async {
  androidInfo = await deviceInfo.androidInfo;
  print("print: ${androidInfo.device}");
  print("print: ${androidInfo.id}");
  print(" version ${androidInfo.version}");
  print("brand    ${androidInfo.brand}");
  print("host    ${androidInfo.host}");
  print("manufacturer    ${androidInfo.manufacturer}");
  print("model    ${androidInfo.model}");
  inf3 = androidInfo.manufacturer + " " + androidInfo.model;
  print("Info: $inf3");
  summa=inf3;
  return inf3;
}
 String versionName;
 String versionCode;
versions() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = packageInfo.version;
    versionCode = packageInfo.buildNumber;
    return versionCode;
  }


// String iNF1 = androidInfo.manufacturer + " " + androidInfo.model;

class Post {
  final String type = "TNPSC";
  final String vcode = "1.0.0";
  final String email;
  final String feedback;
  final String model;

  Post({type, vcode, this.model, this.email, this.feedback});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      type: json['type'],
      vcode: json['vcode'],
      email: json['email'],
      feedback: json['feedback'],
      model: json['model'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = type;
    map["vcode"] = vcode;
    map["email"] = email;
    map["feedback"] = feedback;
    map["model"] = model;
    return map;
  }
}

Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    } else {
      print(Post.fromJson(json.decode(response.body)));
      return Post.fromJson(json.decode(response.body));
    }
  });
}

class Feedback_ex extends StatelessWidget {
  final Future<Post> post;

  Feedback_ex({Key key, this.post}) : super(key: key);
  // static final CREATE_POST_URL = 'https://www.nithra.mobi/apps/appfeedback.php';
  static final CREATE_POST_URL = 'http://localhost:3000/addfeedback';
  TextEditingController titleControler = new TextEditingController();
  TextEditingController bodyControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "WEB SERVICE",
      // theme: ThemeData(
      //   primaryColor: Colors.deepOrange,
      // ),
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(
              'FeedBack Form',
              textAlign: TextAlign.center,
            ),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new TextField(
                  controller: titleControler,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 20.0),
                      hintText: "email....",
                      labelText: 'email'),
                ),
                new TextField(
                  controller: bodyControler,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 50.0),
                      hintText: "feedback....",
                      labelText: 'feedback'),
                ),
                new Text('     '),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp2()),
                    );
                  },
                  child: Text("* Private policy"),
                ),
                new Text('     '),
                new RaisedButton(
                  onPressed: () async {
                    // String exs = versions();
                    await fetchDeviceInfo();
                    
                    Post newPost = new Post(
                      email: titleControler.text,
                      feedback: bodyControler.text,
                      model: summa,
                      // vcode: exs,
                    );
                    // Post p = await createPost(CREATE_POST_URL,
                    //     body: newPost.toMap(); //);
                    // print(p.email);
                    var response = await http.post(url, body: newPost.toMap());
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print(newPost.email);
                    print("model:" + newPost.model);
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
