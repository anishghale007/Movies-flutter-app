import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/resources/font_manager.dart';
import 'package:movies_app/resources/styles_manager.dart';
import 'package:movies_app/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: kMainThemeColor,
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s24),
      titleMedium: getMediumStyle(color: Colors.white, fontSize: FontSize.s20),
      titleSmall: getMediumStyle(color: Colors.white, fontSize: FontSize.s14),
      bodySmall: getRegularStyle(color: Colors.white),
      bodyLarge: getRegularStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getMediumBoldStyle(color: Colors.white, fontSize: FontSize.s16),
        backgroundColor: kWidgetBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s50),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: Colors.white),
      labelStyle:
          getMediumBoldStyle(color: Colors.white, fontSize: FontSize.s16),
      suffixIconColor: Colors.white,
      prefixIconColor: Colors.white,
      focusColor: kWidgetBackgroundColor,
      fillColor: kWidgetBackgroundColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kMainThemeColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s50),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kWidgetBackgroundColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s50),
        ),
      ),
    ),
  );
}
