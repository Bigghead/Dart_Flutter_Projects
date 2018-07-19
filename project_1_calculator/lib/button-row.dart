import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {

  final List<int> _buttons;

  ButtonRow(this._buttons);

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Row(
          children: _buttons.map( (button) {
            return Expanded(
              child: MaterialButton(
                    height: 100.0,
                    child: new Text("8",
                    style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
                    textColor: Colors.black,
                    color: Colors.grey[100],
                    onPressed: (){},
                  ),
            );
          } ).toList(),
        ),
      );
    }
}