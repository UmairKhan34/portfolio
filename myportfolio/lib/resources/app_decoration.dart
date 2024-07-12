import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppDecoration {
  InputDecoration decoration({
    Widget? suffixIcon,
    Widget? prefixIcon,
    double? padding,
    required String hint,
    TextStyle? textStyle,
    required double radius,
    required Color fillcolor,
    required Color borderColor,
    bool? filled,
  }) {
    return InputDecoration(
      fillColor: fillcolor,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintStyle: textStyle,
      hintText: hint,
      filled: filled,
      contentPadding:
          EdgeInsets.symmetric(vertical: padding ?? 0, horizontal: 2.w),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
