
import 'dart:math';

import 'package:flutter/material.dart';

class MYGlobalKeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key和GlobalKey使用"),
      ),
      body: MYGlobalKeyPageBody(),
    );
  }
}


/**
 * GlobalKey案例
 * 默认StatefulWidget和State中能访问外部的widget，但外部的widget不能访问他们的属性和方法
 * 可以通过传入GlobalKey实现互传
 * */
class MYGlobalKeyPageBody extends StatelessWidget {
  final String title = "列表测试";
  final GlobalKey<_HYHomeContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: HYHomeContent(key: homeKey),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.gesture),
        onPressed: () {
          print(homeKey.currentState!.message);
          print(homeKey.currentState!.widget.name);
          homeKey.currentState!.test();
        },
      ),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  final String name = "coderwhy";

  HYHomeContent({Key? key}) : super(key: key);

  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final String message = "123";

  void test() {
    print("testtesttest");
  }

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}





/**
 * Key的案例
 * 案例：点击删除按钮，删除第一个颜色的cell
 * 默认删除数据之后UI重新渲染，使用传入的固定key之后，底层会根据key值前后匹配等选择是否重新渲染
 * 参考：王红元 day13
 * */
class MYKeyPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MYKeyPageBodyState();
  }
}

class MYKeyPageBodyState extends State<MYKeyPageBody> {
  final List<String> names = ["aaaa", "bbbb", "cccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: ListView(
        children: names.map((item) {
          //随机key
//          return ListItemFul(item, key: UniqueKey(),);
        //将item当成key传入
          return ListItemFul(item, key: ValueKey(item),);
//          return ListItemLess(item,);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemLess extends StatelessWidget {
  final String name;
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  ListItemLess(this.name);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
      height: 80,
      color: randColor,
    );
  }
}

class ListItemFul extends StatefulWidget {
  final String name;
  ListItemFul(this.name, {Key? key}): super(key: key);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
//  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 30),),
      height: 80,
      color: randColor,
    );
  }
}
