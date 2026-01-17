import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/resources/styles_manager.dart';
import 'package:news_app/features/theme/presentation/screen/my_theme.dart';

class LightTheme extends MyTheme {
  @override
  Color get backgroundColor => ColorManager.white;

  @override
  Color get primaryColor => ColorManager.white;

  @override
  Color get secondaryColor => ColorManager.black;

  @override
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        secondaryHeaderColor: secondaryColor,
        hintColor: backgroundColor,
        // focusColor: Color(0xFF7B7B7B),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: backgroundColor,
          titleTextStyle: getRegularStyle(
            color: ColorManager.black,
          ),
          iconTheme: IconThemeData(
            color: ColorManager.black,
          ),
        ),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          titleLarge: getMediumStyle(color: ColorManager.black),
          titleSmall: getLightStyle(color: ColorManager.black),
          headlineMedium: getSemiBoldStyle(color: ColorManager.black),
          titleMedium: getRegularStyle(color: ColorManager.black),
        ),
      );
}
