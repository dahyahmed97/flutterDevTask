import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;
  const BaseButton(
      {super.key,
      this.text,
      this.child,
      this.onPressed,
      this.buttonStyle,
      this.buttonTextStyle,
      this.isDisabled,
      this.height,
      this.width,
      this.margin,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
