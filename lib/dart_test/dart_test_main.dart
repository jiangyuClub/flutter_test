import 'package:flutter/material.dart';
import 'package:flutter_app/dart_test/Event/MYEventBusPage.dart';
import 'package:flutter_app/dart_test/Event/MYGesturePage.dart';
import 'package:flutter_app/dart_test/MYHomePage.dart';
import 'package:flutter_app/dart_test/StateManger/MYInheritedWidgetPage.dart';


void main() {
  runApp(
    MYApp()
  );
}

class MYApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MYHomePage()
    );
  }
}
