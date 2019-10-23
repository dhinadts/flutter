import 'package:dhina/fragments/first_fragment.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BeginingKural1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
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
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                print("object");
              },
            ),
            IconButton(
              icon: const Icon(Icons.text_format),
              onPressed: () {
                // openPage(context);
                // return new MyApp2();
                print("Text Font Size increasing");
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
        body:
            //   new Padding(
            // padding: new EdgeInsets.all(30.0),
             new SingleChildScrollView(
             child: SizedBox(
                 width: 450.0,
                 height: 600.0,
                 child : 
            new Column(children: <Widget>[
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
          ),
          Column(
            children: <Widget>[
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
              Text(
                "English",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "English explanation",
                style: TextStyle(fontSize: 18),
              ),
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
              )
            ],
          )
        ]))));

    // Sin
    // const Center(
    //   child: Text(
    //     'This is the next page',
    //     style: TextStyle(fontSize: 20),
    //   ),
    // ),
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
