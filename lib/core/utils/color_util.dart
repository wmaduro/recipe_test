import 'package:flutter/material.dart';

class ColorsUtil {
  static final appBarBackground = _getColorFromHex('#a8a8a8');
  static final lightBackground = Colors.white;
  static final buttonGeneral = _getColorFromHex('#a8a8a8');
}

Color _getColorFromHex(String hex) {
  return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
}
