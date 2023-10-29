
import 'package:flutter/material.dart';

TextStyle headerStyle({color, fontSize}) {
  return TextStyle( color: color , fontWeight: FontWeight.bold, fontSize: fontSize ?? 25);
}

TextStyle subHeaderStyle({color}) {
  return TextStyle( color: color , fontWeight: FontWeight.bold, fontSize: 16);
}

TextStyle mediumBodyStyle({color, weight}) {
  return TextStyle(color: color , fontWeight: weight ?? FontWeight.w200, fontSize: 14);
}

TextStyle smallBodyStyle({color, weight}) {
  return TextStyle(color: color, fontWeight: weight ?? FontWeight.w200, fontSize: 12);
}

TextStyle bodyStyle({color}) {
  return TextStyle(color: color );
}

TextStyle underlineBodyStyle({color}) {
  return TextStyle(color: color , decoration: TextDecoration.underline,);
}

TextStyle buttonTextStyle({color}) {
  return TextStyle(
      height: 1.3, color: color , fontWeight: FontWeight.w700);
}

TextStyle underlineButtonTextStyle({color}) {
  return TextStyle(
      height: 1.3, color: color, fontWeight: FontWeight.w700, decoration: TextDecoration.underline, fontSize: 16);
}