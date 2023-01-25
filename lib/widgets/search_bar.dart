import 'package:flutter/material.dart';
import 'package:movies_app/resources/strings_manager.dart';
import 'package:movies_app/resources/values_manager.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Icon(
              Icons.search,
              size: 40,
            ),
          ),
          labelText: AppStrings.searchMovie,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.equalizer,
              size: 40,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
