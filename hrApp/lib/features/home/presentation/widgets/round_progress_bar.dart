import 'package:flutter/material.dart';

class AnimatedRoundedProgressBar extends StatelessWidget {
  final double progress; // between 0.0 and 1.0
  final Duration duration;
  final Color backgroundColor;
  final Color progressColor;

  const AnimatedRoundedProgressBar({
    super.key,
    required this.progress,
    this.duration = const Duration(milliseconds: 500),
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: progress),
      duration: duration,
      builder: (context, value, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            minHeight: 5,
          ),
        );
      },
    );
  }
}
