import 'package:flutter/material.dart';
import '../config/screen_size_config.dart';

class AppCurvedBody extends StatelessWidget {
  final List<Widget> childs;
  const AppCurvedBody({super.key, required this.childs});

  @override
  Widget build(BuildContext context) {
    return Container(
        //  margin: Styles.onlyInsetFactor(t: 17),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize! * 1.5,
                vertical: SizeConfig.defaultSize! * 3),
            child: SizedBox(
              height: SizeConfig.screenHeight!,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: childs),
              ),
            )));
  }
}
