import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/features/theme/presentation/screen/my_theme.dart';

class DarkTheme extends MyTheme{
  @override
  Color get backgroundColor => ColorManager.black;

  @override
  Color get primaryColor => ColorManager.black;

  @override
  Color get textColor => ColorManager.white;

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: backgroundColor,
    hintColor: backgroundColor,
    // focusColor: Color(0xFF7B7B7B),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: backgroundColor
    ),
    scaffoldBackgroundColor: backgroundColor,

  );

}