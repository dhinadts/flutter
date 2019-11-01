import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:dhina/pages/home_page.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

// import 'package:clipboard_manager/clipboard_manager.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }
var cursor;  
ByteData bytes; // = await rootBundle.load('assets/valluvar.png');

class MyApp4 extends StatefulWidget {
  @override
  MyApp4State createState() => MyApp4State();
}

class MyApp4State extends State<MyApp4> {
  List data;
  PageController controller = PageController();
  var currentPageValue = 0.0;
  TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ui.Image image;
  bool isImageloaded = false;
  

  prefix0.int index1;

  @override
  void initState() {
    // Future<String> _loadAStudentAsset() async {
    //   newData = await rootBundle.loadString('assets/complete1.json');
    //   print(newData);
    // }

    init();
    super.initState();
    // _loadAStudentAsset();

    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page; // .toInt() as double;
        print(currentPageValue);
        cursor = currentPageValue; // as double);
        // print("currenpagevalue:" + currentPageValue.toString());
        // print("page No:" + (currentPageValue + 1).toString());
      });
    });
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('assets/valluvar.jpeg');
    image = await loadImage(new Uint8List.view(data.buffer));
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
          title: const Text('திருக்குறள்'),
          actions: <Widget>[
            new FavoriteWidget(),

            LikeButton(
              // size: buttonSize,
              circleColor:
                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Color(0xff33b5e5),
                dotSecondaryColor: Color(0xff0099cc),
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                  // size: buttonSize,
                );
              },
              likeCount: null, //get number or put some number
              countBuilder: (int count, bool isLiked, String text) {
                text = "Removed";
                var color = isLiked ? Colors.deepPurpleAccent : Colors.white;
                Widget result;
                if (count == 0) {
                  // print("hi touched liked");
                  result = Text(
                    "loved",
                    style: TextStyle(color: color),
                  );
                } else
                  result = Text(
                    "Removed",
                    style: TextStyle(color: color),
                  );
                return result;
              },
              // onTap: (bool isLiked) {
              //    if(isLiked) {
              //    print("hi touched liked");
              //    }
              //    else  {
              //      print("hi touched unliked");
              //      isLiked = !isLiked;
              //    }
              //  },
              //   if (count == 0) {
              //     print("hi touched liked");
              //     result = Text(
              //       "loved",
              //       style: TextStyle(color: color),
              //     );
              //   } else
              //     result = Text(
              //       "Removed",
              //       style: TextStyle(color: color),
              //     );
              //   return result;
              // },
            ),

            // IconButton(
            //   icon: const Icon(Icons.favorite),
            //   onPressed: () {
            //     print("object");
            //   },
            // ),

            IconButton(
              icon: const Icon(Icons.text_format),
              onPressed: () {
                // openPage(context);
                // return new MyApp2();
                print("Text Font Size increasing");
                var index = 12;

                print("${newData[13]['kural_tamil1']} ");
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // openPage(context);
                // return new MyApp2();
                print("searching");
              },
            ),
          ],
        ),
        body: SafeArea(
          bottom: true,
          top: true,
          left: false,
          right: true,
//          child: new SingleChildScrollView(
          child: Container(
            child: Center(
              // Use future builder and DefaultAssetBundle to load the local JSON file
              child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/complete1.json'),
                  builder: (context, snapshot) {
                    // Decode the JSON
                    var newData = json.decode(snapshot.data.toString());

                    return PageView.builder(
                      // Build the ListView
                      itemCount: 1330,
                      controller: controller,
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      physics:
                          ClampingScrollPhysics(), //BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        // setState(() {
                        //   index1 = index;
                        // });
                        
                        return Card(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new SizedBox(
                                height: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Text(
                                      "குறள் எண்: ${newData[index]['kural_no']}", //${newData.kural_no}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    // new RaisedButton(
                                    //   onPressed: null,
                                    //   child: Text(" ")

                                    // ),
//                                     new IconButton(
// icon: const Icon(Icons.favorite) ,
// onPressed: null,
//                                     ),
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
                                                title:
                                                    Text('Type Kural Number'),
                                                content: TextFormField(
                                                  keyboardType: TextInputType
                                                      .number, //numberWithOptions(decimal: true),
                                                  controller:
                                                      _textFieldController,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Type Kural Number"),
                                                  onSaved: (input) => _value =
                                                      int.tryParse(input),
                                                  // textInputAction: controller.jumpTo(value),
                                                ),
                                                actions: <Widget>[
                                                  new FlatButton(
                                                    child: new Text('CANCEL'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  new FlatButton(
                                                    child: new Text('GO'),
                                                    onPressed: () {
                                                      // Navigator.of(context).pop();
                                                      // print("text.controller:  ${_textFieldController.text}");
                                                      // var abcd = (_textFieldController.text).toString() ;
                                                      // print("abcd " + abcd);
                                                      // int.parse(abcd);

                                                      // controller.jumpToPage(
                                                      //     int.parse(abcd));
                                                      // Navigator.of(context)
                                                      //     .pop();
                                                      print(
                                                          "text.controller:  ${_textFieldController.text}");
                                                      var abcd =
                                                          (_textFieldController
                                                                  .text)
                                                              .toString();
                                                      print("abcd " + abcd);
                                                      var ff =
                                                          int.parse(abcd) - 1;

                                                      controller.jumpToPage(ff);
                                                      Navigator.of(context)
                                                          .pop();
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
                                                "குறள்: ${newData[index]['kural_tamil1']} விளக்கம்: ${newData[index]['kuralvilakam_tamil']} கலைஞர் உரை: ${newData[index]['desc1']} சாலமன் பாப்பைய்யா: ${newData[index]['desc2']}")
                                            .then((result) {
                                          final snackBar = SnackBar(
                                            content:
                                                Text('Copied to Clipboard'),
                                            action: SnackBarAction(
                                              label: 'Undo',
                                              onPressed: () {
                                                print("Copied");
                                              },
                                            ),
                                          );
                                          Scaffold.of(context)
                                              .showSnackBar(snackBar);
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
                                        final ByteData bytes = await rootBundle
                                            .load('assets/valluvar.png');
                                        await Share.file(
                                            'esys image',
                                            'esys.png',
                                            bytes.buffer.asUint8List(),
                                            'image/png',
                                            text:
                                                'குறள் ${newData[index]['kural_no']}: ${newData[index]['kural_tamil1']} ');
// var abcd = ImageEditor(image: image);
// if (this.isImageloaded) {
//       return new CustomPaint(
//         child: Text("${newData[index]['kural_no']}: ${newData[index]['kural_tamil1']}"),
//           painter: new ImageEditor(image: image),
//         );
//     } else {
//       return new Center(child: new Text('loading'));
//     }

                                        //ui.PictureRecorder recorder = ui.PictureRecorder();

// await Share.file('esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png', text: 'குறள் ${newData[index]['kural_no']}: ${newData[index]['kural_tamil1']} ');

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
                                        //           //         "${newData[index]['iyal_tamil']}"),
                                        //           //     subtitle: Text(
                                        //           //         "${newData[index]['iyal_tamil']}"),
                                        //           //   )
                                        //           // ]
                                        //           );
                                        //       print("searching");
                                        //     });
                                        Alert(
                                          context: context,
                                          title: "உதவி",
                                          desc:
                                              "பால்: ${newData[index]['pal_tamil']}   இயல்: ${newData[index]['iyal_tamil']}  அதிகாரம்: ${newData[index]['adhikarm_tamil']}",
                                          image: Image.asset(
                                              "assets/valluvar.png"),
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "சரி",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              color: Color.fromRGBO(
                                                  0, 179, 134, 1.0),
                                              radius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                          ],
                                        ).show();
                                        // var alertStyle = AlertStyle(
                                        //   animationType: AnimationType.fromTop,
                                        //   isCloseButton: false,
                                        //   isOverlayTapDismiss: false,
                                        //   descStyle: TextStyle(
                                        //       fontWeight: FontWeight.bold),
                                        //   animationDuration:
                                        //       Duration(milliseconds: 400),
                                        //   alertBorder: RoundedRectangleBorder(
                                        //     borderRadius:
                                        //         BorderRadius.circular(0.0),
                                        //     side: BorderSide(
                                        //       color: Colors.grey,
                                        //     ),
                                        //   ),
                                        //   titleStyle: TextStyle(
                                        //     color: Colors.red,
                                        //   ),
                                        // );
                                        // Alert(
                                        //   context: context,
                                        //   style: alertStyle,
                                        //   type: AlertType.info,
                                        //   title: "உதவி",

                                        //   desc:
                                        //       "பால்: ${newData[index]['pal_tamil']}   இயல்: ${newData[index]['iyal_tamil']}  அதிகாரம்: ${newData[index]['adhikarm_tamil']}",
                                        //       image: Image.asset("assets/valluvar.png"),
                                        //   // buttons: [
                                        //   //   DialogButton(
                                        //   //     child: Text(
                                        //   //       "சரி",
                                        //   //       style: TextStyle(
                                        //   //           color: Colors.white,
                                        //   //           fontSize: 20),
                                        //   //     ),
                                        //   //     onPressed: () =>
                                        //   //         Navigator.pop(context),
                                        //   //     color: Color.fromRGBO(
                                        //   //         0, 179, 134, 1.0),
                                        //   //     radius:
                                        //   //         BorderRadius.circular(0.0),
                                        //   //   ),
                                        //   // ],
                                        // ).show();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // new Container( child: CustomScrollView( slivers: //<Widget>[
                              new Expanded(
                                    flex:1,
                                      child: SingleChildScrollView(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 3.0),
                                          child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Colors.white),
                                              //height: 00.0,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  // mainAxisSize: MainAxisSize.min,
                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  // mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    //                                     Text(
                                                    //                                       "குறள்:", style: TextStyle( fontSize: 20,
                                                    //   color: Colors.black,
                                                    //   decoration: TextDecoration.underline,
                                                    //   // decorationColor: Colors.red,
                                                    //   // decorationStyle: TextDecorationStyle.wavy,
                                                    //   fontWeight: FontWeight.bold,
                                                    // ),
                                                    // ),
                                                    Text(
                                                      newData[index]
                                                          ['kural_tamil1'],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.deepPurpleAccent, //purple[300],
                                                        // decoration: TextDecoration.underline,
                                                        // decorationColor: Colors.red,
                                                        // decorationStyle: TextDecorationStyle.wavy,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "விளக்கம்:",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        // decorationColor: Colors.red,
                                                        // decorationStyle: TextDecorationStyle.wavy,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      newData[index][
                                                          'kuralvilakam_tamil'],
                                                      style: TextStyle(
                                                        fontSize: 15,
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
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        // decorationColor: Colors.red,
                                                        // decorationStyle: TextDecorationStyle.wavy,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      newData[index]['desc1'],
                                                      style: TextStyle(
                                                        fontSize: 15,
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
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        // decorationColor: Colors.red,
                                                        // decorationStyle: TextDecorationStyle.wavy,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      newData[index]['desc2'],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.purple,
                                                        // decoration: TextDecoration.underline,
                                                        // decorationColor: Colors.red,
                                                        // decorationStyle: TextDecorationStyle.wavy,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text("English : " +
                                                        newData[index]
                                                            ['iyal_tamil']),
                                                    Text("Explanation: " +
                                                        newData[index]
                                                            ['adhikarm_tamil']),
                                                    // Text("kural_no: " + newData[index]['kural_no']),
                                                  ])))),
                              // Text("adhikarm_no " + newData[index]['adhikarm_no']),

                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      // openPage(context);
                                      // return new MyApp2();
                                      //controller.jumpTo(currentPageValue-1.0);
                                      controller.jumpToPage(
                                          currentPageValue.floor() - 1);
                                      print("searching");
                                    },
                                  ),
                                  OutlineButton(
                                    child: Text(
                                        "${newData[index]['kural_no']}/1330"),
                                    onPressed: null,
                                    textColor: Colors.blue,
                                    // shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                                    //borderSide: BorderSide(color: Colors.yellow),
                                    borderSide: BorderSide(color: Colors.blue),
                                    shape: StadiumBorder(),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios),
                                    onPressed: () {
                                      // openPage(context);
                                      // return new MyApp2();
                                      //position = currentAnimationValue.floor() + 1;
                                      controller.jumpToPage(
                                          currentPageValue.floor() + 1);
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
                    );
                  }),
            ),
          ),
        ));
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
  //         title: new Text("${newData[index]['iyal_tamil']}"),
  //         content: new Text("${newData[index]['iyal_tamil']}"),
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
  bool _isFavorited = true;
  // int _favoriteCount = 41;
  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        // _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        // _favoriteCount += 1;
        _isFavorited = true;
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
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
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