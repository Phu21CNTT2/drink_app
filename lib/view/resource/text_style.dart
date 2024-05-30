import 'package:flutter/material.dart';

class TextStyleClass {
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  TextStyleClass({
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.decoration = TextDecoration.none,
  });
  TextStyle textStyleSmall(context) => TextStyle(
        fontSize: 12,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
  TextStyle textStyleMedium(context) => TextStyle(
        fontSize: 18,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
  TextStyle textStyleLarge(context) => TextStyle(
        fontSize: 24,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
}
