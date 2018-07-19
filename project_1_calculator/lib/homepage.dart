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

  int    _totalValue = 0;
  String _currentVal = '0';
  List   _buttons = [ [ 7, 8, 9, '+' ], 
                   [ 4, 5, 6, '-' ],
                   [ 1, 2, 3, '*' ],
                   [ 'C', 0, '=', '/'] ];
  Map    _operands = {
    '+': true,
    '-': true,
    '*': true,
    '/': true,
  };
  // String  _currentOperand = '';

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
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
              ),
              alignment: Alignment.bottomRight,
              color: Colors.white,
              child: Text(
                _currentVal,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black
                ),
                textAlign: TextAlign.right,
              ),
            ),

            Column(
              children: _buttons.map( ( button ) {
                return ButtonRow(button, printValue);
              } ).toList(),
            ),

            BottomAppBar(
              child: Text(''),
            )
          ],
        )
      );
    }

  void printValue( String value ) {
    print(value);

    setState(() {
      _currentVal = _currentVal == '0' && !_operands.containsKey(value)
                        ? value + ''
                        : _currentVal + value + '';

    });
    print(_currentVal);
  }

  calculate() {
    List allValues = _currentVal.split(' ');
    allValues.forEach( ( val ) {
      
    });
  }
}