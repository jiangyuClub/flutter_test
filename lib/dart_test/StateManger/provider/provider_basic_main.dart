import 'package:flutter/material.dart';
import 'package:flutter_app/dart_test/StateManger/provider/viewmodel/counter_view_model.dart';
import 'package:provider/provider.dart';


//ChangeNotifierProvider只能共享单个viewmodel
/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其它位置使用共享的数据
 *  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
 *  > Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
 *  > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 *  Selector可以减少不必要的渲染
 *  参考文档：day14
 */

void main() {
  runApp(
    // 2.在应用程序的顶层ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (ctx) => HYCounterViewModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider基本用法',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider基本用法"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HYShowData01(),
            HYShowData02()
          ],
        ),
      ),
      //Selector可以减少不必要的渲染
      floatingActionButton: Selector<HYCounterViewModel, HYCounterViewModel>(
        selector: (ctx, counterVM) => counterVM,
        shouldRebuild: (prev, next) => false,
        builder: (ctx, counterVM, child) {
          print("floatingActionButton build方法被执行");
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterVM.counter += 1;
            },
          );
        },
        child: Icon(Icons.add),
      )
    );
  }
}

class HYShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 3.在其它位置使用共享的数据
    int counter = Provider.of<HYCounterViewModel>(context).counter;

    print("data01的build方法");

    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text("当前计数: $counter", style: TextStyle(fontSize: 30),),
        ],
      ),
    );
  }
}

class HYShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("data02的build方法");

    return Container(
      color: Colors.red,
      child: Consumer<HYCounterViewModel>(
        builder: (ctx, counterVM, child) {
          print("data02 Consumer build方法被执行");
          return Text("当前计数: ${counterVM.counter}", style: TextStyle(fontSize: 30),);
        },
      ),
    );
  }
}