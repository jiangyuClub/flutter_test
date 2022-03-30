

import 'package:flutter/material.dart';
import 'package:flutter_app/douban/pages/home/home_model.dart';
import 'package:flutter_app/douban/widgets/dashed_line.dart';
import 'package:flutter_app/douban/widgets/star_rating.dart';

class JYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  JYHomeMovieItem(this.movie);

  //电影列表cell
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      //用边框实现底部分割线
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffcccccc), width: 8))
      ),
      //
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buidHeader(),
          SizedBox(height: 8,),
          buildContent(),
          SizedBox(height: 8,),
          buildFooter()
        ],
      ),
    );
  }

  //头部
  Widget buidHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(movie.rank!, style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),),
    );
  }

  //2.中间内容
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(width: 8,),
        Expanded(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  buildContentInfo(),
                  SizedBox(width: 8,),
                  buildContentLine(),
                  SizedBox(width: 8,),
                  buildContentWish(),
                ],
              ),
            )
        ),
      ],
    );
  }

  //2.1 电影图片
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
        child: Image.asset("assets/images/home/movie_icon.png", height: 150,)
    );
  }

  //2.2电影介绍
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          SizedBox(height: 8,),
          buildContentInfoRate(),
          SizedBox(height: 8,),
          buildContentInfoDesc()
        ],
      ),
    );
  }

  //2.2.1电影介绍-名称
  Widget buildContentInfoTitle() {
    return Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.pink,
                  size: 30,
                ),
              alignment: PlaceholderAlignment.middle
            ),
            WidgetSpan(
                child: Text(movie.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                alignment: PlaceholderAlignment.middle
            ),
            WidgetSpan(
              child: Text(movie.playDate!, style: TextStyle(fontSize: 18, color: Colors.grey),),
                alignment: PlaceholderAlignment.middle
            )
          ]
        )
    );
  }

  //2.2.1电影介绍-评分
  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        JYStarRating(
          rating: movie.rating!,
          size: 20,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "${movie.rating}",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  //2.2.1电影介绍-简介
  Widget buildContentInfoDesc() {
    return Text(
      movie.desc!,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }


  // 2.3.内容的虚线
  Widget buildContentLine() {
    return Container(
//      height: 100,
      child: JYDashedLine(
        axis: Axis.vertical,
        dashedWidth: .4,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  // 2.4.内容的想看
  Widget buildContentWish() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/home/wish.png", height: 30,),
          Text(
            "想看",
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 235, 170, 60)
            ),
          )
        ],
      ),
    );
  }

  // 3.尾部
  Widget buildFooter() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie.desc!,
        style: TextStyle(fontSize: 16, color: Color(0xff666666)),
      ),
    );
  }

}
