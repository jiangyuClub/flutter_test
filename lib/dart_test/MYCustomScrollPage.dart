import 'package:flutter/material.dart';
import 'dart:math';

/**
 * Flutter滚动视图2：CustomScrollView
 * ListView，GrideView底层都是创建一个Sliver，自定义的滚动试图CustomScrollView可以创建多个Sliver实现多层嵌套的滚动样式如保代新版首页的上面楼层tableview下层瀑布流
 *
 * */
class MYCustomScrollPage extends StatefulWidget {
  @override
  State<MYCustomScrollPage> createState() => _MYCustomScrollPageState();
}

/**
 * 滚动监听有两种方式：controller和NotificationListener
 * controller只能监听滚动偏移
 * NotificationListener可以监听滚动开始和结束
 * */
class _MYCustomScrollPageState extends State<MYCustomScrollPage> {
  ScrollController controller = ScrollController(initialScrollOffset: 100);
  bool _isShowUperBtn = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      print("滚动偏移${controller.offset}");
      setState(() {
        _isShowUperBtn = controller.offset > 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification){
          if (notification is ScrollStartNotification) {
            print("滚动开始");
          } else if (notification is ScrollEndNotification) {
            print("滚动结束");
          } else if (notification is ScrollUpdateNotification) {
            print("NotificationListener滚动偏移${notification.metrics.pixels}，总滚动区域${notification.metrics.maxScrollExtent}");
          }
          return true;
        },
        child: ListView.builder(
            controller: controller,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("联系人$index"),
              );
            }),
      ),
      floatingActionButton: _isShowUperBtn ? FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            controller.animateTo(
                0, duration: Duration(seconds: 1), curve: Curves.easeIn);
          }) : null,
    );
  }
}

class CustomScrollDemo2 extends StatelessWidget {
  const CustomScrollDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Hello World"),
            background: Image.asset(
              "assets/images/meinv.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverGrid(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
              );
            }, childCount: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 8, childAspectRatio: 2)),
        SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("人类"),
              );
            }, childCount: 50))
      ],
    );
  }
}

class CustomScrollDemo1 extends StatelessWidget {
  const CustomScrollDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //去除屏幕上下安全区域
        SliverSafeArea(
          //SliverPadding外边框
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        color: Color.fromARGB(255, Random().nextInt(256),
                            Random().nextInt(256), Random().nextInt(256)),
                      );
                    }, childCount: 100),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                )),
          ),
        ),
      ],
    );
  }
}
