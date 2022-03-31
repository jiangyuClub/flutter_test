import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class MYJsonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的标题MYJsonPage"),
      ),
      body: MYJsonBody(),
    );
  }
}

class MYJsonBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MYJsonBodyState();
  }
}

class MYJsonBodyState extends State<MYJsonBody> {
  Anchor? _json;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonToModel().then((value) {
      setState(() {
        _json = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("hhh：$_json");
  }

  Future<Anchor> getJsonToModel() async {
    String jsonString = await rootBundle.loadString("assets/jsons/test.json");
    print("结果==$jsonString");
    // 2.转成List或Map类型
    final jsonResult = json.decode(jsonString);
    print("结果==$jsonResult");

    Anchor anccc = Anchor.withMap(jsonResult);
    print("结果==$anccc");
    return anccc;
  }
}



class Anchor {
  String? nickname;
  String? roomName;
  String? imageUrl;

  Anchor({this.nickname, this.roomName, this.imageUrl});

  Anchor.withMap(Map<String, dynamic> parsedMap) {
    this.nickname = parsedMap["nickname"];
    this.roomName = parsedMap["roomName"];
    this.imageUrl = parsedMap["roomSrc"];
  }
}
