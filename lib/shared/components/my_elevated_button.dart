import 'package:flutter/material.dart';

myElevatedButton({
  double borderRadius = 10.0,
  String text = '',
  double imageWidth = 28,
  double imageHeight = 28,
  String? imageAsset,
  required Function callback,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(borderRadius),
      ),
    ),
    label: Text(text),
    icon: SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: imageAsset != null ? Image.asset(imageAsset) : null,
    ),
    onPressed: () {
      callback.call();
    },
  );
}
