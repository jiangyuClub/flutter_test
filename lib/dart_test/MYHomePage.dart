import 'package:flutter/material.dart';

class MYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的标题1"),
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

//class MYHomeBodyState extends State<MYHomeBody> {
//  bool? flag = true;
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Checkbox(
//                value: flag,
//                onChanged: btnAction
//            ),
//            Text("hhh"),
//          ],
//        )
//    );
//  }
//
//  void btnAction (bool? value) {
//    setState(() {
//      flag = value;
//    });
//    print(flag);
//  }
//
//}