import 'package:flutter/material.dart';

import 'pin.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pin',
      home: Pin(
        validPin: '0000',
        toRoute: (_) => Home(),
      ),
    );
  }
}
