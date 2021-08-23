import 'package:flutter/material.dart';

showBasicList(String title, List<String> elements, context) {
  var titleFontSize = MediaQuery.of(context).size.width * .049;
  var listFontSize = MediaQuery.of(context).size.width * .039;

  List<Text> textList = <Text>[];
  elements.forEach((element) {
    textList.add(Text(element, style: TextStyle(fontSize: listFontSize)));
  });

  return Padding(
    padding: const EdgeInsets.only(
      left: 15,
      right: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: titleFontSize)),
        SizedBox(
          height: 15,
        ),
        Padding(
            padding: const EdgeInsets.only(
              left: 45,
              right: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: textList,
            )),
      ],
    ),
  );
}
