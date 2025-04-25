import 'package:flutter/material.dart';
import 'package:flutterdevtask/core/config/screen_size_config.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/styles_catalog.dart';
import 'package:intl/intl.dart';

class Globals {
  static bool isPaymentActive = false;

  static String formatDateToString(DateTime? date, {String locale = 'ar_EG'}) {
    if (date == null) return '';

    // Create a DateFormat instance for short date format
    final DateFormat formatter = DateFormat.yMMMd(
      locale,
    ); // Short date format (e.g., "Jan 5, 2023")

    // Format the date
    return formatter.format(date);
  }

  static String formatStringDate(String inputDate) {
    DateTime date = DateTime.parse(inputDate.toString());
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static DateTime? stringToDate(String date) {
    if (date.isEmpty) {
      return null;
    }

    try {
      return DateFormat('dd/MM/yyyy').parse(date);
    } catch (e) {
      throw FormatException('Invalid date format: $date. Expected dd/MM/yyyy.');
    }
    //return DateTime.parse(date);
  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget content,
  }) {
    return showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.zero,
          padding: Styles.onlyInsetFactor(b: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () => dismissBottomShet(context),
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: ColorsCatalog.appPrimaryTextColor,
                ),
              ),
              content,
            ],
          ),
        );
      },
    );
  }

  static dismissBottomShet(BuildContext context) {
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  static void showAlertDialog(
    BuildContext context, {
    Widget? content,
    Widget? title,
    List<Widget>? actions,
    bool isDismissible = true,
  }) {
    showDialog(
      useRootNavigator: false,
      barrierDismissible: isDismissible,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: title != null ? Center(child: title) : null,
          //todo add style
          // contentTextStyle: Styles.lightText14.copyWith(fontSize: 18),
          // titleTextStyle: Styles.mediumSizeText,
          contentPadding: Styles.symmetricInsetsFactor(h: 1.5, v: 2),
          content: content,
          actions: actions,
        );
      },
    );
  }
}
