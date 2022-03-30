import 'package:flutter/material.dart';
import 'package:flutter_app/douban/pages/home/home_model.dart';
import 'package:flutter_app/douban/pages/home/home_movie_item.dart';
import 'package:flutter_app/douban/pages/home/home_request.dart';

class JYHomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JYHomeBodyState();
  }
}

class JYHomeBodyState extends State<JYHomeBody> {
  final List<MovieItem> _movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.requestMovieList(0).then((value) {
      setState(() {
        _movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return JYHomeMovieItem(_movies[index]);
        });
  }
}
