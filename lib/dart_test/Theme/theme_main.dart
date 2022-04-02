import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/dart_test/Theme/shared/app_theme.dart';

void main() => runApp(MyApp());


/**
 * 可以设置整个app的主题和暗黑主题，还可以设置单个widget的主题
 * 1.一旦设置了主题, 那么应用程序中的某些Widget, 就会直接使用主题的样式
 * 2.可以通过Theme.of(context).textTheme.display2
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: HYAppTheme.norTheme,
      darkTheme: HYAppTheme.darkTheme,
      home: MYThemePage(),
      //MYThemePage
    );
  }
}

class MYThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 全局主题
      theme: ThemeData(
        // 1.亮度
          brightness: Brightness.light,
          // 2.primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
          primarySwatch: Colors.red,
          // 3.primaryColor: 单独设置导航和TabBar的颜色
          primaryColor: Colors.orange,
          // 4.accentColor: 单独设置FloatingActionButton\Switch
          accentColor: Colors.green,
          // 5.Button的主题
          buttonTheme: ButtonThemeData(
              height: 25,
              minWidth: 10,
              buttonColor: Colors.yellow
          ),
          // 6.Card的主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10
          ),
          // 7.Text的主题
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 16, color: Colors.red),
              bodyText2: TextStyle(fontSize: 20),
              subtitle1: TextStyle(fontSize: 14),
              subtitle2: TextStyle(fontSize: 16)
          )
      ),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("首页")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hello World"),
            Text("Hello World", style: TextStyle(fontSize: 14),),
            Text("Hello World", style: TextStyle(fontSize: 20),),
            Text("Hello World", style: Theme.of(context).textTheme.bodyText2,),
            Text("Hello World", style: Theme.of(context).textTheme.bodyText2,),
            Switch(value: true, onChanged: (value) {},),
            CupertinoSwitch(value: true, onChanged: (value) {}, activeColor: Colors.red,),
            ElevatedButton(child: Text("R"), onPressed: () {},),
            Card(child: Text("你好啊,李银河", style: TextStyle(fontSize: 50),),)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text("首页"),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text("分类"),
              icon: Icon(Icons.category)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return HYDetailPage();
              }
          ));
        },
      ),
    );
  }
}


class HYDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Colors.purple
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text("detail pgae"),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.pink
              )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
}
