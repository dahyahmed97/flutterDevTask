import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';

class GradientButton extends StatelessWidget {
  final Function()? onTap;
  const GradientButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsCatalog.gradientButtonColor1,
              ColorsCatalog.gradientButtonColor2,
              ColorsCatalog.gradientButtonColor3,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'Clock In',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
