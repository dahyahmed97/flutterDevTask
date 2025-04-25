import 'package:flutter/material.dart';
import 'package:flutterdevtask/main.dart';

// void showGlobalSnackBar(String message) {
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     scaffoldMessengerKey.currentState?.showSnackBar(
//       SnackBar(
//         content: Text(message),
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   });
// }

// snack_bar_helper.dart
void showGlobalSnackBar(String message) {
  if (scaffoldMessengerKey.currentState?.mounted ?? false) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}
