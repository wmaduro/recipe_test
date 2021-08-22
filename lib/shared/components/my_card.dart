import 'package:flutter/material.dart';

myCard({
  required Widget cardContent,
}) {
  return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 5,
        bottom: 6,
      ),
      child: Container(
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: cardContent,
        ),
      ));
}
