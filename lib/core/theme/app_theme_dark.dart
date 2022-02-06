import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';

import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeDark extends AppTheme with ILightTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: _appColorScheme,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black12,
          // contentPadding: EdgeInsets.all(15),
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
            ThemeData.dark().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.dark().buttonTheme.copyWith(
              colorScheme: ColorScheme.dark(
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
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: primaryColor, //+
      secondary: primaryColor.withOpacity(.3), //+
      background: primaryColor, //++
      onSecondary: Colors.grey.shade300, // +
      onSurface: Colors.white, // +
      surface: Colors.white, //xx

      error: Colors.red[900]!,
      onPrimary: Colors.white,
      onBackground: Colors.white24, // +++
      onError: Colors.red, //xx
      brightness: Brightness.dark,
    );
  }
}
