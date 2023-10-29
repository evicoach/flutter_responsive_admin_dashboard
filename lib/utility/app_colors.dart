import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color appGreen = Color(0xFF00A85A);
  static const Color appRed = Colors.red;
  static const Color enabledBorderColor = Color(0xFFB2B2B2);
  static const Color dashboardBackground = Color(0xFFFFFAF8);
  static const Color textFieldHintColor = Color(0xFF959595);
  static const Color appGreen2 = Color(0xFF059157);
  static const Color darkGreen = Color(0xFF045860);
  static const Color paleGold = Color(0xFFFBF1CC);
  static const Color gold = Color(0xFFECBD22);
  static const Color cancelColor = Color(0xFFAAB2BE);
  static const Color grey = Color(0xFFC4C4C4);
  static const Color textGrey = Color(0xFF939BA9);
  static const Color greyLineColor = Color(0xFFE6ECF6);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color grey22 = Color(0xFF222222);
  static const Color grey95 = Color(0xFF959595);
  static const Color greyD5 = Color(0xFFD5D5D5);
  static const Color greyD9 = Color(0xFFD9D9D9);
  static const Color tokenFieldBorderColor = Color(0xFFBDBDBD);
  static final Color black30 = Colors.black.withOpacity(.30);
  static const Color appYellow = Color(0xFFFFCC00);
  static const Color paleYellow = Color(0xFFFBF1CC);
  static const Color activeIconColor = Color(0xFFFFCC00);
  static const Color inactiveIconColor = Color(0xFF959595);
  static const Color grey75 = Color(0xFF757575);
  static const Color greyF4 = Color(0xFFF4F4F4);
  static const Color grey4F = Color(0xFF4F4F4F);
  static const Color greyF5 = Color(0xFFF5F5F5);
  static const Color greyE5 = Color(0xFFE5E5E5);
  static const Color deepGrey = Color(0xFF263238);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // static const Color primaryColor = Color(0xFFFF5101);
  static const Color primaryColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFFFFCC00);

  static const Color borderGrey = Color(0xFFD5D5D5);

  static const Color transparent = Color(0x00000000);
  static const Color transparentBlack = Color(0x99000000);

  static const Color tabOrange = Color(0xFFFBF1CC);
  static const Color iconOrange = Color(0xFFFFCC00);
  static const Color iconGrey = Color(0xFF959595);

  static const Map<int, Color> _color = {
    50: Color.fromRGBO(255, 81, 1, .1),
    100: Color.fromRGBO(255, 81, 1, .2),
    200: Color.fromRGBO(255, 81, 1, .3),
    300: Color.fromRGBO(255, 81, 1, .4),
    400: Color.fromRGBO(255, 81, 1, .5),
    500: Color.fromRGBO(255, 81, 1, .6),
    600: Color.fromRGBO(255, 81, 1, .7),
    700: Color.fromRGBO(0255, 81, 1, .8),
    800: Color.fromRGBO(255, 81, 1, .9),
    900: Color.fromRGBO(255, 81, 1, 1),
  };
  static final MaterialColor appColorSwatch =
      MaterialColor(primaryColor.value, _color);
}
