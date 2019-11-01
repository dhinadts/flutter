import 'package:dhina/fragments/first_fragment.dart';
import 'package:flutter/material.dart';
import 'package:dhina/feedback_ex.dart';
import 'package:dhina/privacy_link.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:dhina/db/db.dart';
import 'package:dhina/dia_rating.dart';
import 'package:dhina/dia_examples.dart';
import 'package:dhina/tapOption.dart';
import 'package:dhina/db/dbhelper.dart';

import '../scrollviewEx.dart';


  var newData;
  // List<Map<String, dynamic>> result1, result2, result3;

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
    new DrawerItem("Start", Icons.play_arrow),
    new DrawerItem("DiaEXam", Icons.explore),
    new DrawerItem("checkDB", Icons.explore),
    new DrawerItem("title", Icons.expand_less),
    new DrawerItem("ExtraCheck", Icons.expand_less),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  var dbhelp = DatabaseHelper();

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new MyApp2(); // Privacy Policy
      case 2:
        return new Feedback_ex(); // feedback form
      case 3:
        return sharing3(); // share
      case 4:
        return new dia_rateUs(); // test
      case 5:
        return new JSON1();
      case 6:
        return new exa_dias();
      case 7:
        return new TabBarDemo();
      case 8:
        return TabBarDemo();
      default:
        return new MyApp121123();
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
  void initState() {
    // todo: implement initState
    @override
    Future<String> _loadAStudentAsset() async {
        newData = await rootBundle.loadString('assets/complete1.json');
    }

    super.initState();
    dbhelp.db_move();
    _loadAStudentAsset();
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
        title: new Text('திருக்குறள்'),
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
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text("திருக்குறள்"),
                  accountEmail: new Text('dhina@gmail.com')),
              new Column(children: drawerOptions)
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
