import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static bool isTablet = false;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    // Adjust scaling for tablets like iPads
    if (screenWidth! > 600) {
      // Use 600px as a rough threshold for tablet screens
      isTablet = true;
      defaultSize = orientation == Orientation.landscape
          ? screenHeight! * 0.016 // Adjusted scaling for tablets
          : screenWidth! * 0.016;
    } else {
      defaultSize = orientation == Orientation.landscape
          ? screenHeight! * 0.024
          : screenWidth! * 0.024;
    }
    if (kDebugMode) {
      print('default size $defaultSize');
    }
  }
}
