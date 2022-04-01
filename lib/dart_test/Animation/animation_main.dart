import 'package:flutter/material.dart';
import 'package:flutter_app/dart_test/Animation/MYAnimatedBuilderPage.dart';
import 'package:flutter_app/dart_test/Animation/MYAnimatedWidgetPage.dart';
import 'package:flutter_app/dart_test/Animation/MYAnimationBasicPage.dart';
import 'package:flutter_app/dart_test/Animation/MYStaggeredAnimationPage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动画',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      //基础动画
//      home: JYAnimationBasicPage(),
//      home: MYAnimatedWidgetPage(),
//      home: MYAnimatedBuilderPage(),
      home: MYStaggeredAnimationPage(),
    );
  }
}
