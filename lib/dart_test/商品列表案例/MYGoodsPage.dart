import 'dart:ui';

import 'package:flutter/material.dart';

class MYGoodsPage extends StatelessWidget {

  MYGoodsPage() {
    print("MYGoodsPage创建");
  }
  @override
  Widget build(BuildContext context) {
    print("MYGoodsPage创建build");
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: MYGoodsBody(),
    );
  }
}


class MYGoodsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MYGoodsItem("冰墩墩", "150", "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G320105A7%2F200G3105A7-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649930793&t=56492e614b659d13b9abb7142b3586b8"),
        MYGoodsItem("冰墩墩", "150", "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G320105A7%2F200G3105A7-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649930793&t=56492e614b659d13b9abb7142b3586b8"),
        MYGoodsItem("冰墩墩", "150", "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G320105A7%2F200G3105A7-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649930793&t=56492e614b659d13b9abb7142b3586b8"),
      ],
    );
  }
}


class MYGoodsItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imagUlr;
  final sty1 = TextStyle(color: Colors.orange, fontSize: 30);
  final sty2 = TextStyle(color: Colors.red, fontSize: 20);

  MYGoodsItem(this.title, this.desc, this.imagUlr);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 4,
          color: Colors.green
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: sty1,),
          SizedBox(height: 8,),
          Text(desc, style: sty2,),
          SizedBox(height: 8,),
          Image.network(imagUlr),
        ],
      ),
    );
  }
}
