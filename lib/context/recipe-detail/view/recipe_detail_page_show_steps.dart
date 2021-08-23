import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';

extension RecipeDetailPageStateShowSteps on RecipeDetailPageState {
  showSteps(List? steps) {
    var widgetList = <Widget>[];
    steps?.forEach((element) {
      widgetList.add(Text('$element'));
    });

    return Column(children: widgetList);
  }
}
