import 'package:flutter/material.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/screen_size_config.dart';

class Styles {
  static EdgeInsetsGeometry symmetricInsetsFactor({
    double h = 0.0,
    double v = 0.0,
  }) {
    return EdgeInsets.symmetric(
      vertical: SizeConfig.defaultSize! * v,
      horizontal: SizeConfig.defaultSize! * h,
    );
  }

  static EdgeInsetsGeometry onlyInsetFactor({
    double l = 0.0,
    double t = 0.0,
    double r = 0.0,
    double b = 0.0,
  }) {
    return EdgeInsets.only(
      left: l * SizeConfig.defaultSize!,
      top: t * SizeConfig.defaultSize!,
      right: r * SizeConfig.defaultSize!,
      bottom: b * SizeConfig.defaultSize!,
    );
  }

  static TextStyle hintStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 13,
    fontFamily: GoogleFonts.cairo().fontFamily,
    color: Colors.grey,
  );

  static TextStyle regularGreenText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: GoogleFonts.cairo().fontFamily,
    color: ColorsCatalog.appDarkColor,
  );

  static TextStyle boldGreenText = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: GoogleFonts.cairo().fontFamily,
    color: ColorsCatalog.appDarkColor,
  );

  static TextStyle boldPrimaryText = boldGreenText.copyWith(
    color: ColorsCatalog.appPrimaryTextColor,
    fontSize: 16,
  );

  static TextStyle boldText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.cairo().fontFamily,
  );

  static TextStyle hintText = TextStyle(
    color: ColorsCatalog.appDarkColor,
    fontWeight: FontWeight.w800,
    fontSize: 13,
    fontFamily: GoogleFonts.cairo().fontFamily,
  );

  static TextStyle whiteText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,

    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static const ButtonStyle primaryBtn = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(ColorsCatalog.buttonBackGround),
    shadowColor: WidgetStatePropertyAll(ColorsCatalog.buttonBackGround),
    surfaceTintColor: WidgetStatePropertyAll(ColorsCatalog.buttonBackGround),
    overlayColor: WidgetStatePropertyAll(ColorsCatalog.buttonBackGround),
  );

  static const ButtonStyle whiteBtn = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.white),
    shadowColor: WidgetStatePropertyAll(Colors.white),
    surfaceTintColor: WidgetStatePropertyAll(Colors.white),
    overlayColor: WidgetStatePropertyAll(Colors.white),
  );

  static const BoxShadow customShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    offset: Offset(0, 5),
  );

  static const List<BoxShadow> customShadowList = [
    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
  ];

  static BoxDecoration borderedDecoratedBox = BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 1, color: ColorsCatalog.buttonBackGround),
    borderRadius: BorderRadius.circular(20),
  );
}
