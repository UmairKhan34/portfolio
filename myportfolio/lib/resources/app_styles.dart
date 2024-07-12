import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:sizer/sizer.dart';

class AppTextStyle {
  TextStyle oleoScript(
      {FontWeight? weight,
      double? size,
      TextDecoration? decoration,
      Color? color}) {
    return GoogleFonts.oleoScript(
      fontWeight: weight ?? FontWeight.w400,
      fontSize: size ?? 16.sp,
      decoration: decoration ?? TextDecoration.none,
      color: color ?? R.colors.whiteColor,
    );
  }

  TextStyle poppins(
      {FontWeight? weight,
      double? size,
      TextDecoration? decoration,
      Color? color}) {
    return GoogleFonts.poppins(
      fontWeight: weight ?? FontWeight.w400,
      fontSize: size ?? 16.sp,
      decoration: decoration ?? TextDecoration.none,
      color: color ?? R.colors.whiteColor,
    );
  }
}
