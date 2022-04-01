import 'package:flutter/material.dart';
import 'package:flutter_app/dart_test/Router/MYAboutPage.dart';
import 'package:flutter_app/dart_test/Router/MYDetailPage.dart';
import 'package:flutter_app/dart_test/Router/router.dart';

void main() => runApp(MyApp());


/**
 * 案例：首页跳转到详情页、关于页等，传递入参获取返回值
 * 传递参数有两种：1.Navigater.push构造器传参，2.Navigater.pushname（argument：）
 * 通过路由名字跳转，需要在APP入口MaterialApp下配置routes、onGenerateRoute等映射
 * */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Router跳转',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      routes: JYRouter.routes,
      initialRoute: JYRouter.initialRoute,
      onGenerateRoute: JYRouter.generateRoute,
      onUnknownRoute: JYRouter.unknownRoute,
    );
  }
}

class HYHomePage extends StatefulWidget {
  //首页路由是"/"
  static const String routeName = "/";

  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  String _homeMessage = "default message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_homeMessage, style: TextStyle(fontSize: 20, color: Colors.red),),
            ElevatedButton(
              child: Text("跳转到详情"),
              onPressed: () => _jumpToDetail(context),
            ),
            ElevatedButton(
              child: Text("跳转到关于"),
              onPressed: () => _jumpToAbout(context),
            ),
            ElevatedButton(
              child: Text("跳转到详情"),
              onPressed: () => _jumpToDetail2(context),
            ),
            ElevatedButton(
              child: Text("跳转到设置"),
              onPressed: () => _jumpToSettings(context),
            ),
          ],
        ),
      ),
    );
  }

  void _jumpToDetail(BuildContext context) {
    // 1.普通的跳转方式
    // 传递参数: 通过构造器直接传递即可
    Future result = Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) {
        return HYDetailPage("a home message");
      }
    ));

    result.then((res) {
      setState(() {
        _homeMessage = res;
      });
    });
  }

  void _jumpToAbout(BuildContext context) {
    Navigator.of(context).pushNamed(HYAboutPage.routeName, arguments: "a home message");
  }

  void _jumpToDetail2(BuildContext context) {
    Navigator.of(context).pushNamed(HYDetailPage.routeName, arguments: "a home detail2 message");
  }

  void _jumpToSettings(BuildContext context) {
    Navigator.of(context).pushNamed("/aaaa");
  }
}

