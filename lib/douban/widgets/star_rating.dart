

import 'package:flutter/material.dart';

class JYStarRating extends StatefulWidget {
  final double? rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  Widget unselectedImage;
  Widget selectedImage;

  JYStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),

    Widget? unselectedImage,
    Widget? selectedImage,
  }): unselectedImage = Icon(Icons.star_border, color: unselectedColor, size: size),
        selectedImage = Icon(Icons.star, color: selectedColor, size: size);


  @override
  _JYStarRatingState createState() => _JYStarRatingState();
}

class _JYStarRatingState extends State<JYStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(children: buildUnselectedStar(), mainAxisSize: MainAxisSize.min,),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar())
      ],
    );
  }

  List<Widget>buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget>buildSelectedStar() {
    List<Widget> stars = [];

    final Widget star = widget.selectedImage;
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating! / oneValue).floor();

    //完整的星星
    for (var i=0; i<entireCount; i++) {
      stars.add(star);
    }

    //不完整的星星
    double leftWidth = ((widget.rating! / oneValue) - entireCount) * widget.size;
    final falfStar = ClipRect(
        clipper: JYStarClipper(leftWidth),
        child: star
    );

    stars.add(falfStar);

    return stars;
  }



}

/**
 * 根据裁剪大小返回裁剪后的图片
 * */
class JYStarClipper extends CustomClipper<Rect> {
  double width;

  JYStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(JYStarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}

