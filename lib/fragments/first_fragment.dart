import 'package:flutter/material.dart';

class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Center(
      // return new Container(
// width: 300.0,
              // padding: const EdgeInsets.only(top: 16.0),
      // )
        child: new Column(
          // new SizedBox(
      //  mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[
        RaisedButton(
            color: Color(1000),
            
            child: Text('start'),
            onPressed: () {
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text("Start"),
                    content: new Text("Starting"),
                  ));
            }),
        RaisedButton(
          color: Color(1100),
          child: Text('Continue'),
          onPressed: () {
            print('hi');
          },
        ),
        RaisedButton(
          child: Text('Tamil calendar'),
          color: Color(5400),
          onPressed: () {
            print('hi');
          },
        ),
      ],
    )
    
    );
  }
}
