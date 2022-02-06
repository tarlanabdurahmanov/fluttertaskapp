import 'package:flutter/material.dart';

TextStyle lowTextStyle({
  Color color = Colors.black,
  double fontSize = 13,
  FontWeight fontWeight = FontWeight.w600,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle normalTextStyle({
  Color color = Colors.black,
  double fontSize = 15,
  String? fontFamily,
  FontWeight fontWeight = FontWeight.w600,
}) {
  return TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
