import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static final fontReg = GoogleFonts.montserratAlternates(
    fontWeight: FontWeight.normal,
  );

  static final fontBold = GoogleFonts.montserratAlternates(
    fontWeight: FontWeight.bold,
  );

  static final captionReg2 = fontReg.copyWith(
    fontSize: 11,
  );

  static final captionReg1 = fontReg.copyWith(fontSize: 12);

  static final footnoteReg = fontReg.copyWith(fontSize: 13);

  static final subhedlineReg = fontReg.copyWith(fontSize: 15);

  static final calloutReg = fontReg.copyWith(fontSize: 16);

  static final bodyReg = fontReg.copyWith(fontSize: 17);

  static final headlineReg = fontReg.copyWith(fontSize: 17);

  static final titleReg3 = fontReg.copyWith(fontSize: 20);

  static final titleReg2 = fontReg.copyWith(fontSize: 22);

  static final titleReg1 = fontReg.copyWith(fontSize: 28);

  static final largeTitleReg = fontReg.copyWith(fontSize: 34);

  static final captionBold2 = fontBold.copyWith(
    fontSize: 11,
  );

  static final captionBold1 = fontBold.copyWith(fontSize: 12);

  static final footnoteBold = fontBold.copyWith(fontSize: 13);

  static final subhedlineBold = fontBold.copyWith(fontSize: 15);

  static final calloutBold = fontBold.copyWith(fontSize: 16);

  static final bodyBold = fontBold.copyWith(fontSize: 17);

  static final headlineBold = fontBold.copyWith(fontSize: 17);

  static final titleBold3 = fontBold.copyWith(fontSize: 20);

  static final titleBold2 = fontBold.copyWith(fontSize: 22);

  static final titleBold1 = fontBold.copyWith(fontSize: 28);

  static final largeTitleBold = fontBold.copyWith(fontSize: 34);

  static final hugeTitleBold = fontBold.copyWith(fontSize: 60);
}
