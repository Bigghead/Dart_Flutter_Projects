import 'package:flutter/material.dart';

import './button-row.dart';


class HomePage extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _HomePageState();
    }
}

class _HomePageState extends State<HomePage> {

  int totalValue = 0;
  String currentCal = '';
  List buttons = [ [ 7, 8, 9, '+' ], 
                   [ 4, 5, 6, '-' ],
                   [ 1, 2, 3, '*' ],
                   [ 'C', 0, '=', '/'] ];

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Container( // Display Container
              constraints: BoxConstraints.expand( // Creating a boxed container 
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
              ),
              alignment: Alignment.bottomRight, // Aligning the text to the bottom right of our display screen
              color: Colors.white, // Seting the background color of the container
              child: Text(
                "0",
                style: TextStyle( // Styling the text
                  fontSize: 50.0,
                  color: Colors.black
                ),
                textAlign: TextAlign.right,
              ),
            ),

            Column(
              children: buttons.map( ( button ) {
                return ButtonRow(button, calculate);
              } ).toList(),
            ),

            BottomAppBar(
              child: Text(''),
            )
          ],
        )
      );
    }

  calculate( String value) {
    print(value);
  }
}