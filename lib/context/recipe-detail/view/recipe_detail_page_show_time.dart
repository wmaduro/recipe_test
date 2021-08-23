import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';

extension RecipeDetailPageStateShowTime on RecipeDetailPageState {
  showTime(int? totalTime) {
    var timeFontSize = MediaQuery.of(context).size.width * .033;
    var distanceBetweenClockAndTime = 7.0;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.watch_later,
          ),
          SizedBox(
            width: distanceBetweenClockAndTime,
          ),
          Text('$totalTime Minutes', style: TextStyle(fontSize: timeFontSize)),
        ],
      ),
    );
  }
}
