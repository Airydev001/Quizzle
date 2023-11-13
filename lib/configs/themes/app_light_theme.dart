import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizle/configs/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color.fromARGB(255, 80, 59, 220);
const Color primaryColorDark = Color.fromARGB(255, 186, 38, 226);

const Color mainTextColor = Color.fromARGB(255, 70, 69, 69);
const Color cardColor = Color.fromARGB(255, 254, 243, 254);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();

    return systemLightTheme.copyWith(
        primaryColor: primaryColorDark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColor,
          displayColor: mainTextColor,
        ));
  }
}
