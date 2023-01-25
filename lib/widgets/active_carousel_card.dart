import 'package:flutter/material.dart';
import 'package:movies_app/resources/values_manager.dart';

class ActiveCarouselCard extends StatelessWidget {
  final String imagePath;

  ActiveCarouselCard({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppPadding.p50, vertical: AppPadding.p12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
