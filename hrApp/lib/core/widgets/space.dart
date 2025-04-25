import 'package:flutter/material.dart';
import 'package:flutterdevtask/core/config/screen_size_config.dart';

class CustomSpace extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;

  const CustomSpace({
    super.key,
    this.widthFactor = 0.0,
    this.heightFactor = 0.0,
  });
  @override
  Widget build(BuildContext context) => _setSpace();

  SizedBox _setSpace() {
    return SizedBox(
      width: SizeConfig.defaultSize! * widthFactor,
      height: SizeConfig.defaultSize! * heightFactor,
    );
  }
}
