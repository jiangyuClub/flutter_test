import 'package:flutter/material.dart';

class MYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的首页"),
      ),
      body: MYHomeBody(),
    );
  }
}

class MYHomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MYHomeBodyState();
  }
}

class MYHomeBodyState extends State<MYHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Text("hhh");
  }
}
