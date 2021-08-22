import 'package:flutter/material.dart';

class ColorsUtil {
  static final white = Colors.white;
  static const black = Colors.black;

  static const bottomMenuSelectedItem = Color(0xFFffff00);
  static const bottomMenuUnselectedItem = Color(0xFF8ca88d);
  static const bottomMenuBackground = Color(0xFF00660C);

  static final buttonGeneral = _getColorFromHex('#FF00660C');
  static final textEditBorderGeneral = _getColorFromHex('#118f06');
  static final textGreyMedium = _getColorFromHex('#7e8580');
  static final textGreyDark = _getColorFromHex('#252625');
  static final textGreyLight = _getColorFromHex('#c8cfca');
  static final lightBackground = Colors.white;

  static final errorMessageRed = _getColorFromHex('#ff0000');
  static final errorButtonBackground = _getColorFromHex('#ba0f0f');

  static final buttonLightGreen = _getColorFromHex('#58c775');
}

Color _getColorFromHex(String hex) {
  return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
}
