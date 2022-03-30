import 'package:flutter/material.dart';
import 'package:flutter_app/douban/pages/main/initialize_items.dart';

class JYMainPage extends StatefulWidget {
  @override
  _JYMainPageState createState() => _JYMainPageState();
}

class _JYMainPageState extends State<JYMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: items,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
      ),
    );
  }
}

