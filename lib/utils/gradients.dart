import 'package:flutter/widgets.dart';

class AppGradients {
  static final black = LinearGradient(colors: [Color(0xFF2E335A), Color(0xFF1C1B33)]);

  static final purpleDark = LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [Color(0xFF5936B4), Color(0xFF362A84)]);

  static final purple = LinearGradient(colors: [Color(0xFF3658B1), Color(0xFFC159EC)]);

  static final blue = LinearGradient(colors: [Color(0xFFAEC9FF), Color(0xFF083072)]);

  static final radPurple = RadialGradient(colors: [Color(0xFFF7CBFD), Color(0xFF7758D1)]);

}
