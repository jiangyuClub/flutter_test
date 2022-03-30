import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/service/http_request.dart';

class MYNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的标题1"),
      ),
      body: MYNetworkBody(),
    );
  }
}

class MYNetworkBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MYNetworkBodyState();
  }
}

class MYNetworkBodyState extends State<MYNetworkBody> {
  String _json = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    getJsonToModel().then((value) {
      print("待展示数据==$value");
      setState(() {

        _json = value;
        print("待展示数据==$value");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("hhh：$_json");
  }

  Future<String> getJsonToModel() async {
    var res = await HttpRequest.request("https://httpbin.org/get");
    print("结果==$res");

    return res.toString();
  }
}
