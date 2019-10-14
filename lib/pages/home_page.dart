import 'package:dhina/device.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:flutter/material.dart';
import 'package:dhina/feedback_ex.dart';
import 'package:dhina/privacy_link.dart';
import 'package:share/share.dart';
import 'package:dhina/db/db.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("PrivacyPolicy", Icons.security),
    new DrawerItem("Feedback", Icons.feedback),
    new DrawerItem("Share", Icons.share),
    new DrawerItem("Test", Icons.ac_unit),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new Kural(); // Privacy Policy
      case 2:
        return new Feedback_ex(); // feedback form
      case 3:
        return sharing3();
      case 4:
        return new MyDeviceInfo();
      default:
        return new Text("Error");
    }
  }

  sharing3() {
    Share.share('App Link... www.nithra.mobi');
    return new FirstFragment();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => FirstFragment()),
    // );
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text('Thirukkural'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share("Text");
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              // openPage(context);
              // return new MyApp2();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp2()),
              );
            },
          ),
//           new GestureDetector(
// onTap: () {
//                     return Share.share("Text");
//                   },
//                   child: Text("share"),
//           ),

//           Text("Noti")
        ],
        // title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Thirukkural"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
