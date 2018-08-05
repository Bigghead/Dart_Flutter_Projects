import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {

  final List _buttons;
  final printValue;

  ButtonRow(this._buttons, this.printValue);

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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0,),),
                    textColor: Color(int.parse('#E2E5F1'.substring(1, 7), radix: 16) + 0xFF000000),
                    onPressed: (){
                      printValue(button);
                    },
                  ),
            );
          } ).toList(),
        ),
      );
    }
}