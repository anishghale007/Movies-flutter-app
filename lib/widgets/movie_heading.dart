import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/resources/strings_manager.dart';
import 'package:movies_app/resources/values_manager.dart';

class MovieHeading extends StatelessWidget {
  final String heading1;
  final String heading2;

  MovieHeading({
    required this.heading1,
    required this.heading2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: heading1 + ' ',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                TextSpan(
                  text: heading2,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            AppStrings.seeMore,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: kWidgetBackgroundColor),
          ),
        ],
      ),
    );
  }
}
