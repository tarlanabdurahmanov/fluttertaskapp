import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/strings.dart';

import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();
  @override
  ThemeData get theme => ThemeData(
        fontFamily: manropeFont,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: _appColorScheme,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              elevation: 3,
              iconTheme: IconThemeData(color: Colors.white, size: 21),
            ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black12,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.2,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: primaryColor,
      secondary: Colors.white,
      background: primaryColor,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      surface: primaryColor,
      error: primaryColor,
      onPrimary: primaryColor,
      onBackground: Colors.black12,
      onError: primaryColor,
      brightness: Brightness.light,
    );
  }
}
