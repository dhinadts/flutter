// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
 


// final List<String> imgList = "assets/complete1.json" as List<String>;



// class CarouselDemo extends StatelessWidget {
//   CarouselSlider instance;

//   nextSlider() {
//     instance.nextPage(duration: new Duration(milliseconds: 300), curve: Curves.linear);
//   }

//   prevSlider() {
//     instance.previousPage(duration: new Duration(milliseconds: 800), curve: Curves.easeIn);
//   }

//   @override
//   Widget build(BuildContext context) {
//     instance = new CarouselSlider(
//       items: imgList.map((url) {
//         return new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 5.0),
//           decoration: new BoxDecoration(
//             borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
//             image: new DecorationImage(
//               image: new NetworkImage(url),
//               fit: BoxFit.cover
//             )
//           ),
//         );
//       }).toList(),
//       viewportFraction: 0.9,
//       aspectRatio: 2.0,
//     );
//     // print(instance.nextPage());
//     return new MaterialApp(
//       title: 'demo',
//       home: new Scaffold(
//         appBar: new AppBar(title: new Text('Carousel slider demo')),
//         body: new ListView(
//           children: <Widget>[
//             new Padding(
//               padding: new EdgeInsets.symmetric(vertical: 15.0),
//               child: instance
//             ),
//             new Row(
//               children: <Widget>[
//                 new Expanded(
//                   child: new RaisedButton(
//                     onPressed: nextSlider,
//                     child: new Text('next slider')
//                   ),
//                 ),
//                 new Expanded(
//                   child: new RaisedButton(
//                     onPressed: prevSlider,
//                     child: new Text(' prev slider')
//                   )
//                 )
//               ],
//             ),
//             new Padding(
//               padding: new EdgeInsets.symmetric(vertical: 15.0),
//               child: new CarouselSlider(
//                 items: [1,2,3,4,5].map((i) {
//                   return new Builder(
//                     builder: (BuildContext context) {
//                       return new Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: new EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: new BoxDecoration(
//                           color: Colors.amber
//                         ),
//                         child: new Text('text $i', style: new TextStyle(fontSize: 16.0),)
//                       );
//                     },
//                   );
//                 }).toList(),
//                 height: 400.0,
//                 autoPlay: true,
//               )
//             ),
//           ],
//         )
//       )
//     );
//   }
// }