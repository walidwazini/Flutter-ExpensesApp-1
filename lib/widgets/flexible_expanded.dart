import 'package:flutter/material.dart';

class FlexibleExpanded extends StatefulWidget {
  //const FlexibleExpanded({Key? key}) : super(key: key);

  @override
  _FlexibleExpandedState createState() => _FlexibleExpandedState();
}

class _FlexibleExpandedState extends State<FlexibleExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 100,
            child: Text('Item 1'),
            color: Colors.red,
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              child: Text('Item 2'),
              color: Colors.blue,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              child: Text('Item 3'),
              color: Colors.orange,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
