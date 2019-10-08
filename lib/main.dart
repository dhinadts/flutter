import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:dhina/privacy.dart'; // as privacy1;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';




void main() => runApp(new Myapp());
class Myapp extends StatelessWidget {
  // const Myapp({Key key}) : super(key: key);
  // WebViewController _controller;
  // final AssetBundle rootBundle = _initRootBundle();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {
     // _loadHtmlFromAssets();
    return MaterialApp(
      
  home: Scaffold(
    key: Key('item'),
    
    drawer: Drawer(
       child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('Thirukkural'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Home'),
        onTap: () {
            // Navigate to second route when tapped.
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        // onTap: () {
        //   // Update the state of the app.
        //   // ...
        //   Navigator.pop(context);
          
          
        // },
      ),
      ListTile(
        title: Text('Categories'),
        // onPressed: () {
        //     // Navigate to second route when tapped.
        //      Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => SecondRoute()),
        //     );
        //   },
        onTap: () {
          // Update the state of the app.
          // ...
          return new WebViewExample();
          // Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => new WebViewExample()),
          //     );
        },
      ),
    ],
  ),
    ),
    appBar: AppBar(
      
      title: const Text('THIRUKKURAL'),
      
      actions: <Widget>[
        new GestureDetector(
          onTap: () {
            Share.share('text');
              },
            child: new Icon(
      Icons.share,
      color: Colors.white,
      size: 24.0,
      // semanticLabel: 'Text to announce in accessibility modes',
      
    ),
        ),
        
        // new GestureDetector(
        //   onTap: () {
        //     Share.share('text');
        //       },
        //     child: new Text("Share", textAlign: TextAlign.center,
        //     ),
        // ),
        //   // Text('share', style: TextStyle() ) ,
        new GestureDetector(
          onTap: () {
          //   AlertDialog(title: new Text("Alert Dialog title"),
          // content: new Text("Alert Dialog body"),);
          print('Notification button pressed');
          // debugPrint('Notification button pressed');
          // Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => new WebViewExample()),
          //     );
          // return new WebViewExample();
          return new WebViewExample();
        //   return WebView(
        //   initialUrl: 'assets/PrivacyPolicy.js',
        //   javascriptMode: JavascriptMode.unrestricted,
        //   onWebViewCreated: (WebViewController webViewController) {
        //   // _controller = webViewController;
        //     _controller.complete(webViewController);
        //   },
        // );
        },
        child: new Icon(
          Icons.add_alert,
          color: Colors.white,
          size: 24.0,
          // semanticLabel: 'Text to announce in accessibility modes',
      
          ),
        ),
        
        
          // Text('noti')
      ],
    ),
    // body: Container(R
    //   child: Row(
    //     children: <Widget>[
          
    //     ],
    //   ),
    // ),
  ),
  
  debugShowCheckedModeBanner: false,
);
  }
  // _loadHtmlFromAssets() async {
  //   String fileText = await rootBundle.loadString('assets/PrivacyPolicy.html');
  //   _controller.loadUrl( Uri.dataFromString(
  //       fileText,
  //       mimeType: 'text/html',
  //       encoding: Encoding.getByName('utf-8')
  //   ).toString());
  // }
}


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    // key: scaffoldKey,
    appBar: AppBar(
      title: const Text('AppBar Demo'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            //scaffoldKey.currentState.showSnackBar(snackBar);
          },
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Next page',
          onPressed: () {
            // openPage(context);
          },
        ),
      ],
    ),
    body: const Center(
      child: Text(
        'This is the home page',
        style: TextStyle(fontSize: 24),
      ),
    ),
  );
}
}