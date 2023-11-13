import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizle/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xff002adb);

const Color primaryColorLight = Color(0xff7421d9);

const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final systemDarkTheme = ThemeData.dark();

    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      )
    );
  }
}
