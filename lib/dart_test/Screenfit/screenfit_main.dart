import 'package:flutter/material.dart';
import 'package:flutter_app/dart_test/Screenfit/size_fit.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 2.手机屏幕的大小(逻辑分辨率)
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusHeight = MediaQuery.of(context).padding.top;
    print("屏幕宽高: $width * $height");
    print("状态栏的高度: $statusHeight");
    print(HYSizeFit.screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: Text("屏幕适配"),
      ),
      body: Center(
        child: Container(
          width: HYSizeFit.setRpx(400),
          height: HYSizeFit.setPx(200),
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("Hello World", style: TextStyle(fontSize: 40 * HYSizeFit.rpx),),
        ),
      ),
    );
  }
}