import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/styles_catalog.dart';

import 'base_btn.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled = false,
    super.height,
    super.width,
    super.child,
    super.text,
  });
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
          alignment: alignment ?? Alignment.center,
          child: buildElevatedButtonWidget(context),
        )
        : buildElevatedButtonWidget(context);
  }

  Widget buildElevatedButtonWidget(BuildContext context) {
    return Container(
      height: height ?? 45,
      width: width ?? double.maxFinite,
      margin: margin,
      decoration:
          decoration ??
          Styles.borderedDecoratedBox.copyWith(
            color: ColorsCatalog.buttonBackGround,
          ),
      child: ElevatedButton(
        style: buttonStyle ?? Styles.primaryBtn,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftIcon ?? const SizedBox.shrink(),
            child != null
                ? child!
                : text != null
                ? Text(
                  text!,
                  style:
                      buttonTextStyle ??
                      Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsCatalog.appLightColor,
                      ),
                )
                : const SizedBox.shrink(),
            rightIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
