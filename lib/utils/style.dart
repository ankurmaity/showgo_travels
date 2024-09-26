import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class Style {
  static TextStyle appBarTitleStyle() {
    return GoogleFonts.aboreto(color: ColorTheme.textColor, fontSize: 20);
  }

  static TextStyle appBarMenuStyle() {
    return GoogleFonts.oswald(
        color: ColorTheme.textColor, fontSize: 15, fontWeight: FontWeight.w800);
  }

  static TextStyle serviceTimeStyle(double cardWidth) {
    return GoogleFonts.mukta(
        color: ColorTheme.textColor, fontSize: max(cardWidth * 0.15, 5));
  }

  static TextStyle abhayaLibre({Color color = ColorTheme.textColor}) {
    return GoogleFonts.abhayaLibre(
        color: color, fontSize: 25, fontWeight: FontWeight.w300);
  }

  static TextStyle bungee({Color color = ColorTheme.textColor}) {
    return GoogleFonts.bungee(
        color: color, fontSize: 40, fontWeight: FontWeight.w500);
  }

  static TextStyle signikaNegative(
      {Color color = ColorTheme.textColor,
      double size = 25,
      bool bold = false}) {
    return GoogleFonts.signikaNegative(
        color: color,
        fontSize: size,
        fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
        letterSpacing: 2);
  }

  static TextStyle montserrat({Color color = ColorTheme.textColor}) {
    return GoogleFonts.montserrat(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.w800,
        letterSpacing: 2);
  }
}
