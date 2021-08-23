import 'package:flutter/material.dart';

class ColorsUtil {
  static final appBarBackground = _getColorFromHex('#8f8f8f');
  static final lightBackground = Colors.white;
  static final buttonGeneral = _getColorFromHex('#8f8f8f');
}

Color _getColorFromHex(String hex) {
  return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
}
