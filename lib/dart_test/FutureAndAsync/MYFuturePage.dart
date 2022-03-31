import 'dart:io';
import "dart:async";
import 'package:flutter/material.dart';

class MYFuturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步练习Future"),
      ),
      body: MYFutureBody(),
    );
  }
}

class MYFutureBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MYScheduleMicrotaskBodyState();
  }
}


/**
 * MYScheduleMicrotaskBodyState微任务
 * 在Dart中还存在另一个队列：微任务队列（Microtask Queue）。
    微任务队列的优先级要高于事件队列；
    也就是说事件循环都是优先执行微任务队列中的任务，再执行 事件队列 中的任务；
    file:///Users/jiangyu/Documents/Flutter/y3869_王红元《Flutter从入门到实战》（高清视频）/Flutter资料day01~23/day10/document/彻底搞定Dart的异步.htm
 * */
class MYScheduleMicrotaskBodyState extends State<MYFutureBody> {
  @override
  Widget build(BuildContext context) {
    print("开始");

    Future(() => print("task1"));

    final future = Future(() => null);

    Future(() => print("task2")).then((_) {
      print("task3");
      scheduleMicrotask(() => print('task4'));
    }).then((_) => print("task5"));

    future.then((_) => print("task6"));

    scheduleMicrotask(() => print('task7'));

    Future(() => print('task8'))
        .then((_) => Future(() => print('task9')))
        .then((_) => print('task10'));

    print("结束");
    return Text("HHH");
  }
}




/**
 * Await，Async是Future的语法糖
 * */
class MYAwaitAsyncBodyState extends State<MYFutureBody> {
  @override
  Widget build(BuildContext context) {
    print("开始");

    //模拟场景：3次请求，每次返回的结果作为第二次的参数
//    getData("参数1").then((value){
//      print("结果1==$value");
//      return getData(value);
//    }).then((value) {
//      print("结果2==$value");
//      return getData(value);
//    }).then((value) {
//      print("结果3==$value");
//      return getData(value);
//    });


    //Future改成await async模式
    getAwaitData().then((value) {
      print("await总结果==$value");
    });


    print("结束");
    return Text("HHH");
  }


  /**
   * await必须要在async函数中使用，函数名尾部加async关键字
   * 返回值必须是Future
   * */
  Future getAwaitData() async {
    var res1 = await getData("await参数1");
    print("await结果1==$res1");
    var res2 = await getData(res1);
    print("await结果2==$res2");
    var res3 = await getData(res2);
    print("await结果3==$res3");
    return res3;
  }

  /**
   * 模拟单次网络请求方法
   * */
  Future<String> getData(String arg) {
    return Future((){
      sleep(Duration(seconds: 2));
      return "$arg+哈哈";
    });
  }

}



/**
 * Future的链式调用
 * */
class MYFutureListBodyState extends State<MYFutureBody> {
  @override
  Widget build(BuildContext context) {
//    futureTest();
    futureTest2();
    return Text("HHH");
  }
  

  void futureTest() {
    print("开始");
    Future((){
      sleep(Duration(seconds: 2));
      return "第一次结果";
    }).then((value){
      print("结果=$value");
      sleep(Duration(seconds: 1));
      return "第2次结果";
    }).then((value){
      print("结果=$value");
    }).whenComplete(() {
      print("异步代码执行完成");
    });
    print("结束");
  }


  void futureTest2() {
    Future.value("哈哈哈").then((value) {
      print(value);
    });

    Future.error("错误").catchError((err){
      print(err);
    });

    Future.delayed(Duration(seconds: 2)).then((value) {
      return "延时返回";
    }).then((value) {
      print(value);
    });

  }
  
}


/**
 * Future基本用法
 * */
class MYFutureBodyState extends State<MYFutureBody> {
  @override
  Widget build(BuildContext context) {
    print("开始");
    var future = getNetData();
    future.then((String value){
      print("结果=$value");
    }).catchError((erroo) {
      print(erroo);
    }).whenComplete((){
      print("异步代码执行完成");
    });
    print("结束");
    return Text("HHH");
  }


  Future<String> getNetData() {
    return Future((){
      sleep(Duration(seconds: 2));
      throw Exception("异常");
      return "Future data";
    });
  }
}