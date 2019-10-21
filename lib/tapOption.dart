import 'package:flutter/material.dart';
import 'package:dhina/fragments/first_fragment.dart';

// void main() {
//   runApp(TabBarDemo());
// }

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "அறம்", icon: Icon(Icons.directions_car) ),
                Tab(text: "பொருள்", icon: Icon(Icons.directions_transit)),
                Tab(text: "இன்பம்", icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('முப்பால்'),
          ),
          body: TabBarView(
            children: [
              Text("${result[0]['pal_tamil']}"),
              Text("${result[1]['pal_tamil']}"),
              Text("${result[2]['pal_tamil']}"),
                             

              Text("Porul"),
              Text("Kaamam"),
              // Icon(Icons.directions_car),
              // Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}