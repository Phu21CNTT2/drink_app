import 'package:flutter/material.dart';

class Responsive {
  static size(context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final double widgetSize = screenSize.width < screenSize.height
        ? screenSize.width
        : screenSize.height;
    return widgetSize;
  }

  static vertical(context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool directionScreen =
        screenSize.width * 0.7 < screenSize.height ? true : false;
    return directionScreen;
  }

  static ipad(context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isIpad =
        screenSize.width * 1.67 < screenSize.height ? true : false;
    return isIpad;
  }
}
