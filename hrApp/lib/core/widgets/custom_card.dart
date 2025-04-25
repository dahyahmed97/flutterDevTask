import 'package:flutter/material.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/styles_catalog.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;

  const CustomCard({super.key, required this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.symmetricInsetsFactor(h: 1),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: double.maxFinite,
          padding: Styles.symmetricInsetsFactor(h: 0.5, v: 2.5),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: Styles.customShadowList,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            title,
            style: Styles.boldGreenText.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
