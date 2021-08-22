import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

myStyledText(
  String text, {
  TextStyle? textStyleTag = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  ),
  TextStyle textStyleGeneral = const TextStyle(fontSize: 24),
}) {
  return StyledText(
    text: text,
    style: textStyleGeneral,
    tags: {
      'b': StyledTextTag(
        style: textStyleTag,
      ),
    },
  );
}
