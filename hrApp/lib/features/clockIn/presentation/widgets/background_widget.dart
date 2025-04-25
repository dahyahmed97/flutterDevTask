import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 233.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsCatalog.appPurbleVariationColor,
            ColorsCatalog.appPurpleGradient,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
    );
  }
}
