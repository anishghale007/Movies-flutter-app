import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';

class PageIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;

  PageIndicator({required this.length, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 40, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => buildDot(index, context),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 15,
      width: currentIndex == index ? 40 : 15,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? kActiveCarouselColor
            : kInactiveCarouselColor,
      ),
    );
  }
}
