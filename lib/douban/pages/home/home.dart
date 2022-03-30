import 'package:flutter/material.dart';
import 'package:flutter_app/douban/pages/home/home_content.dart';

class JYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的豆瓣4"),
      ),
      body: JYHomeBody(),
    );
  }
}

