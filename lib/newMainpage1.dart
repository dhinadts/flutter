import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:dhina/SimpleSlider1.dart';
import 'package:dhina/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';
// import 'package:flutter/cupertino.dart';

import 'Gsearch.dart';
import 'db/dbhelper.dart';
import 'fragments/first_fragment.dart';
import 'package:dhina/main.dart';
// import 'package:clipboard_manager/clipboard_manager.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

int value1;
var favKural;
bool _isFavorited = false;
bool _isfav = false;

var db = DatabaseHelper();
double valueHolder = 0.0;
ByteData bytes; // = await rootBundle.load('assets/valluvar.png');

// List<Map<String, dynamic>> newData1;
List<Map<String, dynamic>> testR;
List<Map<String, dynamic>> resFav;
List<Map<String, dynamic>> favArray;
List<Map<String, dynamic>> summaR;
var currentPageValue = 0;
PageController controller = PageController();

class MyApp444 extends StatefulWidget {
  final int value;
  final int currentPageValue;
  MyApp444(
      {Key key, this.value, this.currentPageValue, prefix0.double fontSize1})
      : super(key: key);

  @override
  MyApp444State createState() => MyApp444State();
}

class MyApp444State extends State<MyApp444> {
  List data;
  // PageController controller = PageController();
  // var vv = value) as prefix0.double();
  // PageController controller = PageController(initialPage: value, keepPage: false);
  // var currentPageValue = 0;
  // =0.0;
  TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ui.Image image;
  bool isImageloaded = false;

  prefix0.int index1;

  double _fontSize11 = 0.0;

  void _showFontSizePickerDialog() async {
    // <-- note the async keyword here

    // this will contain the result from Navigator.pop(context, result)
    _fontSize11 = await prefs.getDouble("fontSize1");

    final selectedFontSize = await showDialog<double>(
      context: context,
      builder: (context) => FontSizePickerDialog(initialFontSize: _fontSize11),
    );

    // execution of this code continues when the dialog was closed (popped)

    // note that the result can also be null, so check it
    // (back button or pressed outside of the dialog)
    if (selectedFontSize != null) {
      setState(() {
        _fontSize11 = selectedFontSize;
      });
      a = _fontSize11;
      prefix0.print(_fontSize11);
      await prefs.setdouble("fontSize1", _fontSize11);
    }
  }

  @override
  void initState() {
    controller = PageController(
      initialPage: widget.value,
      keepPage: true,
    );
    currentPageValue = widget.currentPageValue;

    init();
    super.initState();
    // _loadAStudentAsset();
    loadDb();
    favouriteTable();

    controller.addListener(() {
      // summa(controller.page as prefix0.int);
      summaR = db.any_query(
          "SELECT * from complete where kural_no = ($currentPageValue + 1)",
          "modi_kural_comp.db");
      setState(() {
        // print("page value ${controller.page}");
        currentPageValue = controller.page
            as int; // as prefix0.int; // widget.value as prefix0.double; //  as prefix0.int; // .toInt() as double;
        if (summaR.isEmpty) {
          _isFavorited = false;
          _isfav = false;
        } else {
          _isFavorited = true;
          _isfav = true;
        }

        /*
        try {
          summaR = db.any_query("SELECT * from complete where kural_no = ($currentPageValue + 1)", "modi_kural_comp.db");
          if (summaR.isEmpty) {
            _isFavorited = false;
            _isfav = false;
          } else {
            _isFavorited = true;
            _isfav = true;
          }
        } catch (e) {} 
        */
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('assets/valluvar.jpeg');
    image = await loadImage(new Uint8List.view(data.buffer));
  }

  loadDb() async {
    newData1 =
        await db.any_query("select * from complete1", "modi_kural_comp.db");
  }

  favouriteTable() async {
    // resFav = await db.any_query(
    //     // "SELECT * from complete where isfav = 0 and kural_no =$favKural",
    //     "SELECT * from complete", // where kural_no = $favTest",
    //     "modi_kural_comp.db");
    // if (resFav.isEmpty) {
    //   _isFavorited = false;
    // } else {
    //   favArray = await db.any_query(
    //       "SELECT id from complete", // where kural_no = $favTest",
    //       "modi_kural_comp.db");
    //   prefix0.print("resFav+ $favArray");
    // }
    resFav = await db.any_query(
        // "SELECT * from complete where isfav = 0 and kural_no =$favKural",
        "SELECT * from complete1 where isfav =1", // where kural_no = $favTest",
        "modi_kural_comp.db");
    if (resFav.isEmpty) {
      _isFavorited = false;
      _isfav = false;
    } else {
      favArray = await db.any_query(
          "SELECT id from complete1 where isfav = 1", // where kural_no = $favTest",
          "modi_kural_comp.db");
      prefix0.print("resFav+ $favArray");
    }
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  Widget _buildImage() {
    if (this.isImageloaded) {
      return new CustomPaint(
        child: Text(
            "its dhinakaran"), // Text("${newData[index]['kural_no']}: ${newData[index]['kural_tamil1']}"),
        painter: new ImageEditor(image: image),
      );
    } else {
      return new Center(child: new Text('loading'));
    }
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
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text('திருக்குறள்'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.text_format),
              onPressed: () {
                _showFontSizePickerDialog();
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // openPage(context);
                // return new MyApp2();
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new GlobalSearch();
                }));
                print("searching");
              },
            ),
          ],
        ),
        body: new PageView.builder(
          // Build the ListView
          itemCount: 1330,
          controller: controller,
          // physics: NeverScrollableScrollPhysics(),
          reverse: false,
          pageSnapping: true,
          // scrollDirection: Axis.horizontal,
          onPageChanged: (int index) {
            favouriteTable();
            for (var i = 0; i < favArray.length; i++) {
              if ((index + 1) == favArray[i]['id'] &&
                  newData1[index]['id'] == favArray[i]['id']) {
                setState(() {
                  _isFavorited = true;
                  _isfav = true;
                });
              } else {
                setState(() {
                  _isFavorited = false;
                  _isfav = false;
                });
              }
            }

            // for (var i = 0; i < favArray.length; i++) {
            //   if (newData1[index]['id'] == favArray[i]['id']) {
            //     _isFavorited = true;
            //     _isfav = true;
            //   } else {
            //     _isFavorited = false;
            //     _isfav = false;
            //   }
            // }

            prefix0.print("OnPageChanegd:: index:: $index");
            summa1(index);
            summa(index);
            summa((index).round() + 1);
            summa((index).round() + 2);
            prefix0.print("rounded Index: ${index.round()}");
            // checkFavourites();
            prefix0.print(newData1[index]['kural_tamil1']);
            // prefix0.print(newData1[index+1]['kural_tamil1']);

            if (newData1[index]['isfav'] == 0) {
              _isFavorited = false;
              _isfav = false;
            } else {
              _isFavorited = true;
              _isfav = true;
            }
            summa1(index);
          },

          itemBuilder: (BuildContext context, int index) {
//             bool _isFavorited = false;
// bool _isfav = false;

            cursor = index;
            prefs.setint("cursor", cursor);
            favKural = index + 1;
            prefix0.print(favKural);
            favouriteTable();
// summaR = db.any_query("SELECT * from complete where kural_no = $favKural", "modi_kural_comp.db");
// if(summaR.isEmpty){
//   _isFavorited = false;
//   _isfav = false;
// }
// else{
//   _isFavorited = true;
//   _isfav = true;
// }
// summaR = db.any_query(query, dbName);
            // if (newData1[index]['isfav'] == 0) {
            //   _isFavorited = false;
            //   _isfav = false;
            // } else {
            //   _isFavorited = true;
            //   _isfav = true;
            // }
            // _isFavorited = 0;
            // prefix0.print("${newData1[index]['kural_tamil1']}");
            // summa(index.round() + 2);
            prefix0.print("rounded Index: ${index.round()}");
            prefix0.print("_isFavorited:: $_isFavorited");
            summa1(index);
            summa1(index - 1);

            return Card(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "குறள்: ${newData1[index]['kural_no']}", //${newData1.kural_no}",
                          style: TextStyle(fontSize: 18),
                        ),
                        // new FavoriteWidget(),
                        IconButton(
                            autofocus: false,
                            tooltip: "favourite",
                            icon: (_isFavorited == true && _isfav == true
                                ? Icon(Icons.star)
                                : Icon(Icons.star_border)),
                            color: (_isFavorited == true && _isfav == true
                                ? Colors.red[500]
                                : Colors.red),
                            onPressed: () async {
                              var favTest = (index + 1);
                              // prefix0.print("favTest:  $favTest");
                              // await summa(favTest);
                              testR = await db.any_query(
                                  // "SELECT * from complete1 where isfav = 0 and kural_no =$favTest",
                                  // "SELECT * from complete1 where kural_no = $favTest and isfav = 0",
                                  "SELECT * from complete where kural_no = $favTest",
                                  "modi_kural_comp.db");
                              prefix0.print("testR: $testR");
                              if (testR.isEmpty) {
                                //testR.contains((index+1)) ) {
                                setState(() {
                                  _isFavorited = true;
                                  _isfav = true;
                                  db.any_query(
                                      "UPDATE complete1 SET isfav=1 WHERE kural_no = ($index+1)",
                                      // "insert into complete select * from complete1 where kural_no = ($index+1)",
                                      "modi_kural_comp.db");
                                  db.any_query(
                                      //"UPDATE complete1 SET isfav=0 WHERE kural_no = $favKural",
                                      "insert into complete select * from complete1 where kural_no = ($index+1)",
                                      "modi_kural_comp.db");
                                  prefix0
                                      .print("_isFavorited00 : $_isFavorited");
                                });
                              } else {
                                setState(() {
                                  _isFavorited = false;
                                  _isfav = false;
                                  db.any_query(
                                      "UPDATE complete1 SET isfav=0 WHERE kural_no = ($index+1)",
                                      //     // "delete from complete where kural_no = $favTest",
                                      "modi_kural_comp.db");
                                  db.any_query(
                                      // "UPDATE complete1 SET isfav=1 WHERE kural_no = $favKural",
                                      "delete from complete where kural_no = $favTest",
                                      "modi_kural_comp.db");
                                  prefix0.print(
                                      "_isFavorited 000 : $_isFavorited");
                                });
                              }
                              favouriteTable();
                            }),
                        new IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // openPage(context);
                            // return new MyApp2();
                            // print("searching");
                            // currentPageValue=100;
                            // controller.jumpTo(100.0);
                            // var a = 1330;
                            // controller.jumpToPage(a);
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  prefix0.num _value;
                                  return AlertDialog(
                                    title: Text('குறள் எண்ணை உள்ளிடவும்'),
                                    content: TextFormField(
                                      keyboardType: TextInputType
                                          .number, //numberWithOptions(decimal: true),
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                          hintText: "குறள் எண்: "),
                                      // onSaved: (input) =>
                                      //     _value = int.tryParse(input),
                                      // textInputAction: controller.jumpTo(_value),
                                    ),
                                    actions: <Widget>[
                                      new FlatButton(
                                        child: new Text('இல்லை'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      new FlatButton(
                                        child: new Text('ஆம்'),
                                        onPressed: () {
                                          print(
                                              "text.controller:  ${_textFieldController.text}");
                                          var abcd = (_textFieldController.text)
                                              .toString();
                                          print("abcd " + abcd);
                                          var ff = int.parse(abcd) - 1;
                                          // controller.jumpTo(ff.toDouble());
                                          Navigator.of(context).pop();
                                          controller.jumpToPage(ff);
                                          // Navigator.of(context).pop();
                                          // Navigator.pop(context);
                                          // Navigator.of(context).pop();

                                          // Navigator.of(context, rootNavigator: true).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                            // _displayDialog(context);
                            // return index=100;
                          },
                        ),
                        new IconButton(
                          icon: const Icon(Icons.content_copy),
                          onPressed: () {
                            // openPage(context);
                            // return new MyApp2();
                            print("Copied to Clipboard");
                            ClipboardManager.copyToClipBoard(
                                    //  "குறள் எண்: ")
                                    "குறள்: ${newData1[index]['kural_tamil1']} விளக்கம்: ${newData1[index]['kuralvilakam_tamil']} கலைஞர் உரை: ${newData1[index]['desc1']} சாலமன் பாப்பைய்யா: ${newData1[index]['desc2']}")
                                .then((result) {
                              final snackBar = SnackBar(
                                content: Text('Copied to Clipboard'),
                                action: SnackBarAction(
                                  label: '',
                                  onPressed: () {
                                    print("Copied");
                                  },
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            });
                          },
                        ),
                        new IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () async {
                            // String BASE64_IMAGE =
                            //     "data:assets/png;base64, ...";
                            // AdvancedShare.generic(
                            //         msg: "Base64 file share",
                            //         subject: "Flutter",
                            //         title: "Share Image",
                            //         url: BASE64_IMAGE)
                            //     .then((response) {
                            //   print(response);
                            // });
                            // Share.text('my text title', 'This is my text to share with other applications.', 'text/plain');
                            final ByteData bytes =
                                await rootBundle.load('assets/valluvar.png');
                            await Share.file('esys image', 'esys.png',
                                bytes.buffer.asUint8List(), 'image/png',
                                text:
                                    'குறள் ${newData1[index]['kural_no']}: ${newData1[index]['kural_tamil1']} ');
                            // var abcd = ImageEditor(image: image);
                            // if (this.isImageloaded) {
                            //       return new CustomPaint(
                            //         child: Text("${newData1[index]['kural_no']}: ${newData1[index]['kural_tamil1']}"),
                            //           painter: new ImageEditor(image: image),
                            //         );
                            //     } else {
                            //       return new Center(child: new Text('loading'));
                            //     }

                            //ui.PictureRecorder recorder = ui.PictureRecorder();

                            // await Share.file('esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png', text: 'குறள் ${newData1[index]['kural_no']}: ${newData1[index]['kural_tamil1']} ');

                            // Share.share(
                            //     'App Link... www.nithra.mobi');
                            // print("searching");
                          },
                        ),
                        new IconButton(
                          icon: const Icon(Icons.help),
                          onPressed: () {
                            // openPage(context);
                            // return new MyApp2();
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       new AlertDialog(
                            //           title: Text("Help"),
                            //           // actions: <Widget>[
                            //           //   ListTile(
                            //           //     title: Text(
                            //           //         "${newData1[index]['iyal_tamil']}"),
                            //           //     subtitle: Text(
                            //           //         "${newData1[index]['iyal_tamil']}"),
                            //           //   )
                            //           // ]
                            //           );
                            //       print("searching");
                            //     });
                            Alert(
                              context: context,
                              title: "உதவி",
                              desc:
                                  "பால்: ${newData1[index]['pal_tamil']}   இயல்: ${newData1[index]['iyal_tamil']}  அதிகாரம்: ${newData1[index]['adhikarm_tamil']}",
                              // image: Image.asset("assets/valluvar.png"),
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "சரி",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    // Navigator.pop(context);
                                    // Navigator.of(context)
                                    //     .pop(); // dismiss dialog
                                  },
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                  radius: BorderRadius.circular(0.0),
                                ),
                              ],
                            ).show();
                          },
                        ),
                      ],
                    ),
                  ),
                  // new Container( child: CustomScrollView( slivers: //<Widget>[
                  new Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3.0),
                          child: Container(
                              decoration:
                                  new BoxDecoration(color: Colors.white),
                              //height: 00.0,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "குறள்:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        //   decoration: TextDecoration.underline,
                                        //   // decorationColor: Colors.red,
                                        //   // decorationStyle: TextDecorationStyle.wavy,
                                        //   fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      newData1[index]['kural_tamil1'],
                                      style: TextStyle(
                                        fontSize: 15 + a,
                                        color: Colors
                                            .deepPurpleAccent, //purple[300],
                                        // decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "விளக்கம்:",
                                      style: TextStyle(
                                        fontSize: 20 + a,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      newData1[index]['kuralvilakam_tamil'],
                                      style: TextStyle(
                                        fontSize: 15 + a,
                                        color: Colors.purple,
                                        // decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "கலைஞர் உரை:",
                                      style: TextStyle(
                                        fontSize: 20 + a,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      newData1[index]['desc1'],
                                      style: TextStyle(
                                        fontSize: 15 + a,
                                        color: Colors.purple,
                                        // decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "சாலமன் பாப்பைய்யா:",
                                      style: TextStyle(
                                        fontSize: 20 + a,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      newData1[index]['desc2'],
                                      style: TextStyle(
                                        fontSize: 15 + a,
                                        color: Colors.purple,
                                        // decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Kural: ${newData1[index]['kural_no']}",
                                      style: TextStyle(
                                        fontSize: 20 + a,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(newData1[index]['kural_thanglish1'],
                                        style: TextStyle(
                                          fontSize: 15 + a,
                                          color: Colors.purple,
                                        )),
                                    Text(newData1[index]['kural_thanglish2'],
                                        style: TextStyle(
                                          fontSize: 15 + a,
                                          color: Colors.purple,
                                        )),
                                    Text(
                                      "Explanation: ",
                                      style: TextStyle(
                                        fontSize: 20 + a,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                        // decorationColor: Colors.red,
                                        // decorationStyle: TextDecorationStyle.wavy,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      newData1[index]['kuralvilakam_english'],
                                      style: TextStyle(
                                        fontSize: 15 + a,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    // Text("kural_no: " + newData1[index]['kural_no']),
                                  ])))),
                  // Text("adhikarm_no " + newData1[index]['adhikarm_no']),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          summa(index - 1);
                          summa(index);
                          _summa(index);
                          _summa(index - 1);
                          controller.jumpToPage(index.floor() - 1);
                          prefix0.print("index: $index");
                          // print("searching");
                        },
                      ),
                      OutlineButton(
                        child: Text("${newData1[index]['kural_no']}/1330"),
                        onPressed: null,
                        textColor: Colors.blue,
                        borderSide: BorderSide(color: Colors.blue),
                        shape: StadiumBorder(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          prefix0.print("index: $index");
                          summa(index + 1);
                          summa(index);
                          _summa(index);
                          _summa(index + 1);
                          controller.jumpToPage(index.floor() + 1);
                          //print("searching");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          // itemCount: new_data == null ? 0 : new_data.length,
        )
        // }),
        //   ),
        // ),

        //)
        );
  }

  favArrayCheck() {}

  checkFavourites() async {
    List<Map<String, dynamic>> result10; // = null;
    List<Map<String, dynamic>> result09; // = null;
    var result9;
    List<Map<String, dynamic>> result11; // = null;

    try {
      result10 =
          await db.any_query("select * from complete", "modi_kural_comp.db");
      if (result10.isEmpty) {
        _isFavorited = false;
        _isfav = false;
      } else if (result10.isNotEmpty) {
        result09 = await db.any_query(
            "select kural_no from complete", "modi_kural_comp.db");
        for (var i = 0; i < result09.length; i++) {
          // prefix0.print("Try Catch: ${result09[i]['kural_no']}");
          await db.any_query(
              "UPDATE complete1 SET isfav=1 WHERE kural_no = ${result09[i]['kural_no']}",
              "modi_kural_comp.db");
          controller.addListener(() {
            setState(() {
              if (currentPageValue == result09[i]['kural_no'])
                _isFavorited = true;
            });
          });
        }
      } else {
        prefix0.print("Not Happening");
      }
    } catch (e) {
      prefix0
          .print("Exception result10: Complete Table   true  " + e.toString());
    }
  }

  summa(int value) async {
    List<Map<String, dynamic>> result10; // = null;
    List<Map<String, dynamic>> result09; // = null;
    var result9;
    List<Map<String, dynamic>> result11; // = null;
    // int temp = await prefs.getInt("cursor");
    /*
                try {
                  result10 =
                      await db.any_query("select * from complete", "modi_kural_comp.db");
                  if (result10.isEmpty) {
                    _isFavorited = false;
                    _isfav = false;
                  } else if (result10.isNotEmpty) {
                    result09 = await db.any_query(
                        "select kural_no from complete", "modi_kural_comp.db");
                    for (var i = 0; i < result09.length; i++) {
                      // prefix0.print("Try Catch: ${result09[i]['kural_no']}");
                      await db.any_query(
                          "UPDATE complete1 SET isfav=1 WHERE kural_no = ${result09[i]['kural_no']}",
                          "modi_kural_comp.db");
                      controller.addListener(() {
                        setState(() {
                          if (currentPageValue == result09[i]['kural_no'])
                            _isFavorited = true;
                        });
                      });
                    }
                  } else {
                    prefix0.print("Not Happening");
                  }
                } catch (e) {
                  prefix0
                      .print("Exception result10: Complete Table   true  " + e.toString());
                } */

    try {
      result11 = await db.any_query(
          "SELECT * from complete where kural_no =$value and isfav = 0",
          "modi_kural_comp.db");
      prefix0.print("Summa : result11: $result11");
      if (result11.isEmpty) {
        _isFavorited = false;
        _isfav = false;
      } else {
        _isFavorited = true;
        _isfav = true;
      }
      //   if (newData1[favKural-1]['isfav'] == 0) {
      //               _isFavorited = false;
      //               _isfav = false;
      //             } else {
      //               _isFavorited = true;
      //               _isfav = true;
      //             }
    } catch (e) {
      prefix0.print("Exception result11:   true  " + e.toString());
    }

    // try {
    //   result11 = await db.any_query(
    //       "SELECT * from complete where kural_no =$value ",
    //       "modi_kural_comp.db");
    //   prefix0.print("Summa : result11: $result11");
    //   if (result11.isEmpty) {
    //     _isFavorited = false;
    //     _isfav = false;
    //   } else {
    //     _isFavorited = true;
    //     _isfav = true;
    //   }
    //   // prefix0.print("result11: ${result11[0]['kural_tamil1']}");
    // } catch (Exception) {
    //   prefix0.print("Exception result11:   true  " + Exception.toString());
    // }
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          prefix0.num _value;
          return AlertDialog(
            title: Text('TextField in Dialog'),
            content: TextFormField(
              keyboardType:
                  TextInputType.number, //numberWithOptions(decimal: true),
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Type Kural Number"),
              onSaved: (input) => _value = num.tryParse(input),
              // textInputAction: controller.jumpTo(value),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('GO'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  print(_textFieldController.text);
                  // double number = (_textFieldController.text) as double;
                  // print(number);
                  _value = /*double.parse */ (_textFieldController
                      .text) as prefix0.double;
                  var a = _value.toInt();
                  prefix0.print("a : $a");
                  prefix0.print("value: $_value"); // as prefix0.int;;
                  controller.jumpToPage(a);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  //  void _helpDialog() {
  //   // flutter defined function
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("${newData1[index]['iyal_tamil']}"),
  //         content: new Text("${newData1[index]['iyal_tamil']}"),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           new FlatButton(
  //             child: new Text("Close"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

void summa1(prefix0.int index) async {
  var i = index + 1;
  try {
    summaR = await db.any_query(
        "SELECT * from complete where kural_no = ($index + 1)",
        "modi_kural_comp.db");
    if (summaR.isEmpty) {
      _isFavorited = false;
      _isfav = false;
    } else {
      _isFavorited = true;
      _isfav = true;
    }
    prefix0.print("summa1: isfav for $i: $_isFavorited");
  } catch (e) {
    prefix0.print("exception" + e.toString());
  }
}

_summa(int value) {
  prefix0.print("_summa :: currentPageValue: $value ");
}

class ImageEditor extends CustomPainter {
  ImageEditor({
    this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    Future<ByteData> bytes = image.toByteData();
    canvas.drawImage(image, new Offset(0.0, 0.0), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build

  // int _favoriteCount = 41;
  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite

  void _toggleFavorite() async {
    setState(() async {
      if (_isFavorited == true) {
        // _favoriteCount -= 1;
        _isFavorited = false; // as prefix0.int;
        await db.any_query("delete * from complete where kural_no = $favKural",
            "modi_kural_comp.db");
        // DELETE FROM Students WHERE StudentId = 11 OR StudentId = 12;

      } else {
        // _favoriteCount += 1;
        _isFavorited = true; // as prefix0.int;
        //  var kSearch = db.any_query("select * from complete where kural_no LIKE $favKural ", "modi_kural_comp.db");
        //  print("kSearch $kSearch");
        //  if(kSearch){
        //    prefix0.print("Already inserted");
        //  } else {
        await db.any_query(
            "insert into complete select * from complete1 where kural_no = $favKural",
            "modi_kural_comp.db");
        // }
        // setState(() {
        //   _isFavorited = true;
        // });
        // }

//  ResultFav = await db.any_query("select * from complete", "modi_kural_comp.db");
//         prefix0.print("ResultFav $ResultFav");

      }
    });
  }
  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited == true
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        // SizedBox(
        //   width: 18,
        //   child: Container(
        //     child: Text('$_favoriteCount'),
        //   ),
        // ),
      ],
    );
  }
  // #docregion _FavoriteWidgetState-fields
}
