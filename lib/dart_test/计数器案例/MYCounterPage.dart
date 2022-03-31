
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MYCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的计数器"),
      ),
      body: MYCounterPageBody(),
    );
  }
}

class MYCounterPageBody extends StatefulWidget {
  final String _hhhh = "可以吗";
  @override
  _MYCounterPageState createState() => _MYCounterPageState();
}

class _MYCounterPageState extends State<MYCounterPageBody> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getBtns(),
          Text("当前计数:$_counter+++${this.widget._hhhh}")
        ],
      ),
    );
  }
  
  Widget _getBtns() {
    return Center(
      child: Row(
        //居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              _counter++;
            });
          } , child: Text("按钮+")),
          ElevatedButton(onPressed: (){
            setState(() {
              _counter--;
            });
          } , child: Text("按钮-"))
        ],
      ),
    );
  }
}
