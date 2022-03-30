
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_app/douban/pages/home/home_model.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    String jsonString = await rootBundle.loadString("assets/jsons/home.json");
    // 2.转成List或Map类型
    final jsonResult = json.decode(jsonString);
//    print("结果==$jsonResult");

    List<MovieItem> movies = [];
    for (var item in jsonResult) {
      movies.add(MovieItem.fromMap(item));
    }
//    print("结果==$movies");

    return movies;
  }
}