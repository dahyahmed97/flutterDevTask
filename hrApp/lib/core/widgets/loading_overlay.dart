import 'package:flutter/material.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;
  LoadingOverlay();
  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder:
            (context) => ColoredBox(
              color: const Color(0x80000000),
              child: Center(
                child: Center(
                  child: LoadingAnimationWidget.hexagonDots(
                    color: ColorsCatalog.appPrimaryTextColor,
                    size: 50,
                  ),
                ),
              ),
            ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}
