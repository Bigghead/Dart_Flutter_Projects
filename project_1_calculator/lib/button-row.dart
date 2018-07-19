import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {

  final List _buttons;
  final printValue;

  ButtonRow(this._buttons, this.printValue){
    print(_buttons);
  }

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Row(
          children: _buttons.map( (button) {
            return Expanded(
              child: MaterialButton(
                    height: 110.0,
                    child: Text(button.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
                    textColor: Colors.black,
                    color: Colors.grey[100],
                    onPressed: (){
                      printValue(button.toString());
                    },
                  ),
            );
          } ).toList(),
        ),
      );
    }
}