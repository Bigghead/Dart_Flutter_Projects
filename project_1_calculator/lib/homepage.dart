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

  int    _value1     = 0;
  int    _value2     = 0;
  int    _totalValue = 0;
  String _currentVal = '0';
  List   _buttons    = [ [ 7, 8, 9, '+' ], 
                         [ 4, 5, 6, '-' ],
                         [ 1, 2, 3, '*' ],
                         [ 'C', 0, '=', '/'] 
                       ];
  String _currentOperand;

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


  void printValue( value ) {

    if( value == '=' ) return getTotal();
    if( value == 'C' ) return reset();
    
    if( value is int ){
      if( _currentOperand == null ) {
        setState(() {
                  _value1 = int.parse(_value1.toString() + value.toString());
                });
      } else {
        setState(() {
                  _value2 = int.parse(_value2.toString() + value.toString());
                });
      }

      setState(() {
              _currentVal = _currentVal == '0' 
                            ? _currentVal = value.toString() + ''
                            :_currentVal = _currentVal + value.toString() + '';
            });

    } else {
      setState(() {
              _currentOperand = value;
              _currentVal = _currentVal == '0'
                              ? '0'
                              : _currentVal + value + '';
              _value1 = ( _value1 > 0 && _value2 > 0 ) 
                            ? calculate(_value1, value, _value2)
                            : _value1;
              _value2 = 0;
            });
    }
  }


  getTotal() {
    setState(() {
          _totalValue = calculate(_value1, _currentOperand, _value2);
          _value1     = _totalValue;
          _value2     = 0;
          _currentVal = _totalValue.toString();
        });
  }


  reset() {
    setState(() {
          _value1     = 0;
          _value2     = 0;
          _totalValue = 0;
          _currentVal = '0';
        });
  }


  int calculate( int total, String operand, int current ) {
    int newValue = 0;
    setState(() {
          switch (operand) {
            case '+':
              newValue = total + current;
              break;
            case '-':
              newValue = total - current;
              break;
            case '*':
              newValue = total * current;
              break;
            case '/':
              newValue = (total / current).round();
              break;
            default:
          }
        });
    
    print(newValue);
    return newValue;
  }
}