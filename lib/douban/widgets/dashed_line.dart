
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JYDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  JYDashedLine({
    this.axis = Axis.horizontal,
    this.dashedWidth = 4,
    this.dashedHeight = 2,
    this.count = 10,
    this.color = Colors.red
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getDashedLineSubs(),
    );
  }

  List<Widget> getDashedLineSubs() {
    return List.generate(count, (_) {
      return SizedBox(
        width: dashedWidth,
        height: dashedHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
        ),
      );
    });
  }
}
