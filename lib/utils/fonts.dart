import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static final fontReg = GoogleFonts.montserratAlternates(
    fontWeight: FontWeight.normal,
  );

  static final fontBold = GoogleFonts.montserratAlternates(
    fontWeight: FontWeight.bold,
  );

  static final captionReg2 = fontReg.copyWith(
    fontSize: 11.sp,
  );


  static final captionReg1 = fontReg.copyWith(fontSize: 12.sp);

  static final footnoteReg = fontReg.copyWith(fontSize: 13.sp);

  static final subhedlineReg = fontReg.copyWith(fontSize: 15.sp);

  static final calloutReg = fontReg.copyWith(fontSize: 16.sp);

  static final bodyReg = fontReg.copyWith(fontSize: 17.sp);

  static final headlineReg = fontReg.copyWith(fontSize: 17.sp);

  static final titleReg3 = fontReg.copyWith(fontSize: 20.sp);

  static final titleReg2 = fontReg.copyWith(fontSize: 22.sp);

  static final titleReg1 = fontReg.copyWith(fontSize: 28.sp);

  static final largeTitleReg = fontReg.copyWith(fontSize: 34.sp);


  static final captionBold2 = fontBold.copyWith(
    fontSize: 11.sp,
  );


  static final captionBold1 = fontBold.copyWith(fontSize: 12.sp);

  static final footnoteBold = fontBold.copyWith(fontSize: 13.sp);

  static final subhedlineBold = fontBold.copyWith(fontSize: 15.sp);

  static final calloutBold = fontBold.copyWith(fontSize: 16.sp);

  static final bodyBold = fontBold.copyWith(fontSize: 17.sp);

  static final headlineBold = fontBold.copyWith(fontSize: 17.sp);

  static final titleBold3 = fontBold.copyWith(fontSize: 20.sp);

  static final titleBold2 = fontBold.copyWith(fontSize: 22.sp);

  static final titleBold1 = fontBold.copyWith(fontSize: 28.sp);

  static final largeTitleBold = fontBold.copyWith(fontSize: 34.sp);
}
