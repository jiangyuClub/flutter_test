import 'dart:async';

import 'package:flutter/material.dart';

/**
 * 动画优化2：
 * 通过将动画的widget封装在AnimatedBuilder中，可以减少动画控件的刷新
 * */
class MYAnimatedBuilderPage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<MYAnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  // 创建AnimationController
  late AnimationController _controller;
  late Animation _animation;
  late Animation _sizeAnim;

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );

    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 3.Tween
    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_animation as Animation<double>);

    // 监听动画值的改变
//    _controller.addListener(() {
//      setState(() {});
//    });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("执行_HYHomePageState的build方法");
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (ctx, child) {
              return Icon(Icons.favorite, color: Colors.red, size: _sizeAnim.value);
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
            print(_controller.status);
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
