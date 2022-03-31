import 'package:flutter/material.dart';


/**
 * InheritedWidget实现多个子widget共享数据
 * 案例：HYShowData01和HYShowData02共享counter字段
 * 1、创建数据共享类HYCounterWidget，创建贡献字段counter，必须继承InheritedWidget并实现对应方法
 * 2、HYShowData01和HYShowData02的父节点包装成HYCounterWidget，如46行
 * 3、通过of函数和传入的子widget的BuildContext可以向上查找到InheritedWidget，调用counter字段
 * 4、HYCounterWidget的构造方法多一个counter字段，有外部传入，即可实现counter的同步更新
 * */
class HYCounterWidget extends InheritedWidget {
  // 1.共享的数据
  final int counter;

  // 2.定义构造方法
  HYCounterWidget({required this.counter, required Widget child}): super(child: child);

  // 3.获取组件最近的当前InheritedWidget
  static HYCounterWidget? of(BuildContext context) {
    // 沿着Element树, 去找到最近的HYCounterElement, 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.绝对要不要回调State中的didChangeDependencies
  // 如果返回true: 执行依赖当期的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(HYCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class MYInheritedWidgetPage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<MYInheritedWidgetPage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: HYCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HYShowData01(),
              HYShowData02()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}


class HYShowData01 extends StatefulWidget {
  @override
  _HYShowData01State createState() => _HYShowData01State();
}

class _HYShowData01State extends State<HYShowData01> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_HYShowData01State中的didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int? counter = HYCounterWidget.of(context)?.counter;

    return Card(
      color: Colors.red,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30),),
    );
  }
}

class HYShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int? counter = HYCounterWidget.of(context)?.counter;

    return Container(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30),),
    );
  }
}


