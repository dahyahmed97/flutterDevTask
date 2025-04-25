import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/assets_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.w, right: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let’s Clock-In!",
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(color: Colors.white),
              ),
              Text(
                "Don’t miss your clock in schedule",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: ColorsCatalog.appPurpleTextVarient,
                ),
              ),
            ],
          ),
          Image.asset(AssetCatalog.clockInArtWork),
        ],
      ),
    );
  }
}
