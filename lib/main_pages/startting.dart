import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dhina/model/Getter_setter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:dhina/fragments/first_fragment.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:like_button/like_button.dart';

bool isliked = false;
var data;
// Kural Data12 = new Kural();
//     Data12 = data.toList();
    
class BeginingKural1 extends StatefulWidget {
  BeginingKural1({Key key}) : super(key: key);

  @override
  BeginingKural1State createState() => BeginingKural1State();
}

class BeginingKural1State extends State<BeginingKural1> {
  

  Future<String> loadJsonData() async {
    var jsonData = await rootBundle.loadString("assets/complete1.json");
    data = jsonData; //.toList();
    print(jsonData);
  }

  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    loadJsonData();
    
    controller.addListener(() {
  setState(() {
    currentPageValue = controller.page;
  });
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        extendBody: false,
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
                        body: new Container(
                            decoration: new BoxDecoration(color: Colors.white),
                            child:
                                //   // new Padding(
                                // // padding: new EdgeInsets.all(30.0),
                                // // child:
                                //  new SingleChildScrollView(
                                //     child:
                                // new SizedBox(
                                //     // width: 450.0,
                                //     // height: 600.0,
                                new Column(
                              children: <Widget>[
                                new SizedBox(
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text(
                                        "குறள் எண்: 1330",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      new IconButton(
                                        icon: const Icon(Icons.search),
                                        onPressed: () {
                                          // openPage(context);
                                          // return new MyApp2();
                                          print("searching");
                                        },
                                      ),
                                      new IconButton(
                                        icon: const Icon(Icons.content_copy),
                                        onPressed: () {
                                          // openPage(context);
                                          // return new MyApp2();
                                          print("searching");
                                        },
                                      ),
                                      new IconButton(
                                        icon: const Icon(Icons.share),
                                        onPressed: () {
                                          Share.share('App Link... www.nithra.mobi');
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
                                ), //new  Column(
                
                                new SingleChildScrollView(
                                    // scrollDirection: Axis.vertical,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                                    child: Container(
                                        decoration: new BoxDecoration(color: Colors.blueGrey),
                                        // height: 600.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            // CarouselSlider(items:  <Widget>[
                                            //   Text("${data.kural_tamil1}")
                                            // ],
                
                                            // ),
                
                //  new PageView.builder(
                //    itemCount: 3,
                //    itemBuilder: (context, position) {
                //      return Container(
                //        color: position % 2 == 0 ? Colors.pink : Colors.cyan,
                //      );
                //    },
                //  ),
  /*                                    PageView.builder(
                  controller: controller,
                  itemBuilder: (context, position) {
                    if (position == currentPageValue.floor()) {
                      return Transform(
                        transform: Matrix4.identity()..rotateX(currentPageValue - position),
                        child: Container(
                          color: position % 2 == 0 ? Colors.blue : Colors.pink,
                          child: Center(
                            child: Text(
                              "Page",
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ),
                          ),
                        ),
                      );
                    } else if (position == currentPageValue.floor() + 1){
                      return Transform(
                        transform: Matrix4.identity()..rotateX(currentPageValue - position),
                        child: Container(
                          color: position % 2 == 0 ? Colors.blue : Colors.pink,
                          child: Center(
                            child: Text(
                              "Page",
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: position % 2 == 0 ? Colors.blue : Colors.pink,
                        child: Center(
                          child: Text(
                            "Page",
                            style: TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                      );
                    }
                  },
                  itemCount: 10,
                )
                */
                
                                            // new PageView.builder(
                                            //   controller: controller,
                                            //   itemBuilder: (context, position) {
                                            //     if (position == currentPageValue.floor()) {
                                            //       return Transform(
                                            //         alignment: Alignment.center,
                                            //         transform: Matrix4.identity()
                                            //           ..setEntry(3, 2, 0.001)
                                            //           ..rotateX(currentPageValue - position)
                                            //           ..rotateY(currentPageValue - position)
                                            //           ..rotateZ(currentPageValue - position),
                                            //         child: Container(
                                            //           color: position % 2 == 0
                                            //               ? Colors.blue
                                            //               : Colors.pink,
                                            //           child: Center(
                                            //             child: Text(
                                            //               "Page",
                                            //               style: TextStyle(
                                            //                   color: Colors.white,
                                            //                   fontSize: 22.0),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     } else if (position ==
                                            //         currentPageValue.floor() + 1) {
                                            //       return Transform(
                                            //         alignment: Alignment.center,
                                            //         transform: Matrix4.identity()
                                            //           ..setEntry(3, 2, 0.001)
                                            //           ..rotateX(currentPageValue - position)
                                            //           ..rotateY(currentPageValue - position)
                                            //           ..rotateZ(currentPageValue - position),
                                            //         child: Container(
                                            //           color: position % 2 == 0
                                            //               ? Colors.blue
                                            //               : Colors.pink,
                                            //           child: Center(
                                            //             child: Text(
                                            //               "Page",
                                            //               style: TextStyle(
                                            //                   color: Colors.white,
                                            //                   fontSize: 22.0),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     } else {
                                            //       return Container(
                                            //         color: position % 2 == 0
                                            //             ? Colors.blue
                                            //             : Colors.pink,
                                            //         child: Center(
                                            //           child: Text(
                                            //             "Page",
                                            //             style: TextStyle(
                                            //                 color: Colors.white,
                                            //                 fontSize: 22.0),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     }
                                            //   },
                                            //   itemCount: 5,
                                            // ),
                
                                            Text(
                                              "அகர முதல எழுத்தெல்லாம் ஆதி \/nபகவன் முதற்றே உலகு",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "எழுத்துக்கள் எல்லாம் அகரத்தை அடிப்படையாக கொண்டிருக்கின்றன. அதுபோல உலகம் கடவுளை அடிப்படையாக கொண்டிருக்கிறது.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "அகர எழுத்துகளுக்கு முதன்மை, ஆதிபகவன், உலகில் வாழும் உயிர்களுக்கு முதன்மை.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            // Text(
                                            //   "English",
                                            //   style: TextStyle(fontSize: 18),
                                            // ),
                                            // Text(
                                            //   "English explanation",
                                            //   style: TextStyle(fontSize: 18),
                                            // ),
                                            // Text(
                                            //   "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
                                            //   style: TextStyle(fontSize: 18),
                                            // ),
                                            // Text(
                                            //   "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
                                            //   style: TextStyle(fontSize: 18),
                                            // ),
                                            // Text(
                                            //   "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
                                            //   style: TextStyle(fontSize: 18),
                                            // ),
                                          ],
                                        ))),
                
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        // openPage(context);
                                        // return new MyApp2();
                                        print("searching");
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.confirmation_number),
                                      onPressed: () {
                                        // openPage(context);
                                        // return new MyApp2();
                                        print("searching");
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        // openPage(context);
                                        // return new MyApp2();
                                        print("searching");
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )));
                  }
                  
                }
                


/*

class BeginingKural1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     backgroundColor: Colors.grey,
    //     resizeToAvoidBottomInset: false,
    //     resizeToAvoidBottomPadding: false,
    //     extendBody: false,
    //     appBar: AppBar(
    //       leading: Builder(
    //         builder: (BuildContext context) {
    //           return IconButton(
    //             icon: const Icon(Icons.arrow_back),
    //             onPressed: () {
    //               // Scaffold.of(context).openDrawer();
    //               //       Navigator.push(
    //               //   context,
    //               //   MaterialPageRoute(builder: (context) => FirstFragment()),
    //               // );
    //               Navigator.pop(context);
    //             },
    //             // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    //           );
    //         },
    //       ),
    //       title: const Text('திருக்குறள்'),
    //       actions: <Widget>[
    //         LikeButton(
    //           // size: buttonSize,
    //           circleColor:
    //               CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
    //           bubblesColor: BubblesColor(
    //             dotPrimaryColor: Color(0xff33b5e5),
    //             dotSecondaryColor: Color(0xff0099cc),
    //           ),
    //           likeBuilder: (bool isLiked) {
    //             return Icon(
    //               Icons.favorite,
    //               color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
    //               // size: buttonSize,
    //             );
    //           },
    //           likeCount: null, //get number or put some number
    //           countBuilder: (int count, bool isLiked, String text) {
    //             text = "Removed";
    //             var color = isLiked ? Colors.deepPurpleAccent : Colors.white;
    //             Widget result;
    //             if (count == 0) {
    //               // print("hi touched liked");
    //               result = Text(
    //                 "loved",
    //                 style: TextStyle(color: color),
    //               );
    //             } else
    //               result = Text(
    //                 "Removed",
    //                 style: TextStyle(color: color),
    //               );
    //             return result;
    //           },
    //           // onTap: (bool isLiked) {
    //           //    if(isLiked) {
    //           //    print("hi touched liked");
    //           //    }
    //           //    else  {
    //           //      print("hi touched unliked");
    //           //      isLiked = !isLiked;
    //           //    }
    //           //  },
    //           //   if (count == 0) {
    //           //     print("hi touched liked");
    //           //     result = Text(
    //           //       "loved",
    //           //       style: TextStyle(color: color),
    //           //     );
    //           //   } else
    //           //     result = Text(
    //           //       "Removed",
    //           //       style: TextStyle(color: color),
    //           //     );
    //           //   return result;
    //           // },
    //         ),

    //         // IconButton(
    //         //   icon: const Icon(Icons.favorite),
    //         //   onPressed: () {
    //         //     print("object");
    //         //   },
    //         // ),
    //         IconButton(
    //           icon: const Icon(Icons.text_format),
    //           onPressed: () {
    //             // openPage(context);
    //             // return new MyApp2();
    //             print("Text Font Size increasing");
    //           },
    //         ),
    //         IconButton(
    //           icon: const Icon(Icons.search),
    //           onPressed: () {
    //             // openPage(context);
    //             // return new MyApp2();
    //             print("searching");
    //           },
    //         ),
    //       ],
    //     ),
    //     body: new Container(
    //         decoration: new BoxDecoration(color: Colors.white),
    //         child:
    //             //   // new Padding(
    //             // // padding: new EdgeInsets.all(30.0),
    //             // // child:
    //             //  new SingleChildScrollView(
    //             //     child:
    //             // new SizedBox(
    //             //     // width: 450.0,
    //             //     // height: 600.0,
    //             new Column(
    //           children: <Widget>[
    //             new SizedBox(
    //               height: 80,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   new Text(
    //                     "குறள் எண்: 1330",
    //                     style: TextStyle(fontSize: 18),
    //                   ),
    //                   new IconButton(
    //                     icon: const Icon(Icons.search),
    //                     onPressed: () {
    //                       // openPage(context);
    //                       // return new MyApp2();
    //                       print("searching");
    //                     },
    //                   ),
    //                   new IconButton(
    //                     icon: const Icon(Icons.content_copy),
    //                     onPressed: () {
    //                       // openPage(context);
    //                       // return new MyApp2();
    //                       print("searching");
    //                     },
    //                   ),
    //                   new IconButton(
    //                     icon: const Icon(Icons.share),
    //                     onPressed: () {
    //                       Share.share('App Link... www.nithra.mobi');
    //                       print("searching");
    //                     },
    //                   ),
    //                   new IconButton(
    //                     icon: const Icon(Icons.help),
    //                     onPressed: () {
    //                       // openPage(context);
    //                       // return new MyApp2();
    //                       print("searching");
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ), //new  Column(

    //             new SingleChildScrollView(
    //                 // scrollDirection: Axis.vertical,
    //                 padding:
    //                     EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
    //                 child: Container(
    //                     decoration: new BoxDecoration(color: Colors.blueGrey),
    //                     // height: 600.0,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: <Widget>[
      

    //                         Text(
    //                           "அகர முதல எழுத்தெல்லாம் ஆதி \/nபகவன் முதற்றே உலகு",
    //                           style: TextStyle(fontSize: 18),
    //                         ),
    //                         // Text(
    //                         //   "எழுத்துக்கள் எல்லாம் அகரத்தை அடிப்படையாக கொண்டிருக்கின்றன. அதுபோல உலகம் கடவுளை அடிப்படையாக கொண்டிருக்கிறது.",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                         // Text(
    //                         //   "அகர எழுத்துகளுக்கு முதன்மை, ஆதிபகவன், உலகில் வாழும் உயிர்களுக்கு முதன்மை.",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                         // Text(
    //                         //   "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                         // Text(
    //                         //   "English",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                         // Text(
    //                         //   "English explanation",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                         // Text(
    //                         //   "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                         // Text(
    //                         //   "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                         // Text(
    //                         //   "எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.",
    //                         //   style: TextStyle(fontSize: 18),
    //                         // ),
    //                       ],
    //                     ))),

    //             new Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: <Widget>[
    //                 IconButton(
    //                   icon: const Icon(Icons.arrow_back_ios),
    //                   onPressed: () {
    //                     // openPage(context);
    //                     // return new MyApp2();
    //                     print("searching");
    //                   },
    //                 ),
    //                 IconButton(
    //                   icon: const Icon(Icons.confirmation_number),
    //                   onPressed: () {
    //                     // openPage(context);
    //                     // return new MyApp2();
    //                     print("searching");
    //                   },
    //                 ),
    //                 IconButton(
    //                   icon: const Icon(Icons.arrow_forward_ios),
    //                   onPressed: () {
    //                     // openPage(context);
    //                     // return new MyApp2();
    //                     print("searching");
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ],
    //         )));
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Thirukkural'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

// Future<bool> onLikeButtonTap(bool isLiked, TuChongItem item) {
//     ///send your request here
//     ///
//     final Completer<bool> completer = new Completer<bool>();
//     Timer(const Duration(milliseconds: 200), () {
//       item.isFavorite = !item.isFavorite;
//       item.favorites =
//           item.isFavorite ? item.favorites + 1 : item.favorites - 1;

//       // if your request is failed,return null,
//       completer.complete(item.isFavorite);
//     });
//     return completer.future;
//   }



} */
