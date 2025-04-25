import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/styles_catalog.dart';
import '../config/screen_size_config.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final Function(String)? onSubmit;
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final Function()? onTap;
  final TextAlign textAlign;
  final bool error;
  final TextInputType? keyboardType;
  final bool digitsOnly;
  final Function(String)? onChanged;
  bool isPassword;
  final TextDirection? textDirection;
  final int? maxLength;
  final double? width;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autovalidateMode;
  final int? maxLines;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final Color? fillColor;
  final bool? filled;
  final InputBorder? borderDecoration;
  final TextStyle? textStyle;
  final bool? isEnabled;
  final List<BoxShadow>? shadow;

  CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.error = false,
    this.keyboardType,
    this.digitsOnly = false,
    this.onChanged,
    this.textDirection,
    this.isPassword = false,
    this.maxLength,
    this.width,
    this.onSubmit,
    this.validator,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines,
    this.focusNode,
    this.suffix,
    this.contentPadding,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffixConstraints,
    this.fillColor,
    this.filled,
    this.borderDecoration,
    this.textStyle,
    this.isEnabled = true,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 255, 0.15),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        enabled: isEnabled,
        enableInteractiveSelection: true,
        style: textStyle ?? Styles.hintText,
        inputFormatters:
            digitsOnly
                ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                : inputFormatters,
        textInputAction: TextInputAction.done,
        textAlignVertical: TextAlignVertical.center,
        maxLength: maxLength,
        focusNode: focusNode,
        onChanged: onChanged,
        textDirection: textDirection,
        keyboardType: keyboardType,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: onTap,
        maxLines: maxLines ?? 1,
        obscureText: isPassword,
        enableSuggestions: true,
        autocorrect: false,
        readOnly: readOnly,
        controller: controller,
        textAlign: textAlign,
        cursorColor: ColorsCatalog.appPrimaryTextColor,
        decoration: decoration,
        validator: validator,
        autovalidateMode: autovalidateMode,
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? Styles.hintStyle,
    prefixIcon: Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
      child: prefix,
    ),
    prefixIconConstraints:
        prefixConstraints ?? const BoxConstraints(minHeight: 22, minWidth: 22),
    suffixIcon: suffix,
    suffixIconConstraints:
        suffixConstraints ?? const BoxConstraints(minHeight: 22, minWidth: 22),
    isDense: true,
    contentPadding:
        contentPadding ?? EdgeInsets.all(SizeConfig.defaultSize! * 1.6),
    fillColor: fillColor ?? Colors.teal,
    filled: false,
    border:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.yellow, width: 1),
        ),
    enabledBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
        ),
    disabledBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
        ),
    errorBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
    focusedBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorsCatalog.appPrimaryTextColor,
            width: 1,
          ),
        ),
  );
}
