import 'package:dhina/Gsearch.dart';
import 'package:dhina/firstPage.dart';
import 'package:dhina/fragments/first_fragment.dart';
import 'package:dhina/fragments/second_fragment.dart';
import 'package:dhina/main_pages/favorite_Displays.dart';
import 'package:dhina/main_pages/starting4.dart';
import 'package:dhina/newMainpage1.dart';
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
import 'package:dhina/seekbar1.dart';
import '../SeekBarEx.dart';
import '../cate2pgview.dart';
import '../scrollviewEx.dart';

var newData;
List<Map<String, dynamic>> newData1;
// List<Map<String, dynamic>> result1, result2, result3;

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("முகப்பு", Icons.home),
    new DrawerItem("வகைப்பட்டியல்", Icons.category),
    new DrawerItem("முழு பட்டியல்", Icons.fullscreen),
    new DrawerItem("favourites", Icons.favorite),
    new DrawerItem("தேடல்", Icons.search),
    new DrawerItem("செல்", Icons.find_in_page),
    new DrawerItem("தனியுரிமைக் கொள்கை", Icons.security),
    new DrawerItem("கருத்து", Icons.feedback),
    new DrawerItem("பகிரவும்", Icons.share),
    new DrawerItem("மதிப்பிடவும்", Icons.rate_review),
    new DrawerItem("Start", Icons.play_arrow),
    new DrawerItem("DiaEXam", Icons.explore),
    new DrawerItem("checkDB", Icons.explore),
    new DrawerItem("title", Icons.expand_less),
    new DrawerItem("Favourites", Icons.favorite),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  var dbhelp = DatabaseHelper();
var db = DatabaseHelper();
  

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
         return new FirstFragment11();

      case 1: {
        // result = db.any_query(
        //           'select DISTINCT pal_tamil from complete1',
        //           'modi_kural_comp.db');
        //       onSelectItem1(result[0]['pal_tamil']);
        //       onSelectItem2(result[1]['pal_tamil']);
        //       onSelectItem3(result[2]['pal_tamil']);
        //       Navigator.of(context).push(
        //           MaterialPageRoute<Null>(builder: (BuildContext context) {
        //         return new TabBarDemo();
        //       }));
        return new TabBarDemo();
      }
      case 2:
        return new MyApp444(value: 0, currentPageValue: 0, fontSize1: 0,);
      case 3: {
         
        return new Favorite11();
      }
      case 4:
        return new GlobalSearch();
      case 5:
        return new MyApp2(); // Privacy Policy
      case 6:
        return new Feedback_ex(); // feedback form
      case 7:
        return sharing3(); // share
      case 8:
        return new dia_rateUs(); // test
      case 9:
        return new JSON1();
      case 10:
        return new exa_dias();
      case 11:
        return null;
      case 12:
        return Favorite11();
      default:
        return MyApp44();
    }
  }


onSelectItem1(String s) async {
  var db = DatabaseHelper();

  result1 = await db.any_query(
      'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="அறத்துப்பால்"',
      'modi_kural_comp.db');
  // List.generate(result1.length, (i) {
  //   Iyal(
  //     iyal_tamil: result1[i]['iyal_tamil'],
  //   );
  // });
  print(result1.length);
  print(result1);

  // Items I = new Items();
  // I = result as Items;
  // print(I.pal_tamil[0]);
}

onSelectItem2(String s) async {
  var db = DatabaseHelper();
  result2 = await db.any_query(
      'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
      'modi_kural_comp.db');
  // List.generate(result2.length, (i) {
  //   Iyal(
  //     iyal_tamil: result2[i]['iyal_tamil'],
  //   );
  // });
  print(result2.length);
  print(result2);

  // Items I = new Items();
  // I = result as Items;
  // print(I.pal_tamil[0]);
}

onSelectItem3(String s) async {
  var db = DatabaseHelper();
  result3 = await db.any_query(
      'SELECT DISTINCT iyal_tamil from complete1 WHERE pal_tamil="$s"',
      'modi_kural_comp.db');
  // List.generate(result3.length, (i) {
  //   Iyal(
  //     iyal_tamil: result3[i]['iyal_tamil'],
  //   );
  // });
  print(result3.length);
  print(result3);

  // Items I = new Items();
  // I = result as Items;
  // print(I.pal_tamil[0]);
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
       await db.db_move();
       
    }
    dbmove() async {
      await db.db_move();
      //newData1 = await db.any_query("select * from complete1", "modi_kural_comp.db");
      ResultFav =  await db.any_query('SELECT * from complete', //1 where isfav=1', 
                   //1 where isfav=1', 
                   "modi_kural_comp.db");
    }
    

    super.initState();
    // dbmove();
    // dbhelp.db_move();
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
        //   automaticallyImplyLeading: false, // this will hide Drawer hamburger icon
  
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
                accountName: new Text("திருக்குறள்"), accountEmail: null,
                //accountEmail: new Text('dhina@gmail.com')
              ),
              new Column(children: drawerOptions)
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
