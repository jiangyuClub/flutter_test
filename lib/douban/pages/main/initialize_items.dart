
import 'package:flutter/material.dart';
import 'package:flutter_app/douban/pages/home/home.dart';
import 'package:flutter_app/douban/pages/main/bottom_bar_item.dart';
import 'package:flutter_app/douban/pages/subject/subject.dart';

List<JYBottomBarItem> items = [
  JYBottomBarItem("home", "首页"),
  JYBottomBarItem("subject", "书影音"),
  JYBottomBarItem("group", "小组"),
  JYBottomBarItem("mall", "市集"),
  JYBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  JYHomePage(),
  JYSubjectPage(),
  JYHomePage(),
  JYHomePage(),
  JYHomePage(),
];