import 'package:flutter/material.dart';
import 'package:flutter_app/dart_test/Router/MYAboutPage.dart';
import 'package:flutter_app/dart_test/Router/MYDetailPage.dart';
import 'package:flutter_app/dart_test/Router/MYUnknownPage.dart';
import 'package:flutter_app/dart_test/Router/router_main.dart';

//所有router映射管理类
class JYRouter {
  //router映射
  static final Map<String, WidgetBuilder> routes = {
    HYHomePage.routeName: (ctx) => HYHomePage(),
    HYAboutPage.routeName: (ctx) => HYAboutPage()
  };

  //app初始router
  static final String initialRoute = HYHomePage.routeName;

  //带参数的router
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == HYDetailPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return HYDetailPage(settings.arguments as String);
          }
      );
    }
    return null;
  };

  //跳转了为配置的router处理
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return HYUnknownPage();
        }
    );
  };
}