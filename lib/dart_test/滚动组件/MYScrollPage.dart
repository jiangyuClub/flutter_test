import 'dart:math';

import 'package:flutter/material.dart';


/**
 * Flutter滚动视图1：ListView和GrideView
 * */

class MYScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动页面"),
      ),
      body: MYListBody(),
    );
  }
}

class MYListBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MYListBodyState();
  }
}


class MYListBodyState extends State<MYListBody> {
  @override
  Widget build(BuildContext context) {
    return GrideDemo2();
  }
}

/// GrideView
class GrideDemo2 extends StatelessWidget {
  const GrideDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            );
          }),
    );
  }
}

class GrideDemo1 extends StatelessWidget {
  const GrideDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        }),
      ),
    );
  }
}

///ListView
class ListDemo3 extends StatelessWidget {
  const ListDemo3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext ctx, int index) {
        return Text("哈哈哈： $index");
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.red,
        );
      },
    );
  }
}

class ListDemo2 extends StatelessWidget {
  const ListDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50,
        itemBuilder: (BuildContext ctx, int index) {
          return Text("哈哈哈： $index");
        });
  }
}

class ListDemo1 extends StatelessWidget {
  const ListDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(100, (index) {
      return ListTile(
        title: Text("联系人"),
        subtitle: Text("电话号码"),
      );
    }));
  }
}
