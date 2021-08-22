import 'package:flutter/material.dart';

myCardWithButtomBar({
  required Widget cardContent,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 5,
      right: 5,
    ),
    child: _card(
      cardContent,
    ),
  );
}

_card(
  Widget cardContent,
) {
  List<Widget> fullList = [];
  fullList.add(cardContent);

  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fullList,
    ),
  );
}
