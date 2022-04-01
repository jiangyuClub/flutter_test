import 'package:flutter/material.dart';


/**
 * 案例：详情页必传参数_message，返回回传首页信息
 * WillPopScope拦截默认的导航栏返回按钮事件
 * 可以通过Navigator.of(context).pop()回传参数给上一页面，通过Future.then获取结果
 * */
class HYDetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  final String _message;

  HYDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 当返回为true时,可以自动返回(flutter帮助我们执行返回操作)
      // 当返回为false时, 自行写返回代码
      onWillPop: () {
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back),
//          onPressed: () => _backToHome(context),
//        ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message, style: TextStyle(fontSize: 20),),
              ElevatedButton(
                child: Text("回到首页"),
                onPressed: () => _backToHome(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    //pop参数回传给上一页面信息
    Navigator.of(context).pop("a detail message");
  }
}
