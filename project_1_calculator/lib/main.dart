import 'package:flutter/material.dart';

import './homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

