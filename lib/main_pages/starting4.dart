import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';
import 'package:share/share.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
// import 'package:clipboard_manager/clipboard_manager.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

class MyApp4 extends StatefulWidget {
  @override
  MyApp4State createState() => MyApp4State();
}

class MyApp4State extends State<MyApp4> {
  List data;
  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  void initState() {
    Future<String> _loadAStudentAsset() async {
      return await rootBundle.loadString('assets/complete1.json');
    }

    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page; // .toInt() as double;
        print(currentPageValue); // as double);
        // print("currenpagevalue:" + currentPageValue.toString());
        // print("page No:" + (currentPageValue + 1).toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                // print("${Data12.kural_no}");
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
        body: Container(
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
                    physics: ClampingScrollPhysics(), //BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  new IconButton(
                                    icon: const Icon(Icons.search),
                                    onPressed: () {
                                      // openPage(context);
                                      // return new MyApp2();
                                      // print("searching");
                                      // currentPageValue=100;
                                      // controller.jumpTo(100.0);
                                      controller.jumpToPage(1000);
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
                                          content: Text('Copied to Clipboard'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {print("Copied");},
                                          ),
                                        );
                                        Scaffold.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                      );
                                      
                                    },
                                  ),
                                  new IconButton(
                                    icon: const Icon(Icons.share),
                                    onPressed: () {
                                      Share.share(
                                          'App Link... www.nithra.mobi');
                                      print("searching");
                                    },
                                  ),
                                  new IconButton(
                                    icon: const Icon(Icons.help),
                                    onPressed: () {
                                      // openPage(context);
                                      // return new MyApp2();
                                      print("searching");
                                    },
                                  ),
                                ],
                              ),
                            ),
                            new SingleChildScrollView(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 3.0),
                                child: Container(
                                    decoration:
                                        new BoxDecoration(color: Colors.grey),
                                    // height: 500.0,
                                    child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            "குறள்:",
                                          ),
                                          Text(newData[index]['kural_tamil1']),
                                          Text("விளக்கம்:"),
                                          Text(newData[index]
                                              ['kuralvilakam_tamil']),
                                          Text("கலைஞர் உரை:"),
                                          Text(newData[index]['desc1']),
                                          Text("சாலமன் பாப்பைய்யா:"),
                                          Text(newData[index]['desc2']),
                                          // Text("iyal_tamil : " + newData[index]['iyal_tamil']),
                                          //Text("adhikarm_tamil: " + newData[index]['adhikarm_tamil']),
                                          // Text("kural_no: " + newData[index]['kural_no']),
                                        ]))),
                            // Text("adhikarm_no " + newData[index]['adhikarm_no']),

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ));
  }
}
