import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/resources/values_manager.dart';

class InactiveCarouselCard extends StatelessWidget {
  final String imagePath;

  InactiveCarouselCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppPadding.p28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}
