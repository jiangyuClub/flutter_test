import 'package:flutter/material.dart';

class MYWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的标题1"),
      ),
      body: MYWidgetBody(),
    );
  }
}

class MYWidgetBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MYWidgetBodyState2();
  }
}

class MYWidgetBodyState extends State<MYWidgetBody> {
  final String imageUrl =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G320105A7%2F200G3105A7-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649930793&t=56492e614b659d13b9abb7142b3586b8";

  @override
  Widget build(BuildContext context) {
//    return Image(image: AssetImage("images/tupian.png"), width: 100.0);
//    return FadeInImage(placeholder: AssetImage("images/tupian.png"), image: NetworkImage(imageUrl));
    return Container(
      width: 200,
      height: 200,
      color: Colors.green,
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          Icons.print,
          size: 50,
        ),
      ),
    );
  }
}

class MYWidgetBodyState2 extends State<MYWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return MyStrack();
  }
}


class MyStrack extends StatefulWidget {

  const MyStrack({
    Key? key,
  }) : super(key: key);

  @override
  State<MyStrack> createState() => _MyStrackState();
}

class _MyStrackState extends State<MyStrack> {
  bool _favor = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      clipBehavior: Clip.none,
      children: [

        GestureDetector(
            child: Image.asset("assets/images/juren.jpeg"),
          onTap: ()=>print("点击图片"),
        ),
        Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
                height: 30,
                color: Color.fromARGB(150, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "你好",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        child: Icon(
                          Icons.favorite,
                          color: _favor ?  Colors.red : Colors.white,
                        ),
                        onTap: () {

                          setState(() {
                            _favor = !_favor;
                          });
                        },
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
              onTap: ()=>print("点击啊哈哈哈"),
            )),
        Expanded(
            flex: 2,
            child: Container(
              width: 180,
              height: 80,
              color: Colors.green,
            )),
        Expanded(
            child: Container(
          width: 80,
          height: 180,
          color: Colors.yellow,
        )),
      ],
    );
  }
}
