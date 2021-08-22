import 'package:flutter/material.dart';

myCardWithButtomBar({
  required Widget cardContent,
  required List<Widget> buttonBarContentList,
  required Color cardColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 5,
      right: 5,
    ),
    child: _card(
      cardContent,
      buttonBarContentList,
      cardColor,
    ),
  );
}

_card(
  Widget cardContent,
  List<Widget> buttonBarContentList,
  Color cardColor,
) {
  List<Widget> fullList = [];
  fullList.add(cardContent);
  fullList.add(Padding(
    padding: const EdgeInsets.all(10),
    child: ButtonBar(
      alignment: MainAxisAlignment.center,
      children: buttonBarContentList,
    ),
  ));

  return Card(
    color: cardColor,
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
